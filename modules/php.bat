@echo off
REM fix 'Could not determine '%PHP_SDK_VS%' directory' l.137 in phpsdk_setshell.bat
set PHP_SDK_VC_DIR=%PATH_VS%\Common7\Tools
	REM ~~~~~~~~~~~~ TS - NTS
set PHP_BUILDTS=1
set PHP_BUILDNTS=0

REM ********
REM * INIT *
REM ********

	REM ~~~~~~~~~~~~ php-src
call %PATH_MODULES_COMMON%\init.bat php-src
set PHPVER=%GET_VERSION:~0,3%
set PHPVERFULL=%GET_VERSION%

	REM ~~~~~~~~~~~~ type of build : full / memcached / xdebug
set PHP_BUILD_TYPE=%PHPVER%
set PHP_XTRALIBS=
setlocal enabledelayedexpansion
set argCount=0
for %%x in (%*) do (
   set /A argCount+=1
   set "argVec[!argCount!]=%%~x"
)
for /L %%i in (2,1,%argCount%) do (
	if /I "!argVec[%%i]!"=="XDEBUG"		set PHP_BUILD_TYPE=xdebug
	if /I "!argVec[%%i]!"=="MEMCACHE"	set PHP_BUILD_TYPE=memcache
	if /I "!argVec[%%i]!"=="BROTLI"		set PHP_BUILD_TYPE=brotli
	if /I "!argVec[%%i]!"=="IGBINARY"	set PHP_BUILD_TYPE=igbinary
	if /I "!argVec[%%i]!"=="PARALLEL"	set PHP_BUILD_TYPE=parallel
	if /I "!argVec[%%i]!"=="FFI"		set PHP_BUILD_TYPE=ffi
	if /I "!argVec[%%i]!"=="CORE" 		set PHP_BUILD_TYPE=core
	if /I "!argVec[%%i]!"=="WIN7" (
		REM TODO comment for full build
		set PHP_BUILD_TYPE=win7
		if %ARG_KEEPSRC% == 0 (call %PATH_UTILS%\gitapply %PATH_PATCHES%\php-src\%PHPVER%\win7.patch)
	)
)

	REM ~~~~~~~~~~~~ check prereq deps
if %PHP_BUILD_TYPE% == memcache	(
	if not exist %PATH_INSTALL%\lib\zlib.lib (call go.bat zlib NOLOG)
)
if %PHP_BUILD_TYPE% == brotli	(
	if not exist %PATH_INSTALL%\%DIR_LIB_STATIC%\libbrotlicommon.lib (call go.bat brotli static NOLOG)
	set PHP_XTRALIBS=;%PATH_INSTALL%\%DIR_LIB_STATIC%\
)
if %PHP_BUILD_TYPE% == win7	(
	if not exist %PATH_INSTALL%\lib\zlib.lib (call go.bat zlib NOLOG)
	if not exist %PATH_INSTALL%\lib\liblzma.lib (call go.bat liblzma NOLOG)
	if not exist %PATH_INSTALL%\lib\icudt.lib (call go.bat icu NOLOG)
	if not exist %PATH_INSTALL%\lib\libiconv.lib (call go.bat libiconv NOLOG)
	if not exist %PATH_INSTALL%\lib\libxml2_a_dll.lib (call go.bat libxml2 NOLOG)
)

if %ARG_KEEPSRC% == 0 (
	REM ~~~~~~~~~~~~ GENERATE zend_vm
	echo    # generate zend_vm
	call do_php %PATH_SRC%\php-src\Zend\zend_vm_gen.php | gawk '{print "     " $0}' 2>&1
	
	REM ~~~~~~~~~~~~ PHP-SRC version PATCH
	REM if exist %PATH_PATCHES%\php-src\%PHPVER%\php-src.patch (call %PATH_UTILS%\gitapply %PATH_PATCHES%\php-src\%PHPVER%\php-src.patch)
	REM ~~~~~~~~~~~~ PHP-SRC ext PATCH
	for /f "tokens=*" %%P in ('dir %PATH_PATCHES%\php-src\%PHPVER%\ext-*.patch /s/b') do (call %PATH_UTILS%\gitapply %%P)
	REM ~~~~~~~~~~~~ PHP-SRC pr PATCH
	for /f "tokens=*" %%P in ('dir %PATH_PATCHES%\php-src\%PHPVER%\pr*.patch /s/b') do (call %PATH_UTILS%\gitapply %%P)
	
	REM ~~~~~~~~~~~~ DEF - Makefile: PHP_DLL_DEF_SOURCES
	set DEF_EXPORTS=%PATH_SRC%\php-src\ext\libxml\php_libxml2.def
	echo EXPORTS > !DEF_EXPORTS!
	dumpbin /EXPORTS %PATH_INSTALL%\lib\libxml2.lib | grep -P '\s{18}' | sed 's/^ *//g' >> !DEF_EXPORTS!
	echo    # rebuild !DEF_EXPORTS!
	
	set DEF_EXPORTS=%PATH_SRC%\php-src\ext\pcre\ext_pcre.def
	echo EXPORTS > !DEF_EXPORTS!
	dumpbin /EXPORTS %PATH_INSTALL%\lib\pcre2-8.lib | grep -P '\s{18}' | sed 's/^ *//g' >> !DEF_EXPORTS!
	echo    # build !DEF_EXPORTS!
)

	REM ~~~~~~~~~~~~ pecl-memcache
