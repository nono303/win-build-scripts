@echo off
if %CUR_DEBUG% == 1 (echo on)

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
	REM liblzma_a
sed -i 's/liblzma_a/liblzma/g' %CYGPATH_SRC%/php-src/configure.js
	REM libzip_a
sed -i 's/libzip_a/zip/g' %CYGPATH_SRC%/php-src/configure.js
	REM xpm
sed -i 's/xpm.h/X11\\\\\\\\xpm.h/g' %CYGPATH_SRC%/php-src/configure.js
	REM bz2
sed -i 's/libbz2_a/libbz2/g' %CYGPATH_SRC%/php-src/configure.js
	REM jpeg
sed -i 's/libjpeg_a.lib;libjpeg.lib/jpeg.lib/g' %CYGPATH_SRC%/php-src/configure.js
	REM png
sed -i 's/libpng_a.lib;libpng.lib/png_static.lib/g' %CYGPATH_SRC%/php-src/configure.js
	REM sqlite3
sed -i 's/libsqlite3/sqlite3/g' %CYGPATH_SRC%/php-src/configure.js
	REM wineditline
sed -i 's/edit_a/edit_static/g' %CYGPATH_SRC%/php-src/configure.js
	REM zlib
sed -i 's/zlib_a/zlib/g' %CYGPATH_SRC%/php-src/configure.js
	REM curl
sed -i 's/libcurl_a/libcurl_imp/g' %CYGPATH_SRC%/php-src/configure.js
sed -i 's/PHP_PHP_BUILD + "\/include\/curl/"%PHP_CURL:\=\/%" + "\/include\/curl/g' %CYGPATH_SRC%/php-src/configure.js
sed -i 's/EXTENSION("curl", "interface.c multi.c share.c curl_file.c");/EXTENSION("curl", "interface.c multi.c share.c curl_file.c"); CHECK_LIB("cares.lib", "curl", PHP_CURL);/g' %CYGPATH_SRC%/php-src/configure.js
	REM freetype add lib bz2 et brotli
sed -i -E 's/CHECK_LIB\("freetype_a.lib;freetype.lib", "gd", PHP_GD\) (..)/CHECK_LIB\("freetype.lib", "gd", PHP_GD\) \\1 CHECK_LIB\("libbz2.lib", "gd", PHP_GD\) \1 CHECK_LIB\("brotlidec.lib", "gd", PHP_GD\) \1/g' %CYGPATH_SRC%/php-src/configure.js

	REM ~~~~~~~~~~~~ export config options
call configure --help > %PATH_LOGS%\configure_%PHPGITVER:~4,-1%.txt

if %PHP_BUILDNTS% == 1 (
	REM ~~~~~~~~~~~~ make NTS
	echo *** nts  ***
	set ZTS=--disable-zts
	set TSNTS=nts
	set BUILDDIR=Release
	call %PATH_MODULES%\phpsdk-config_make.bat
)
if %PHP_BUILDTS% == 1 (
	REM ~~~~~~~~~~~~ make TS
	echo *** ts  ***
	set ZTS=
	set TSNTS=ts
	set BUILDDIR=Release_TS
	call %PATH_MODULES%\phpsdk-config_make.bat
)
	REM exit php-sdk shell
exit