@echo off
	REM warning: failed to remove NUL: Invalid argument
if exist %PATH_SRC%\%1\NUL rm -fv  /S /Q %PATH_BUILD%\%PATH_SRC%\%1\NUL

call %PATH_MODULES_COMMON%\init.bat %1
	REM https://wiki.openssl.org/index.php/Compilation_and_Installation
	REM no-deprecated / -DOPENSSL_NO_DEPRECATED_3_0 (https://github.com/openssl/openssl/pull/13866) : failed for libssh2 / apr
	
if NOT "%C_STD_VER%"=="" (
	set __CNFC=/std:c%C_STD_VER%
	set __CNFCXX=/std:c++%C_STD_VER%
)

set CONFIGURE_OPENSSL=--with-brotli-include=%PATH_INSTALL:\=/%/include ^
--with-brotli-lib=brotlicommon ^
--with-zstd-include=%PATH_INSTALL:\=/%/include ^
--with-zstd-lib=libzstd
if "%2"=="svn" (set CONFIGURE_OPENSSL=no-brotli no-zstd)

	REM !! --with-zlib-lib require the full path or name in PATH of zlib DLL without dll extension !!
perl Configure %perlbuild% ^
--prefix=%PATH_INSTALL% ^
--openssldir=%PATH_INSTALL%\conf ^
shared ^
no-asan ^
no-tests ^
no-unit-test ^
no-external-tests ^
no-ssl3 ^
no-weak-ssl-ciphers ^
no-docs ^
threads ^
enable-hqinterop ^
zlib ^
zlib-dynamic ^
--with-zlib-include=%PATH_INSTALL:\=/%/include ^
--with-zlib-lib=zlib ^
/Ob3 /GL /Gw /Zc:inline /Zf /FS /MP%NUMBER_OF_PROCESSORS% /cgthreads8 %__CNFCXX% %AVX% ^
%CONFIGURE_OPENSSL%

REM perl configdata.pm --dump

jom %JOM_OPTS% build_modules build_programs install_dev

for %%i in (engines-3 ossl-modules) do (
	if not exist %PATH_INSTALL%\bin\%%i\. mkdir %PATH_INSTALL%\bin\%%i
	if not exist %PATH_INSTALL%\lib\%%i\. mkdir %PATH_INSTALL%\lib\%%i
)
for %%i in (\apps\openssl.exe) do (
	xcopy /C /F /Y %PATH_SRC%\%1\%%i %PATH_INSTALL%\bin\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%~pi%%~ni.pdb %PATH_INSTALL%\bin\*
)
for %%i in (libcrypto libssl) do (
	xcopy /C /F /Y %PATH_SRC%\%1\%%i-3-x64.dll %PATH_INSTALL%\bin\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%i-3-x64.pdb %PATH_INSTALL%\bin\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%i.lib %PATH_INSTALL%\lib\*
)
for %%i in (\engines\capi.dll \engines\dasync.dll \engines\loader_attic.dll \engines\padlock.dll) do (
	xcopy /C /F /Y %PATH_SRC%\%1\%%i %PATH_INSTALL%\bin\engines-3\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%~pi%%~ni.pdb %PATH_INSTALL%\bin\engines-3\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%~pi%%~ni.lib %PATH_INSTALL%\lib\engines-3\*
)
for %%i in (\providers\legacy.dll) do (
	xcopy /C /F /Y %PATH_SRC%\%1\%%i %PATH_INSTALL%\bin\ossl-modules\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%~pi%%~ni.pdb %PATH_INSTALL%\bin\ossl-modules\*
	xcopy /C /F /Y %PATH_SRC%\%1\%%~pi%%~ni.lib %PATH_INSTALL%\lib\ossl-modules\*
)
for %%i in (engines-3\dasync.dll engines-3\capi.dll engines-3\loader_attic.dll engines-3\padlock.dll ossl-modules\legacy.dll libcrypto-3-x64.dll libssl-3-x64.dll openssl.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%i)

rm -fv %PATH_INSTALL%\bin\c_rehash.pl