@echo off
	REM ~~~~~~~~~~~~ current full build
set PHP_FULLBUILD=8.1

	REM ~~~~~~~~~~~~ TS - NTS 
set PHP_BUILDTS=0
set PHP_BUILDNTS=1

	REM revision & version for pecl_memcache
call %PATH_MODULES_COMMON%\init.bat pecl-memcache
set PECLMEMCACHEGITCOMMIT=%SCM_VERSION%
set PECLMEMCACHEGITBRANCH=%SCM_BRANCH%
set PECLMEMCACHEGITDATE=%SCM_VERSION_DATE%
FOR /F "tokens=* USEBACKQ" %%F in (`c:\sdk\softs\cyg64\bin\find -name 'memcache.c' -type f -exec dirname {} +`) do (set PECLMEMCACHECYGSRCDIR=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`grep PHP_MEMCACHE_VERSION %CYGPATH_SRC%/pecl-memcache/%PECLMEMCACHECYGSRCDIR%/php_memcache.h ^| cut -d^'^"^' -f2`) do (set PECLMEMCACHEVERSION=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`type C:\sdk\batch\modules\pecl-memcache.patch.version`) do (set PECLMEMCACHEPATCHVERSION=%%F)
sed -i -E 's/, PHP_MEMCACHE_VERSION/, "%PECLMEMCACHEVERSION% | branch: %PECLMEMCACHEGITBRANCH% | commit: %PECLMEMCACHEGITCOMMIT%%PECLMEMCACHEPATCHVERSION% | date: %PECLMEMCACHEGITDATE% | https:\/\/github.com\/nono303\/PHP-memcache-dll"/g' %CYGPATH_SRC%/pecl-memcache/%PECLMEMCACHECYGSRCDIR%/memcache.c

	REM init sdk, pecl, src
for %%M in (php-sdk php-geos pecl-text-xdiff php-ext-brotli xdebug php-src) do (call %PATH_MODULES_COMMON%\init.bat %%M)
set PHPVER=%SCM_TAG:~4,3%

	REM other way only first time 'phpsdk_buildtree phpmaster'
if not exist %PATH_SRC%\php-sdk\phpmaster\. mklink /J %PATH_SRC%\php-sdk\phpmaster %PATH_SDK_ROOT%\phpmaster 

	REM ~~~~~~~~~~~~ init var
set LIB=
set INCLUDE=

	REM ~~~~~~~~~~~~ curl
set PHP_CURL=%PATH_INSTALL%\%FOLDER_RELEASE_CURL%\openssl

	REM ~~~~~~~~~~~~ precompiled sdk deps
REM call %PATH_PHP_SDK%\bin\php\do_php %PATH_MODULES%\php-getdeps.php
REM if %ERRORLEVEL% GEQ 1 EXIT /B 1

	REM ~~~~~~~~~~~~ create directory structure
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src %PATH_SRC%\php-src
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\. mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl
for %%E in (pecl-memcache pecl-text-xdiff php-ext-brotli xdebug) do (
	if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E %PATH_SRC%\%%E
)

if exist %PATH_PHP_SDK%\phpsdk-local.bat del /Q /F %PATH_PHP_SDK%\phpsdk-local.bat
xcopy /C /F /Y %PATH_MODULES%\phpsdk-local.bat %PATH_PHP_SDK%\phpsdk-local.bat*

call %PATH_PHP_SDK%\phpsdk-starter.bat -c %MSVC_DEPS% -a %ARCH% %*