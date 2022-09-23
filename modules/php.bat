@echo off
REM fix 'Could not determine '%PHP_SDK_VS%' directory' l.137 in phpsdk_setshell.bat
set PHP_SDK_VC_DIR=%PATH_VS%\VC
	REM ~~~~~~~~~~~~ current full build
set PHP_FULLBUILD=8.1

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
	REM link openssl3 sources to module (applink.c)
if exist %PATH_SRC%\php-src\openssl\. rmdir /S /Q %PATH_SRC%\php-src\openssl
mklink /J %PATH_SRC%\php-src\openssl %PATH_SRC%\%OPENSSL_SCM%\ms
	REM VERSION PATCH
if exist %PATH_MODULES%\php%PHPVER%_php-src.patch (
	echo     # apply php%PHPVER%_php-src.patch
	git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\php%PHPVER%_php-src.patch
)

	REM ~~~~~~~~~~~~ php-geos
call %PATH_MODULES_COMMON%\init.bat php-geos

	REM ~~~~~~~~~~~~ xdebug
call %PATH_MODULES_COMMON%\init.bat xdebug

	REM ~~~~~~~~~~~~ pecl-memcache
call %PATH_MODULES_COMMON%\init.bat pecl-memcache
	REM revision & version for pecl_memcache in phpinfo()
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\find -name 'memcache.c' -type f -exec dirname {} +`) do (set PECLMEMCACHECYGSRCDIR=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`grep PHP_MEMCACHE_VERSION %CYGPATH_SRC%/pecl-memcache/%PECLMEMCACHECYGSRCDIR%/php_memcache.h ^| cut -d^'^"^' -f2`) do (set PECLMEMCACHEVERSION=%%F)
sed -i -E 's/, PHP_MEMCACHE_VERSION/, "%PECLMEMCACHEVERSION% | branch: %SCM_BRANCH% | commit: %SCM_COMORREV% | date: %SCM_COMORREV_DATE% | https:\/\/github.com\/nono303\/PHP-memcache-dll"/g' %CYGPATH_SRC%/pecl-memcache/%PECLMEMCACHECYGSRCDIR%/memcache.c
	REM VERSION PATCH
if exist %PATH_MODULES%\php%PHPVER%_pecl-memcache.patch (
	echo     # apply php%PHPVER%_pecl-memcache.patch
	git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\php%PHPVER%_pecl-memcache.patch
)

	REM ~~~~~~~~~~~~ pecl-text-xdiff : libxdiff version
cd /D %PATH_SRC%\libxdiff
FOR /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set LIB_VERSION=%%F)
call %PATH_MODULES_COMMON%\init.bat pecl-text-xdiff
sed -i 's/extern char libxdiff_version/\/\/ extern char libxdiff_version/g' %CYGPATH_SRC%/pecl-text-xdiff/xdiff.c
sed -i 's/libxdiff_version)/"%LIB_VERSION:~1%")/g' %CYGPATH_SRC%/pecl-text-xdiff/xdiff.c

	REM ~~~~~~~~~~~~ php-ext-brotli : brotli version
cd /D %PATH_SRC%\brotli
FOR /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set LIB_VERSION=%%F)
call %PATH_MODULES_COMMON%\init.bat php-ext-brotli
sed -i -E 's/BROTLI_LIB_VERSION(.), "([^\"]+)"/BROTLI_LIB_VERSION\1, "%LIB_VERSION:~1%"/g' %CYGPATH_SRC%/php-ext-brotli/config.w32
	REM link brotli sources to module
if exist %PATH_SRC%\php-ext-brotli\brotli\. rmdir /S /Q %PATH_SRC%\php-ext-brotli\brotli
mklink /J %PATH_SRC%\php-ext-brotli\brotli %PATH_SRC%\brotli

	REM ~~~~~~~~~~~~ php-sdk
call %PATH_MODULES_COMMON%\init.bat php-sdk

set PHP_SRC_DIR=%PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src
set PHP_BUILD_DIR=%PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\build
	REM other way only first time 'phpsdk_buildtree phpmaster'
if not exist %PATH_SRC%\php-sdk\phpmaster\. mklink /J %PATH_SRC%\php-sdk\phpmaster %PATH_SDK_ROOT%\phpmaster 
	REM create directory structure
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src %PATH_SRC%\php-src
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\. mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl
for %%E in (pecl-memcache pecl-text-xdiff php-ext-brotli xdebug php-geos php-ext-zstd) do (
	if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E %PATH_SRC%\%%E
)
if exist %PATH_PHP_SDK%\phpsdk-local.bat del /Q /F %PATH_PHP_SDK%\phpsdk-local.bat
xcopy /C /F /Y %PATH_MODULES%\phpsdk-local.bat %PATH_PHP_SDK%\*

call %PATH_PHP_SDK%\phpsdk-starter.bat -c %MSVC_DEPS% -a %ARCH% %*