call %PATH_MODULES_COMMON%\init.bat pecl-memcache
	REM revision & version for pecl_memcache in phpinfo()
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\find -name 'memcache.c' -type f -exec dirname {} +`) do (set PECLMEMCACHECYGSRCDIR=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`grep PHP_MEMCACHE_VERSION %CYGPATH_SRC%/pecl-memcache/%PECLMEMCACHECYGSRCDIR%/php_memcache.h ^| cut -d^'^"^' -f2`) do (set PECLMEMCACHEVERSION=%%F)
sed -i -E 's/, PHP_MEMCACHE_VERSION/, "%PECLMEMCACHEVERSION% | branch: %SCM_BRANCH% | commit: %SCM_COMORREV% | date: %SCM_COMORREV_DATE% | https:\/\/github.com\/nono303\/PHP-memcache-dll"/g' %CYGPATH_SRC%/pecl-memcache/%PECLMEMCACHECYGSRCDIR%/memcache.c
REM echo %PECLMEMCACHEVERSION% ^| branch: %SCM_BRANCH% ^| commit: %SCM_COMORREV% ^| date: %SCM_COMORREV_DATE%

	REM ~~~~~~~~~~~~ pecl-text-xdiff : libxdiff version
cd /D %PATH_SRC%\libxdiff
FOR /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set LIB_VERSION=%%F)
call %PATH_MODULES_COMMON%\init.bat pecl-text-xdiff
sed -i 's/extern char libxdiff_version/\/\/ extern char libxdiff_version/g' %CYGPATH_SRC%/pecl-text-xdiff/xdiff.c
sed -i 's/libxdiff_version)/"%LIB_VERSION:~1%")/g' %CYGPATH_SRC%/pecl-text-xdiff/xdiff.c

	REM ~~~~~~~~~~~~ php-ext-brotli : brotli version
call %PATH_MODULES_COMMON%\init.bat php-ext-brotli
FOR /F "tokens=* USEBACKQ" %%F in (`do_php %PATH_UTILS%\sub\version.php brotli`) do (set BROTLI_VERSION=%%F)
sed -i 's/AC_DEFINE..USE_BROTLI_DICTIONARY./AC_DEFINE\("BROTLI_LIB_VERSION", "%BROTLI_VERSION%", "system library version"\);\n    AC_DEFINE\("USE_BROTLI_DICTIONARY"/g' %CYGPATH_SRC%/php-ext-brotli/config.w32

	REM ~~~~~~~~~~~~ other PECL init
for %%E in (php-sdk xdebug php-geos php-proj php-ogr php-ext-zstd pecl-datetime-timezonedb pecl-system-sync pecl-igbinary pecl-parallel) do (
	call %PATH_MODULES_COMMON%\init.bat %%E
	if exist %PATH_PATCHES%\php-src\%PHPVER%\pecl-%%E.patch (call %PATH_UTILS%\gitapply %PATH_PATCHES%\php-src\%PHPVER%\pecl-%%E.patch)
)

set PHP_SRC_DIR=%PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src
set PHP_BUILD_DIR=%PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\build
	REM other way only first time 'phpsdk_buildtree phpmaster'
if not exist %PATH_SRC%\php-sdk\phpmaster\. mklink /J %PATH_SRC%\php-sdk\phpmaster %PATH_SDK_ROOT%\phpmaster
	REM create directory structure
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src %PATH_SRC%\php-src
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\. mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl
for %%E in (pecl-datetime-timezonedb pecl-memcache pecl-text-xdiff php-ext-brotli php-ext-zstd php-geos php-ogr php-proj xdebug pecl-igbinary pecl-parallel pecl-system-sync) do (
	if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E %PATH_SRC%\%%E
)
if exist %PATH_PHP_SDK%\phpsdk-local.bat rm -fv %PATH_PHP_SDK%\phpsdk-local.bat
xcopy /C /F /Y %PATH_MODULES%\phpsdk-local.bat %PATH_PHP_SDK%\*

call %PATH_PHP_SDK%\phpsdk-starter.bat -c %MSVC_DEPS% -a %ARCH% -s %vcvars_ver%