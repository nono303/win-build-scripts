@echo off
REM fix 'Could not determine '%PHP_SDK_VS%' directory' l.137 in phpsdk_setshell.bat
set PHP_SDK_VC_DIR=%PATH_VS%\Common7\Tools
	REM ~~~~~~~~~~~~ TS - NTS 
set PHP_BUILDTS=0
set PHP_BUILDNTS=1

REM ********
REM * INIT *
REM ********

	REM ~~~~~~~~~~~~ var
set LIB=
set INCLUDE=

	REM ~~~~~~~~~~~~ php-src
call %PATH_MODULES_COMMON%\init.bat php-src
set PHPVER=%SCM_TAG:~4,3%

	REM ~~~~~~~~~~~~ type of build : full / memcached / xdebug
set PHP_BUILD_TYPE=%PHPVER%
setlocal enabledelayedexpansion
for %%x in (%*) do (
   set /A argCount+=1
   set "argVec[!argCount!]=%%~x"
)
for /L %%i in (2,1,%argCount%) do (
	if /I "!argVec[%%i]!"=="XDEBUG"		set PHP_BUILD_TYPE=xdebug
	if /I "!argVec[%%i]!"=="MEMCACHE"	set PHP_BUILD_TYPE=memcache
)
	REM php < 8.4 : link openssl3 sources to module (applink.c)
if %PHPVER% LSS 8.4 (
	if exist %PATH_SRC%\php-src\openssl\. rmdir /S /Q %PATH_SRC%\php-src\openssl
	mklink /J %PATH_SRC%\php-src\openssl %PATH_SRC%\%OPENSSL_SCM%\ms
)

	REM VERSION PATCH
if exist %PATH_MODULES%\php-src_%PHPVER%.patch (
	if %ARG_KEEPSRC% == 0 (
		echo     # apply php-src_%PHPVER%.patch
		git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\php-src_%PHPVER%.patch
	)
)

	REM ~~~~~~~~~~~~ pecl-memcache
call %PATH_MODULES_COMMON%\init.bat pecl-memcache
	REM revision & version for pecl_memcache in phpinfo()
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\find -name 'memcache.c' -type f -exec dirname {} +`) do (set PECLMEMCACHECYGSRCDIR=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`grep PHP_MEMCACHE_VERSION %CYGPATH_SRC%/pecl-memcache/%PECLMEMCACHECYGSRCDIR%/php_memcache.h ^| cut -d^'^"^' -f2`) do (set PECLMEMCACHEVERSION=%%F)
sed -i -E 's/, PHP_MEMCACHE_VERSION/, "%PECLMEMCACHEVERSION% | branch: %SCM_BRANCH% | commit: %SCM_COMORREV% | date: %SCM_COMORREV_DATE% | https:\/\/github.com\/nono303\/PHP-memcache-dll"/g' %CYGPATH_SRC%/pecl-memcache/%PECLMEMCACHECYGSRCDIR%/memcache.c
echo %PECLMEMCACHEVERSION% ^| branch: %SCM_BRANCH% ^| commit: %SCM_COMORREV% ^| date: %SCM_COMORREV_DATE%

	REM ~~~~~~~~~~~~ pecl-text-xdiff : libxdiff version
cd /D %PATH_SRC%\libxdiff
FOR /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set LIB_VERSION=%%F)
call %PATH_MODULES_COMMON%\init.bat pecl-text-xdiff
sed -i 's/extern char libxdiff_version/\/\/ extern char libxdiff_version/g' %CYGPATH_SRC%/pecl-text-xdiff/xdiff.c
sed -i 's/libxdiff_version)/"%LIB_VERSION:~1%")/g' %CYGPATH_SRC%/pecl-text-xdiff/xdiff.c

	REM ~~~~~~~~~~~~ php-ext-brotli : brotli version
call %PATH_MODULES_COMMON%\init.bat php-ext-brotli
call %PATH_MODULES_COMMON%\init.bat brotli varonly
sed -i 's/AC_DEFINE/AC_DEFINE\("BROTLI_LIB_VERSION", "%SCM_TAG:~1%", "system library version"\);AC_DEFINE/g' %CYGPATH_SRC%/php-ext-brotli/config.w32

	REM ~~~~~~~~~~~~ other PECL init
for %%E in (pecl-datetime-timezonedb php-geos php-ext-zstd php-proj php-ogr xdebug php-sdk pecl-system-sync) do (
	call %PATH_MODULES_COMMON%\init.bat %%E
)

set PHP_SRC_DIR=%PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src
set PHP_BUILD_DIR=%PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\build
	REM other way only first time 'phpsdk_buildtree phpmaster'
if not exist %PATH_SRC%\php-sdk\phpmaster\. mklink /J %PATH_SRC%\php-sdk\phpmaster %PATH_SDK_ROOT%\phpmaster 
	REM create directory structure
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src %PATH_SRC%\php-src
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\. mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl
for %%E in (pecl-datetime-timezonedb pecl-memcache pecl-text-xdiff php-ext-brotli php-ext-zstd php-geos php-ogr php-proj xdebug) do (
	if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E %PATH_SRC%\%%E
)
if exist %PATH_PHP_SDK%\phpsdk-local.bat del /Q /F %PATH_PHP_SDK%\phpsdk-local.bat
xcopy /C /F /Y %PATH_MODULES%\phpsdk-local.bat %PATH_PHP_SDK%\*

call %PATH_PHP_SDK%\phpsdk-starter.bat -c %MSVC_DEPS% -a %ARCH% -s %vcvars_ver%