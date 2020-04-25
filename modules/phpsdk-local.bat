	REM only at init
REM phpsdk_buildtree phpmaster

call %PATH_MODULES_COMMON%\init.bat php-src

	REM ~~~~~~~~~~~~ Openssl in PHAR
sed -i 's/libeay32st/libcrypto/g' %CYGPATH_SRC%/php-src/ext/phar/config.w32

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

	REM ~~~~~~~~~~~~ link brotli sources to module
if exist %PATH_SRC%\php-ext-brotli\brotli\. rmdir /S /Q %PATH_SRC%\php-ext-brotli\brotli
mklink /J %PATH_SRC%\php-ext-brotli\brotli %PATH_SRC%\brotli

set PHP_SRC_DIR=%PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\php-src
set PHP_BUILD_DIR=%PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\build\%BUILDDIR%

	REM ~~~~~~~~~~~~ clean build dir & buildconf
if exist %PHP_BUILD_DIR%\. rmdir /S /Q %PHP_BUILD_DIR%
mkdir %PHP_BUILD_DIR%
cd /D %PHP_SRC_DIR%
call buildconf

	REM ~~~~~~~~~~~~ Patch some stuff in this shity configure.js, accoring to self made deps
	REM bz2
sed -i 's/libbz2_a/libbz2/g' %CYGPATH_SRC%/php-src/configure.js
	REM sqlite3
sed -i 's/libsqlite3/sqlite3/g' %CYGPATH_SRC%/php-src/configure.js
	REM wineditline
sed -i 's/edit_a/edit_static/g' %CYGPATH_SRC%/php-src/configure.js
	REM zlib
sed -i 's/zlib_a/zlib/g' %CYGPATH_SRC%/php-src/configure.js
	REM curl
sed -i 's/PHP_PHP_BUILD + "\/include\/curl/"%PHP_CURL:\=\/%" + "\/include\/curl/g' %CYGPATH_SRC%/php-src/configure.js
sed -i 's/EXTENSION("curl", "interface.c multi.c share.c curl_file.c");/EXTENSION("curl", "interface.c multi.c share.c curl_file.c"); CHECK_LIB("cares.lib", "curl", PHP_CURL);/g' %CYGPATH_SRC%/php-src/configure.js

	REM ~~~~~~~~~~~~ export config options
call configure --help > %PATH_LOGS%\configure_%PHPGITVER:~4,-1%.txt

	REM ~~~~~~~~~~~~ make NTS
echo *** nts  ***
set ZTS=--disable-zts
set TSNTS=nts
set BUILDDIR=Release
call %PATH_MODULES%\phpsdk-config_make.bat

	REM ~~~~~~~~~~~~ make TS
if %PHP_BUILDTS% == 1 (
echo *** ts  ***
set ZTS=
set TSNTS=ts
set BUILDDIR=Release_TS
call %PATH_MODULES%\phpsdk-config_make.bat
)
	REM exit php-sdk shell
exit