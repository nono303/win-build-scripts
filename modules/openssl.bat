@echo off
	REM warning: failed to remove NUL: Invalid argument
if exist %PATH_SRC%\%1\NUL rm -fv  /S /Q %PATH_BUILD%\%PATH_SRC%\%1\NUL

call %PATH_UTILS%\init.bat %1
	REM https://wiki.openssl.org/index.php/Compilation_and_Installation
	REM no-deprecated / -DOPENSSL_NO_DEPRECATED_3_0 (https://github.com/openssl/openssl/pull/13866) : failed for libssh2 / apr
	
if NOT "%C_STD_VER%"=="" (
	set __CNFC=/std:c%C_STD_VER%
)

if "%2"=="svn" (
	set CONFIGURE_OPENSSL=no-brotli no-zstd
) else (
	set CONFIGURE_OPENSSL=--with-brotli-include=%PATH_INSTALL:\=/%/include ^
	--with-brotli-lib=brotlicommon ^
	--with-zstd-include=%PATH_INSTALL:\=/%/include ^
	--with-zstd-lib=libzstd
)

	REM !! --with-zlib-lib require the full path or name in PATH of zlib DLL without dll extension !!
perl Configure %perlbuild% ^
--prefix=%PATH_INSTALL% ^
--openssldir=%PATH_INSTALL%\conf ^
shared ^
no-asan ^
no-tests ^
no-unit-test ^
no-external-tests ^
no-acvp-tests ^
no-allocfail-tests ^
no-external-tests ^
no-weak-ssl-ciphers ^
no-buildtest-c++ ^
no-docs ^
threads ^
enable-hqinterop ^
zlib ^
zlib-dynamic ^
--with-zlib-include=%PATH_INSTALL:\=/%/include ^
--with-zlib-lib=z ^
/DNDEBUG /Ob3 /GL /Gw /Zc:inline /Zf /FS /MP%NUMBER_OF_PROCESSORS% /cgthreads8 %__CNFC% %AVX% ^
%CONFIGURE_OPENSSL%

jom %JOM_OPTS% build_modules build_programs install_dev
REM install_modules install_programs cause 'Trying to rename makefile-21040 -> makefile: Permission denied'

if not exist %PATH_INSTALL%\lib\ossl-modules\. mkdir %PATH_INSTALL%\lib\ossl-modules

for %%i in (\apps\openssl.exe) do (
	xcopy /C /F /Y %PATH_SRC%\%1\%%i %PATH_INSTALL%\bin\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%~pi%%~ni.pdb %PATH_INSTALL%\bin\*
)
for %%i in (libcrypto libssl) do (
	xcopy /C /F /Y %PATH_SRC%\%1\%%i-%OPENSSLVER%-x64.dll %PATH_INSTALL%\bin\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%i-%OPENSSLVER%-x64.pdb %PATH_INSTALL%\bin\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%i.lib %PATH_INSTALL%\lib\*
)
for %%i in (\providers\legacy.dll) do (
	xcopy /C /F /Y %PATH_SRC%\%1\%%i %PATH_INSTALL%\bin\ossl-modules\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%~pi%%~ni.pdb %PATH_INSTALL%\bin\ossl-modules\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%~pi%%~ni.lib %PATH_INSTALL%\lib\ossl-modules\*
)
for %%i in (ossl-modules\legacy.dll libcrypto-%OPENSSLVER%-x64.dll libssl-%OPENSSLVER%-x64.dll openssl.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%i)

rm -fv %PATH_INSTALL%\bin\c_rehash.pl