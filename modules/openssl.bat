@echo off && call %PATH_UTILS%\init.bat %1
	REM https://wiki.openssl.org/index.php/Compilation_and_Installation
	REM no-deprecated / -DOPENSSL_NO_DEPRECATED_3_0 (https://github.com/openssl/openssl/pull/13866) : failed for libssh2 / apr

	REM tmp https://github.com/openssl/openssl/pull/31183
set "CC="
call %PATH_UTILS%\gitapply %PATH_PATCHES%\openssl-pr31183.patch

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
no-ssl3 ^
no-docs ^
threads ^
enable-hqinterop ^
zlib ^
zlib-dynamic ^
--with-zlib-include=%PATH_INSTALL:\=/%/include ^
--with-zlib-lib=z ^
/DNDEBUG /Ob3 /GL /Gw /Zc:inline /Zf /FS /MP%NUMBER_OF_PROCESSORS% /cgthreads8 %__CNFC% %AVX% ^
%CONFIGURE_OPENSSL%

	REM nmake mono-threaded build : slow
REM nmake %NMAKE_OPTS% install_sw
jom %JOM_OPTS% build_modules build_programs install_dev
REM install_modules install_programs install_engines cause 'Trying to rename makefile-21040 -> makefile: Permission denied'

for %%i in (engines-%OPENSSLVER% ossl-modules) do (
	if not exist %PATH_INSTALL%\bin\%%i\. mkdir %PATH_INSTALL%\bin\%%i
	if not exist %PATH_INSTALL%\lib\%%i\. mkdir %PATH_INSTALL%\lib\%%i
)
for %%i in (\apps\openssl.exe) do (
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\%%i %PATH_INSTALL%\bin\*
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\%%~pi%%~ni.pdb %PATH_INSTALL%\bin\*
)
for %%i in (libcrypto libssl) do (
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\%%i-%OPENSSLVER%-x64.dll %PATH_INSTALL%\bin\*
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\%%i-%OPENSSLVER%-x64.pdb %PATH_INSTALL%\bin\*
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\%%i.lib %PATH_INSTALL%\lib\*
)
for %%i in (\engines\capi.dll \engines\dasync.dll \engines\loader_attic.dll \engines\padlock.dll) do (
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\%%i %PATH_INSTALL%\bin\engines-%OPENSSLVER%\*
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\%%~pi%%~ni.pdb %PATH_INSTALL%\bin\engines-%OPENSSLVER%\*
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\%%~pi%%~ni.lib %PATH_INSTALL%\lib\engines-%OPENSSLVER%\*
)
for %%i in (\providers\legacy.dll) do (
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\%%i %PATH_INSTALL%\bin\ossl-modules\*
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\%%~pi%%~ni.pdb %PATH_INSTALL%\bin\ossl-modules\*
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\%%~pi%%~ni.lib %PATH_INSTALL%\lib\ossl-modules\*
)
for %%i in (engines-%OPENSSLVER%\dasync.dll engines-%OPENSSLVER%\capi.dll engines-%OPENSSLVER%\loader_attic.dll engines-%OPENSSLVER%\padlock.dll ossl-modules\legacy.dll libcrypto-%OPENSSLVER%-x64.dll libssl-%OPENSSLVER%-x64.dll openssl.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%i)