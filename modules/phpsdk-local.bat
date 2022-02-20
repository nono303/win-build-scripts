@echo off
if %CUR_DEBUG% == 1 (echo on)

	REM ~~~~~~~~~~~~ clean build dir & buildconf
if not exist %PHP_BUILD_DIR%. mklink /J %PHP_BUILD_DIR% %PATH_PHP_BUILD%
cd /D %PHP_BUILD_DIR%
call %PATH_BIN_CYGWIN%\rm.exe -rdf  *
cd /D %PHP_SRC_DIR%
call buildconf

	REM ~~~~~~~~~~~~ Patch some stuff in this shity configure.js, accoring to self made deps

REM STATIC

	REM libxml2s
sed -i -E 's/CHECK_LIB\("libxml2_a_dll.lib;libxml2_a.lib", "libxml"\) (..)/CHECK_LIB\("icuuc.lib", "libxml"\) \\1 CHECK_LIB\("libxml2s.lib", "libxml"\) \\1/g' %CYGPATH_SRC%/php-src/configure.js
	REM edit
sed -i 's/edit_a.lib;edit.lib/edit_static.lib/g' %CYGPATH_SRC%/php-src/configure.js
	REM webp
sed -i 's/libwebp.lib/webp.lib/g' %CYGPATH_SRC%/php-src/configure.js

REM SHARED
	REM libiconv - shared with patch ext/iconv/iconv.c : _libiconv_version > _LIBICONV_VERSION
sed -i 's/libiconv_a.lib/iconv.lib/g' %CYGPATH_SRC%/php-src/configure.js
	REM lzma
sed -i 's/liblzma_a/liblzma/g' %CYGPATH_SRC%/php-src/configure.js
	REM zip
sed -i 's/libzip_a/zip/g' %CYGPATH_SRC%/php-src/configure.js
	REM xpm
sed -i 's/xpm.h/X11\\\\\\\\xpm.h/g' %CYGPATH_SRC%/php-src/configure.js
sed -i 's/libXpm_a/libxpm/g' %CYGPATH_SRC%/php-src/configure.js
	REM bz2
sed -i 's/;libbz2.lib//g' %CYGPATH_SRC%/php-src/configure.js
sed -i 's/libbz2_a/bz2/g' %CYGPATH_SRC%/php-src/configure.js
	REM jpeg [libjpeg-turbo]
sed -i 's/libjpeg_a.lib;libjpeg.lib/jpeg.lib/g' %CYGPATH_SRC%/php-src/configure.js
	REM png
sed -i 's/libpng_a.lib;libpng.lib/libpng16.lib/g' %CYGPATH_SRC%/php-src/configure.js
	REM sqlite3
sed -i 's/libsqlite3_a.lib;//g' %CYGPATH_SRC%/php-src/configure.js
sed -i 's/sqlite3ext.h/sqlite3\/sqlite3ext.h/g' %CYGPATH_SRC%/php-src/configure.js
	REM zlib
sed -i 's/zlib_a/zlib/g' %CYGPATH_SRC%/php-src/configure.js
	REM avif
sed -i 's/avif.h/avif\/avif.h/g' %CYGPATH_SRC%/php-src/configure.js
	REM curl - add lib: cares 
sed -i 's/libcurl_a.lib;libcurl.lib/libcurl_imp.lib/g' %CYGPATH_SRC%/php-src/configure.js
sed -i 's/EXTENSION("curl", "interface.c multi.c share.c curl_file.c");/EXTENSION("curl", "interface.c multi.c share.c curl_file.c"); CHECK_LIB("cares.lib", "curl", PHP_CURL);/g' %CYGPATH_SRC%/php-src/configure.js
	REM freetype2 - add libs: bz2 et brotli
sed -i -E 's/CHECK_LIB\("freetype_a.lib;freetype.lib", "gd", PHP_GD\) (..)/CHECK_LIB\("freetype.lib", "gd", PHP_GD\) \\1 CHECK_LIB\("bz2.lib", "gd", PHP_GD\) \1 CHECK_LIB\("brotlidec.lib", "gd", PHP_GD\) \1/g' %CYGPATH_SRC%/php-src/configure.js

	REM ~~~~~~~~~~~~ export config options
call configure --help > %PATH_LOGS%\configure_%PHPVER%.txt

if %PHP_BUILDNTS% == 1 (
	REM ~~~~~~~~~~~~ make NTS
	echo *** nts  ***
	set ZTS=--disable-zts
	set TSNTS=nts
	call %PATH_MODULES%\phpsdk-config_make.bat
)
if %PHP_BUILDTS% == 1 (
	REM ~~~~~~~~~~~~ make TS
	echo *** ts  ***
	set ZTS=
	set TSNTS=ts
	call %PATH_MODULES%\phpsdk-config_make.bat
)
	REM exit php-sdk shell
exit