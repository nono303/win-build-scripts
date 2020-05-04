	REM ~~~~~~~~~~~~ init src
for %%M in (php-src pecl-memcache pecl-text-xdiff php-ext-brotli xdebug) do (call %PATH_MODULES_COMMON%\init.bat %%M)
cd /D %PATH_SRC%/php-sdk
git reset --hard
	REM !! erase all /phpmaster
REM git clean -fdx
git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\php-sdk.patch

	REM ~~~~~~~~~~~~ init var
set LIB=
set INCLUDE=
	REM set 1 to build TS (thread safe)
set PHP_BUILDTS=0

	REM ~~~~~~~~~~~~ curl
set CURL_BTYPE=dll
set CURL_VER=openssl-ssh2_%CURL_BTYPE%_deps-dll
set PHP_CURL=%PATH_INSTALL%\curl\%CURL_VER%
if %CURL_BTYPE% == dll (set CURL_LIB_NAME=libcurl.dll)
if %CURL_BTYPE% == static (set CURL_LIB_NAME=curl.exe)

	REM ~~~~~~~~~~~~ php version
cd /D %PATH_SRC%\php-src
FOR /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do ( set PHPGITVER=%%F )
set PHPVER=%PHPGITVER:~4,3%

	REM ~~~~~~~~~~~~ precompiled sdk deps
call %PATH_PHP_SDK%\bin\php\do_php %PATH_MODULES%\php-getdeps.php

	REM ~~~~~~~~~~~~ create directory structure
	REM other way only first time 'phpsdk_buildtree phpmaster'
	REM mklink php-src & pecl > phpmaster
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src %PATH_SRC%\php-src
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\. mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl
for %%E in (pecl-memcache pecl-text-xdiff php-ext-brotli xdebug) do (
	if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E %PATH_SRC%\%%E
)
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\build\. mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\build
del /Q /F %PATH_PHP_SDK%\phpsdk-local.bat
mklink /H %PATH_PHP_SDK%\phpsdk-local.bat %PATH_MODULES%\phpsdk-local.bat

call %PATH_PHP_SDK%\phpsdk-%MSVC_DEPS%-%ARCH%.bat