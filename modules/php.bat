	REM ~~~~~~~~~~~~ init src
for %%M in (php-src pecl-memcache pecl-text-xdiff php-ext-brotli xdebug php-sdk) do (call %PATH_MODULES_COMMON%\init.bat %%M)
	REM revision for pecl_memcache
cd /D %PATH_SRC%\pecl-memcache
FOR /F "tokens=* USEBACKQ" %%F in (`git rev-parse --short HEAD`) do (set PECLMEMCACHEGITCOMMIT=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`git rev-parse --abbrev-ref HEAD`) do (set PECLMEMCACHEGITBRANCH=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`git show -s --format^=%%cd --date=short %PECLMEMCACHEGITCOMMIT%`) do (set PECLMEMCACHEGITDATE=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`grep PHP_MEMCACHE_VERSION /cygdrive/c/sdk/src/pecl-memcache/src/php_memcache.h ^| cut -d^'^"^' -f2`) do (set PECLMEMCACHEVERSION=%%F)
sed -i 's/\$Revision\$/%PECLMEMCACHEGITBRANCH% commit: %PECLMEMCACHEGITCOMMIT% (%PECLMEMCACHEGITDATE%)/g' %PATH_SRC%/pecl-memcache/src/memcache.c

	REM other way only first time 'phpsdk_buildtree phpmaster'
if not exist %PATH_SRC%\php-sdk\phpmaster\. mklink /J %PATH_SRC%\php-sdk\phpmaster %PATH_SDK_ROOT%\phpmaster 

	REM ~~~~~~~~~~~~ init var
set LIB=
set INCLUDE=
	REM set 1 to build TS (thread safe)
set PHP_BUILDTS=1

	REM ~~~~~~~~~~~~ curl
set PHP_CURL=%PATH_INSTALL%\curl\openssl

	REM ~~~~~~~~~~~~ php version
cd /D %PATH_SRC%\php-src
FOR /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do ( set PHPGITVER=%%F )
set PHPVER=%PHPGITVER:~4,3%

	REM ~~~~~~~~~~~~ precompiled sdk deps
call %PATH_PHP_SDK%\bin\php\do_php %PATH_MODULES%\php-getdeps.php

	REM ~~~~~~~~~~~~ create directory structure
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src %PATH_SRC%\php-src
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\. mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl
for %%E in (pecl-memcache pecl-text-xdiff php-ext-brotli xdebug) do (
	if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E %PATH_SRC%\%%E
)
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\build\. mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\build
if exist %PATH_PHP_SDK%\phpsdk-local.bat del /Q /F %PATH_PHP_SDK%\phpsdk-local.bat
xcopy /C /F /Y %PATH_MODULES%\phpsdk-local.bat %PATH_PHP_SDK%\phpsdk-local.bat*

call %PATH_PHP_SDK%\phpsdk-%MSVC_DEPS%-%ARCH%.bat