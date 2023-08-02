# changelog


## 1.7.4 _(2023-08-02)_

*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  GRADLEVER 8.2 > 8.2.1
`.gradle-wrapper.properties/fit2gpx_gradle-wrapper.properties`
`.gradle-wrapper.properties/mapsforgesrc_gradle-wrapper.properties`
`.gradle-wrapper.properties/tzdataservice_gradle-wrapper.properties`
`env_sample.bat`
*  update geographiclib 2.3 nbbin
`utils/bininfo.bat`
*  bump 73 > 74
`modules/icu.patch`
*  remove duplicate
`modules/geographiclib.bat`
*  fix ngtcp2_crypto_openssl > ngtcp2_crypto_quictls
`modules/curl.bat`
*  upgrade edu.sc.seis.launch4j 2.5.4 > 3.0.3
`modules/mobac.patch`
*  CMAKE_DISABLE_FIND_PACKAGE_CUnit bump openssl > quicktls
`modules/ngtcp2.bat`
*  CMAKE_DISABLE_FIND_PACKAGE CUnit & Systemd DISABLE_HPACK_TOOLS Fix LIBNGTCP2_CRYPTO
`modules/nghttp2.bat`
*  CMAKE_DISABLE_FIND_PACKAGE_CUnit
`modules/nghttp3.bat`
*  update tools and src
`README.md`
`utils/srccreate.bat`
*  1874
`modules/libyuv.patch`
*  disable gcc version for memcached
`utils/sub/version.php`
*  bump to gradle 8.2
`env_sample.bat`
`modules/mobac.patch`
*  typo
`modules/mapsforgesrv.bat`
`modules/mobac.bat`
`modules/tzdataservice.bat`
*  v4.5.1
`modules/libtiff.bat`
`modules/libtiff.patch`
*  v1.10.0 disable tools building
`modules/libzip.bat`
`utils/bininfo.bat`
*  remove duplicate cmake option
`modules/libgeotiff.bat`
*  fix offset for 1.6.21
`modules/memcached.patch`
*  add fit2gpx
`SRC_VERSION.md`
`modules/fit2gpx.bat`
`usage.txt`
*  disable FIND_PACKAGE NO_MODULE QUIET (forced)
`modules/libgeotiff.patch`
*  3.11 > 3.12
`modules/geos.bat`
*  dav1d: 1.2.0 > 1.2.1
`modules/dav1d.bat`
*  tidy: 5.9.14 > 5.9.20
`modules/tidy.bat`
`modules/tidy.patch`
`utils/sub/version.php`
*  libevent: 2.1 > 2.2
`modules/libevent.bat`
*  curl: 8.0 > 8.1
`modules/curl_ca-win.patch`
*  sqlite: 3.41 > 3.42
`modules/sqlite.bat`
`modules/sqlite.patch`
*  libssh2 1.10 > 1.11
`modules/libssh2.bat`
`modules/libssh2.patch`
`utils/sub/version.php`
*  bump MSVC 14.37 (17.7)
`vs17.bat`
*  v5.4.6
`modules/lua.bat`


## 1.7.3 _(2023-05-14)_

*  1.7.3
`README.md`
`SRC_VERSION.md`
`changelog.md`
`utils/srccreate.bat`
*  fix copy paste from mod_md use version from fcgid_conf.h add bininfo cmd for github
`modules/mod_fcgid.bat`
`utils/sub/version.php`
*  fix mo_md depends libcrypto on x86 add bininfo cmd for github
`modules/mod_md.bat`
*  fix nowarn
`modules/libffi.bat`
`modules/libiconv.bat`
`modules/liblzma.bat`
`modules/libmaxminddb.bat`
`modules/libxml2.bat`
*  https://github.com/curl/curl/commit/10998e3b89be65e2bf9d9666bd9a1734c186ec0a
`modules/curl.bat`
`modules/curl_ca-win.patch`
*  add mod_fcgid standalone update usage.txt with mod_md & mod_fcgid standalone
`env_sample.bat`
`modules/mod_fcgid.bat`
`modules/mod_md.bat`
`usage.txt`
*  disable warning in icu: coll_tree
`utils/sub/logcheck.php`
*  comment about lib usage for PHP
`modules/libxml2.bat`
*  https://github.com/sqlite/sqlite/pull/10
`modules/sqlite.bat`
`modules/sqlite.patch`
*  libxml2 - >=2.11: update configure option - version:  git > LIBXML_DOTTED_VERSION
`modules/libxml2.bat`
`utils/sub/version.php`
*  aom 3.6.1: update cmake option use global var SSE42AVX (avx.bat)
`avx.bat`
`modules/aom.bat`
*  1867: TEST > UNIT_TEST
`modules/libyuv.bat`
*  typo
`modules/libgd.bat`


## 1.7.2 _(2023-05-04)_

*  1.7.2
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  https://github.com/websupport-sk/pecl-memcache/pull/110 merged
`modules/pecl-memcache.patch`
*  fix for php-ext-zstd 0.12.3 add libxpm nghttp2 curl
`utils/sub/version.php`
*  gdal 3.7.0
`utils/bininfo.bat`
*  For gdal: mklink \include\sqlite3ext.h < \include\sqlite3\sqlite3ext.h
`modules/sqlite.bat`
*  commit 2899841
`modules/serf.patch`
*  copy deps SQLite.Interop.dll
`modules/sdlna.bat`
*  2741
`modules/mobac.patch`
*  gradlew wrapper --gradle-version %GRADLEVER%
`modules/mapsforgesrv.bat`
`modules/mobac.bat`
*  1.16.1
`modules/libheif.bat`
*  2.4.57
`modules/httpd.patch`
*  3.11.2
`modules/geos.bat`
*  3.7.0 : cmake + GDAL_USE_ARCHIVE - duplicate
`modules/gdal.bat`
`modules/gdal.patch`
*  add GRADLEVER
`env_sample.bat`
*  update export configs
`config/.vsconfig`
`config/python.pip`
*  add tzdataservice
`modules/tzdataservice.bat`
`usage.txt`
*  upgrade src
`SRC_VERSION.md`
*  add sdnspi-mysql.bat
`modules/sdnspi-mysql.bat`
*  fix mod_security-sdbm-util and add missing modules
`modules/full.bat`
`usage.txt`
*  update config export
`config/cyg64.packagelist`
`config/python.pip`
*  fix & clean
`modules/sdlna.bat`
*  sort search array by color display
`utils/sub/logcheck.php`


## 1.7.1 _(2023-03-11)_

*  1.7.1
`changelog.md`
*  upgrade tools
`README.md`
*  add mod_security-sdbm-util
`SRC_VERSION.md`
`modules/full.bat`
`modules/mod_security-sdbm-util.bat`
`utils/bininfo.bat`
`utils/srccreate.bat`
*  fix sigcheck calls
`utils/sub/bininfo.php`
*  build 32 & 64 for libevent 2.1
`modules/memcached.bat`
*  Includes dir patched in Makefile.win
`modules/mod_security.bat`
`modules/mod_security.patch`
*  remove duplicate cflags
`modules/php-ogr.bat`
*  gradle gradle-8.0.1 > gradle-8.0.2
`modules/mobac.patch`
*  v3.6.3RC1
`modules/gdal.bat`
`modules/gdal.patch`
*  9.1.1 > 9.2.0
`modules/proj.bat`
*  gradle-8.0 > gradle-8.0.1
`modules/mobac.patch`
*  1.0.0 > 1.1.0
`modules/dav1d.bat`
*  vcvars_ver=14.35 > 14.36
`vs17.bat`


## 1.7.0 _(2023-02-18)_

*  1.7.0
`changelog.md`
*  build python (standalone)
`SRC_VERSION.md`
`env_sample.bat`
`modules/python.bat`
`utils/srccreate.bat`
*  upgrade tools
`README.md`
*  add param & option usage for version
`usage.txt`
*  add python force version["file"] to be on format x.x.x.x add option veronly
`utils/sub/version.php`
*  set version for all build (not only libevent 2.1) changing PATH_RELEASE_MEMCACHED
`env_sample.bat`
`modules/memcached.bat`
*  curl 7.88
`modules/curl_ca-win.patch`
*  fix useless space
`modules/libheif.bat`
*  bump dependencies & gradle
`modules/mobac.patch`
*  https://github.com/kjdev/php-ext-zstd/commit/4315756d71f9701b51084ea6e89bd3122ed47883
`modules/php-ext-zstd.patch`
*  fix tmp shortcut
`modules/qhull.bat`
*  fix padding
`utils/sub/bininfo.php`
*  fix useless echo
`utils/sub/version.php`
*  1.52.0
`modules/nghttp2.bat`
*  add php-ogr (standalone)
`modules/php-ogr.bat`
*  add qhull for gdal
`modules/full.bat`
`modules/gdal.bat`
`modules/qhull.bat`
`utils/bininfo.bat`
*  fix '..' > '.0.'
`utils/sub/version.php`
*  FT_ENABLE_ERROR_STRINGS=OFF
`modules/freetype2.bat`
*  add 'pas reconnu en tant que commande interne"
`utils/sub/logcheck.php`
*  omit static lib
`modules/libgav1.bat`
*  fixes https://github.com/OSGeo/gdal/issues/7183
`modules/gdal.patch`
*  test OFF & copy include bz_version.h (python build required)
`modules/bzip2.bat`
*  remove local copy
`env_sample.bat`
`modules/gdal.bat`
`modules/proj.bat`
*  fix --with-zlib-lib
`modules/openssl.bat`
*  php-gdal > php-ogr
`modules/php.bat`
`utils/sub/version.php`
*  simplify local copy
`modules/proj.bat`
*  php-gdal > php-ogr
`modules/phpsdk-config_make.bat`
*  libjpeg 2.1.90 with native 12bits support
`modules/libtiff.bat`
*  move cmake dir to good path
`modules/libpng.bat`
*  2.1.90
`modules/libjpeg-turbo.bat`
*  rollback
`modules/libjpeg-turbo.bat`


## 1.6.3 _(2023-01-31)_

*  1.6.3
`README.md`
`SRC_VERSION.md`
`changelog.md`
`utils/srccreate.bat`
*  add libjpeg-turbo & libgav1 (move from tag to HEAD)
`utils/sub/version.php`
*  add --force for 'git fetch --tag' 'git rev-list --left-right --count' from current commit (and not current branch which was confusing) remove duplicate debug message
`utils/sub/srcstatus.php`
*  refactor build and enbale jpeg12 for jpeg.lib
`modules/libjpeg-turbo.bat`
*  refactor build and disable use of abseil-cpp
`modules/libgav1.bat`
`modules/libgav1.sh`
*  fix build proj before libgeotiff
`modules/full.bat`
*  php bin in php-sdk: 7 > 8
`utils/sub/_functions.php`
*  improve debug
`utils/sub/bininfo.php`
*  display_errors: 1 > 0
`modules/php-sdk.patch`
*  fix BUILD_TESTS > BUILD_TEST
`modules/libgd.bat`
*  CARES_BUILD_TOOLS: ON > OFF
`modules/cares.bat`
`utils/bininfo.bat`
*  add libgeotiff, gdal & php-gdal
`env_sample.bat`
`modules/full.bat`
`utils/bininfo.bat`
`utils/srccreate.bat`
*  add libgeotiff
`modules/libgeotiff.bat`
*  add gdal
`modules/gdal.bat`
`modules/gdal.patch`
*  clean LOCAL_COPY before copy
`modules/proj.bat`
*  add php-gdal
`utils/sub/version.php`
*  SQLITE_THREADSAFE: O > 1 required for gdal
`modules/sqlite.bat`
*  refactor other PECL init add php-gdal
`modules/php.bat`
*  add gdal lib & include path
`modules/phpsdk-config_make.bat`
*  expose required functions (LIBRARY_API) for gdal
`modules/giflib.patch`
*  typo
`modules/phpsdk-local.bat`
*  add CFLAGS : FunctionLevelLinking (/Gy) add LDFLAGS : EnableCOMDATFolding (/OPT:ICF) OptimizeReferences (/OPT:REF)
`modules/common/vcxproj.sh`
*  add CFLAGS /Gw /Gy /Zc:inline /FS
`modules/phpsdk-config_make.bat`
*  add CFLAGS /Gw /Gy /Zc:inline
`modules/common/meson.sh`
`modules/common/ninja.sh`
*  add https://github.com/websupport-sk/pecl-memcache/pull/103.patch
`modules/pecl-memcache.patch`
*  nb PHP: 86 > 88 (+php-proj)
`utils/bininfo.bat`
*  build proj before php (required for php-proj)
`modules/full.bat`
*  fix CFLAG sed for bz2.dll bzip2.exe nghttp2.dll nghttp3.dll ngtcp2.dll ngtcp2_crypto_openssl.dll
`modules/common/ninja.sh`


## 1.6.2 _(2023-01-24)_

*  1.6.2
`README.md`
`SRC_VERSION.md`
`changelog.md`
`utils/srccreate.bat`
*  1.6.2
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  version for php-proj
`utils/sub/version.php`
*  init.bat php-ext-zstd
`modules/php.bat`
*  2722 > 2730: update dependencies
`modules/mobac.patch`
*  echo new line at beginning (and not at end)
`modules/common/init.bat`
*  https://github.com/kjdev/php-ext-zstd/issues/51
`modules/php-ext-zstd.patch`
*  add php-proj
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  set all cmake options
`modules/libgav1.bat`
*  2.4.55rc1
`modules/httpd.patch`
*  Simply copy remove useless patch
`modules/libyuv.bat`
*  only build x64
`modules/memcached.bat`
*  update CMake option for 9.1.1
`modules/proj.bat`
*  REM for ICU_ROOT
`modules/sqlite.bat`
*  libffi version from file
`utils/sub/version.php`
*  1.14.2
`modules/libheif.bat`
`modules/libheif.patch`
*  fix yajl_static path issue
`modules/yajl.bat`
*  7.87.0
`modules/curl_ca-win.patch`
*  export configs
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
`config/python.pip`
*  add yajl & mod_security
`SRC_VERSION.md`
`modules/full.bat`
`modules/mod_security.bat`
`modules/mod_security.patch`
`modules/yajl.bat`
`modules/yajl.patch`
`utils/bininfo.bat`
`utils/srccreate.bat`
`utils/sub/version.php`
*  add CMake options
`modules/nghttp2.bat`
`modules/ngtcp2.bat`
*  improve jemalloc
`modules/jemalloc.bat`
*  set CURL_DISABLE_OPENSSL_AUTO_LOAD_CONFIG=OFF
`modules/curl.bat`
*  libwepb 1.2.x > 1.3.x
`modules/libgd.bat`
`modules/libtiff.bat`
`modules/libwebp.bat`
`modules/phpsdk-local.bat`
`utils/bininfo.bat`
*  force ZSTD_BUILD_SHARED=ON
`modules/zstd.bat`
*  remove libtiff tools
`utils/bininfo.bat`
*  fix libwebp lib export missing: DGifSavedExtensionToGCB, DGifSlurp, DGifCloseFile, DGifOpenFileHandle, DGifOpenFileName, DGifGetExtensionNext, DGifGetLine
`modules/giflib.patch`
*  make parallel '-j$(nproc)'
`modules/memcached.sh`
`modules/memcached_event-2.0.sh`
*  remove pcre as is not anymore requested for mod_qos (using pcre2 since 11.73)
`SRC_VERSION.md`
`modules/full.bat`
`modules/pcre.bat`
`utils/bininfo.bat`
`utils/srccreate.bat`
*  remove pcre as is not anymore requested for mod_qos (using pcre2 since 11.73)
`SRC_VERSION.md`
`modules/full.bat`
`utils/bininfo.bat`
`utils/srccreate.bat`
*  remove git HEAD log if contains checked words
`utils/sub/logcheck.php`
*  delfate 1.15
`modules/libdeflate.bat`
`modules/libtiff.bat`
*  73.x
`modules/icu.patch`


## 1.6.1 _(2022-12-02)_

*  1.6.1
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  refactor sqlite https://github.com/azadkuh/sqlite-amalgamation/pull/10
`modules/sqlite.bat`
`utils/sub/version.php`
*  fix useless pause
`modules/httpd.bat`
*  junction for local .gradle to %userprofile%
`modules/mapsforgesrv.bat`
*  bump to gradle 7.6
`modules/mobac.patch`
*  fix date format with cygwin bin
`modules/common/ymdhis.bat`
*  note: https://wiki.php.net/internals/windows/libs/libxml2
`modules/libxml2.bat`
*  2713 > 2722
`modules/mobac.patch`
*  force LIBXML2_INCLUDE_DIR= & LIBXML2_LIBRARIES after issue with cmake 3.25.0 -- Found LibXml2: C:/sdk/softs/perl/c/lib/libxml2.a
`modules/httpd.bat`
*  add libgd version from file (tag > master) fix -dev as 0
`utils/sub/version.php`
*  add https://gitlab.com/libtiff/libtiff/-/issues/487
`modules/libtiff.patch`
*  fix zstd required for curl
`modules/full.bat`
*  fixed in 1849
`modules/libyuv.patch`
*  waiting 1.15.0 https://github.com/strukturag/libheif/issues/712
`modules/libheif.patch`
*  1.14.0
`modules/libheif.bat`
*  fix arg 'all' issue
`modules/full.bat`
*  ermove libcurl on target scm
`modules/mod_md.bat`
*  add trace for origin of the version fix alpha, beta etc without number
`utils/sub/version.php`
*  bump tools & src msvc: 14.34 > 14.35
`README.md`
`SRC_VERSION.md`
`env_sample.bat`
`utils/srccreate.bat`
`vs17.bat`
*  add features: unicode IDN zstd add protocols: WS WSS
`modules/curl.bat`
*  bump src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  gradle 7.6 & jdk 19
`README.md`
*  libxml 2.10.x
`SRC_VERSION.md`
`modules/libxml2.bat`
`utils/srccreate.bat`
*  remove useless patch for 3.0.6 & NUL file issue
`modules/openssl.bat`
*  update dependencies & gradle for jdk 19
`modules/mobac.patch`
*  fix patch for 3.2.x
`modules/xdebug.patch`
*  add patch error
`utils/sub/logcheck.php`
*  pushed in https://github.com/madler/zlib/commit/d0704a820186481da35d08f4b655881e1d32089f
`modules/zlib.patch`
*  https://github.com/openssl/openssl/pull/18732 applied in 3.0.6
`modules/openssl.patch`
*  bump src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  disable rsome removed add 'Hunk #' for patch offset issue
`utils/sub/logcheck.php`
*  fix offset
`modules/subversion.patch`
*  remove useless warning & fix meson setup syntaxe
`modules/dav1d.bat`


## 1.6.0 _(2022-10-26)_

*  1.6.0
`changelog.md`
*  bump src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix useless pause
`modules/common/ymdhis.bat`
*  add opts: EXPAT_ATTR_INFO=ON & EXPAT_LARGE_SIZE=ON
`modules/libexpat.bat`
*  bump to 7.86.0 - apply curl_ca-win.patch only if not keepsrc - disable curl.patch as https://github.com/curl/curl/commit/468908160c958baed1c3239505e9f808ff41df5f and https://github.com/ydb-platform/ydb/commit/239edf05410a4716215db2bf9a0027c05b5d8126 merged into current version
`modules/curl.bat`
`modules/curl.patch`
`modules/curl_ca-win.patch`
*  use stdint.h for all php version (instead of main/php_stdint.h or win32/php_stdint.h)
`modules/pecl-memcache.patch`
*  bump to php8.2 - include php-ext-gd.patch into differencied php8.X_php-src.patch - disable php8.X_pecl-memcache.patch
`modules/php-ext-gd.patch`
`modules/php.bat`
`modules/php8.0_php-src.patch`
`modules/php8.1_php-src.patch`
`modules/php8.2_pecl-memcache.patch`
`modules/php8.2_php-src.patch`
*  bump tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  0.11.1
`modules/libavif.bat`
*  add https://github.com/curl/curl/commit/468908160c958baed1c3239505e9f808ff41df5f.patch
`modules/curl.patch`
*  fix date format
`modules/common/ymdhis.bat`
*  disable build png exe
`modules/libpng.bat`
`utils/bininfo.bat`
*  update BUILD_PLATFORM params https://github.com/pffang/libiconv-for-Windows/commit/1353455a6c4e15c9db6865fd9c2bf7203b59c0ec
`modules/libiconv.bat`
*  fix issue with SCM_BRANCH
`modules/common/init.bat`
`utils/sub/_functions.php`
`utils/sub/version.php`
*  add libgd
`modules/full.bat`
`usage.txt`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  https://github.com/ModelTech/php-geos/pull/3
`modules/php-geos.patch`
*  clean dirty patch https://github.com/php/php-src/issues/9671 - ssize_t (gd_webp.c) https://github.com/libgd/libgd/issues/845 - proper option to disable in CMakeLists.txt: BUILD_TESTS, BUILD_EXEMPLES, BUILD_DOCS, BUILD_CPACK
`modules/libgd.bat`
`modules/libgd.patch`
*  add libgd
`utils/bininfo.bat`
*  disable-zstd on memcache build
`modules/phpsdk-config_make.bat`
*  do not apply specific patch if 'keepsrc' patch ext/gd to use external libgd
`modules/php-ext-gd.patch`
`modules/php.bat`
*  clean patch
`modules/libgd.bat`
`modules/libgd.patch`
*  use external libgd - waiting https://github.com/php/php-src/issues/9671
`modules/php-ext-gd.patch`
*  SCM_BRANCH: remove '(' & ')' that are interpreted in IF statement
`modules/common/init.bat`
*  add libgd as external
`modules/libgd.bat`
`modules/libgd.patch`
`modules/libgd_pr692.patch`
*  bump tools & version
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix path for libmaxminddb.sh
`modules/libmaxminddb.bat`
*  add libheif
`modules/full.bat`
`usage.txt`
`utils/bininfo.bat`
*  brotli use lib instead of src
`modules/php.bat`
*  use libgd from latest src instead of php bundled - add libheif required by libgd - gd.c: add php info with ZLIB, TIFF, HEIF
`modules/libgd.patch`
`modules/libheif.bat`
`modules/php-ext-gd.patch`
*  bump srccreate.bat add libgd libheif
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update tools
`README.md`
*  1.7.0
`modules/libmaxminddb.bat`
*  gd ext for php
`modules/libgd.patch`
`modules/php-ext-gd.patch`
`modules/php.bat`
*  fix typo
`modules/phpsdk-config_make.bat`
*  https://github.com/ydb-platform/ydb/commit/239edf05410a4716215db2bf9a0027c05b5d8126
`modules/curl.patch`
*  bump src version
`SRC_VERSION.md`
`utils/srccreate.bat`


## 1.5.9 _(2022-09-23)_

*  1.5.9
`changelog.md`
*  bump src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add VERSION PATCH for php-src & pecl-memcache remove PHP_LIBXML
`modules/pecl-memcache.patch`
`modules/php.bat`
`modules/php8.0_php-src.patch`
`modules/php8.1_php-src.patch`
`modules/php8.2_pecl-memcache.patch`
`modules/php8.2_php-src.patch`
*  PHP7_COMMON: +without-oci8 add PHP8_COMMON add PHPVER == 8.2 remove PHP_LIBXML pecl-memcache standalone: +without-readline
`modules/phpsdk-config_make.bat`
*  3.1.5
`modules/xdebug.patch`
*  bump - WKITVER: 10.0.22000.0 > 10.0.22621.0 - DOTNETVER: 4.8 > 4.8.1
`env_sample.bat`
*  force PHP_SDK_VC_DIR for !vs17 build
`modules/php.bat`
*  fix for pecl-memcache: AVXPATH fix for pecl-memcache only build: phparchopts fix for php ! 8.1: with-extra-includes & with-extra-libs
`modules/phpsdk-config_make.bat`
*  bump src version
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix libxslt version & missing cmake
`modules/libxlst.FindLibXml2.cmake`
`modules/libxslt.bat`
`modules/libxslt.patch`
`utils/sub/version.php`
*  vcvars_ver: 14.33 > 14.34 bump scr & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
`vs17.bat`
*  change SCM: https://github.com/nono303/pecl-memcache#main (including all PR)
`modules/pecl-memcache.patch`
*  REM: big message when building openssl add HTTPD_VERSION in so version
`modules/mod_md.bat`
*  --enable-gd=shared
`modules/phpsdk-config_make.bat`
*  disable gradle version patch
`modules/mobac.patch`
*  REM: jupiter8 must be launch last for version
`modules/memcached_event-2.0.sh`
*  bump to 2.0.0
`modules/geographiclib.bat`
*  remove '* ' in front of branch name
`modules/common/init.bat`
*  fix dll export definition (LIBYUV_API for DetileToYUY2)
`modules/libyuv.patch`
*  fix version
`modules/libxslt.patch`
*  deprecated: PROJ_LIB_ENV_VAR_TRIED_LAST > PROJ_DATA_ENV_VAR_TRIED_LAST
`modules/proj.bat`
*  disable warn
`modules/icu.bat`
`modules/libffi.bat`
*  update nb geographiclib
`utils/bininfo.bat`


## 1.5.8 _(2022-07-31)_

*  tag 1.5.8
`changelog.md`
*  fix  PNG_BUILD_ZLIB: ON > OFF
`modules/libpng.bat`
*  change scm (1.17)
`modules/libiconv.bat`
*  1.5.2 > 2.0.0
`modules/geographiclib.bat`
*  tag to branch for php-ext-zstd, libxslt, libsodium, libpng, geographiclib, libiconv, libev
`SRC_VERSION.md`
`utils/srccreate.bat`
`utils/sub/version.php`
*  8.0.1
`modules/pecl-memcache.patch`
*  r2709
`modules/mobac.patch`
*  bump tools version
`README.md`
`config/python.pip`
*  remove static $notags better $branch value improve csv content lisibility
`utils/sub/srcstatus.php`
*  better SCM_BRANCH value for git
`modules/common/init.bat`
*  uncomment vsconfig export
`utils/configexport.bat`
*  bump tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  https://svn.apache.org/viewvc?view=revision&revision=1902576
`modules/apr.patch`
*  2701 - gradle 7.5 - comment msg_too_many_tiles
`modules/mobac.patch`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  set CURL_PATCH_WIN_OPENSSL=1 (mandatory for mod_md with curl openssl backend)
`env_sample.bat`
*  git apply openssl.patch for openssl-quic
`modules/openssl.bat`
*  set CMAKE_INSTALL_MANDIR (default unseted)
`modules/proj.bat`
*  set default QUIC_BUILD=1
`quic.bat`
*  fix date ordering for tags log
`utils/sub/srcstatus.php`
*  https://github.com/openssl/openssl/pull/18732
`modules/openssl.patch`
*  https://github.com/openssl/openssl/issues/18723
`modules/mobac.patch`
`modules/openssl.bat`


## 1.5.7 _(2022-06-27)_

*  1.5.7
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  force calling quic.bat %QUIC_BUILD% at the end
`avx.bat`
*  extract patch CURL_PATCH_WIN_OPENSSL
`env_sample.bat`
`modules/curl.bat`
`modules/curl_ca-win.patch`
*  https://bz.apache.org/bugzilla/show_bug.cgi?id=66121
`modules/apr.patch`
*  revision 2683
`modules/mobac.patch`
*  3.11.0
`modules/geos.bat`
`modules/geos.patch`
*  412f666
`modules/serf.patch`
*  display configure option
`modules/phpsdk-config_make.bat`
*  comment for /main/network.c
`modules/php-src.patch`
*  2683
`modules/mobac.patch`


## 1.5.6 _(2022-06-04)_

*  tag 1.5.6
`changelog.md`
*  clean & refactor apr use OPENSSL_SCM & PATH_INSTALL_OSSL
`modules/apr.bat`
`modules/apr.sh`
`modules/apr_once.sh`
*  merge apr_post.patch to apr-util.patch
`modules/apr-util.patch`
`modules/apr_post.patch`
*  use PATH_INSTALL_OSSL instead of PATH_INSTALL_ for openssl lib & include use OPENSSL_SCM instead of 'openssl' for openssl src
`modules/curl.bat`
`modules/libevent.bat`
`modules/libssh2.bat`
`modules/libzip.bat`
`modules/nghttp2.bat`
`modules/ngtcp2.bat`
`modules/openssl.bat`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/serf.bat`
`modules/subversion.bat`
`quic.bat`
`utils/bininfo.bat`
`utils/libcheck.bat`
*  remove mod_md copy on PATH_GITHUB_MODMD (reported on mod_md.bat)
`modules/httpd.bat`
*  add mod_md standalone build with quic 0
`modules/mod_md.bat`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  2.4.54
`modules/httpd.patch`
*  r2680
`modules/mobac.patch`
*  update src remove mod_ftp
`modules/mod_ftp.patch`
`utils/srccreate.bat`
*  init mod_qos
`modules/httpd.bat`
*  http://tomdonovan.net/download/mod_ftp-1.0.1_24_win32.zip
`modules/mod_ftp.patch`


## 1.5.5 _(2022-05-21)_

*  1.5.5
`changelog.md`
*  upgrade tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  bump to MSVC 17.3.0-p1
`vs17.bat`
*  1ac8262c
`modules/apr-util.patch`
*  r2678
`modules/mobac.patch`
*  update configexport to include python
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
`config/python.pip`
`utils/configexport.bat`


## 1.5.4 _(2022-05-02)_

*  1.5.4
`changelog.md`
*  add changelog
`README.md`
*  add changelog.md
*  upgrade src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add QS_NO_STATUS_HOOK
`modules/httpd.bat`
*  mod_md 2.4.14
`SRC_VERSION.md`
`modules/httpd.patch`
*  update src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  apre 1.8.x
`utils/srccreate.bat`
*  bump to apr 1.8.0
`SRC_VERSION.md`
*  disable subversion java-hl warnings (with jre-18)
`utils/sub/logcheck.php`
*  some rewite and fix OpenSSL lib path
`modules/apr.bat`
*  fix useless cmake warning when ENABLE_HTTP3=OFF and openssl doesn't support QUIC
`modules/nghttp2.bat`
*  rewrite msbuild
`modules/subversion.bat`
*  rewrite cmake target Ninja
`modules/serf.bat`
*  fix useless cmake warning when ENABLE_HTTP3=OFF and openssl doesn't support QUIC
`modules/httpd.bat`
*  rewrite msbuild
`modules/dependencies.bat`
`modules/icu.bat`
`modules/jemalloc.bat`
`modules/libffi.bat`
`modules/libiconv.bat`
`modules/liblzma.bat`
`modules/libsodium.bat`
`modules/libxpm.bat`
`modules/mpir.bat`
`modules/nssm.bat`
`modules/sdlna.bat`
`modules/verpatch.bat`
*  rewrite cmake target VS
`modules/aom.bat`
`modules/libgav1.bat`
`modules/libmaxminddb.bat`
*  rewrite cmake target Ninja
`env_sample.bat`
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/cares.bat`
`modules/curl.bat`
`modules/freeglut.bat`
`modules/freetype2.bat`
`modules/geographiclib.bat`
`modules/geos.bat`
`modules/giflib.bat`
`modules/jansson.bat`
`modules/lerc.bat`
`modules/libavif.bat`
`modules/libev.bat`
`modules/libevent.bat`
`modules/libexpat.bat`
`modules/libjpeg-turbo.bat`
`modules/libpng.bat`
`modules/libssh2.bat`
`modules/libtiff.bat`
`modules/libwebp.bat`
`modules/libxdiff.bat`
`modules/libxslt.bat`
`modules/libyuv.bat`
`modules/libzip.bat`
`modules/nghttp3.bat`
`modules/ngtcp2.bat`
`modules/pcre.bat`
`modules/pcre2.bat`
`modules/proj.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
`modules/wineditline.bat`
`modules/zlib.bat`
`modules/zstd.bat`


## 1.5.3 _(2022-04-05)_

*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  upgrade tools
`README.md`
*  fix 'C:\sdk\release\vs17_x64-avx\include\libyuv\scale.h(224): warning C4115: 'libyuv': named type definition in parentheses' for libavif
`modules/libyuv.bat`
*  typo
`modules/libavif.bat`
*  remobe unused .net fix
`modules/libmaxminddb.sh`
*  add NOLOGO to link
`modules/lua.bat`
*  fix missing init and correct version
`modules/memcached.bat`
*  add arg[3]: memcached
`utils/sub/version.php`
*  bump to gradle-7.4.2
`modules/mobac.patch`
*  0.3.0 : remove fix for dll install bad path
`modules/ngtcp2.bat`
*  bump to 6ee0f95
`modules/php-sdk.patch`
*  1.2.12 : fix no asm
`modules/zlib.bat`
`modules/zlib.patch`


## 1.5.2 _(2022-03-20)_

*  mapsforge without tag
`utils/sub/srcstatus.php`
*  upgrade tools
`README.md`
*  bump to dav1d 1.0.0
`modules/dav1d.bat`
`modules/dav1d.patch`
*  add mod_qos (and pcre) for httpd
`SRC_VERSION.md`
`modules/full.bat`
`modules/httpd.bat`
`modules/httpd.patch`
`modules/pcre.bat`
`utils/bininfo.bat`
`utils/srccreate.bat`
`utils/sub/version.php`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  71.1: refactor & limit target
`modules/icu.bat`
*  fix exit condition
`modules/full.bat`
*  fix DIR_LIB_UNUSED
`modules/apr.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  PREFIXLOG for 'full' build with module or shortcut param
`go.bat`
*  keep pcre2-config (needed for httpd)
`modules/pcre2.bat`
*  pip-review --pre (pre-release)
`upgrade_pip.bat`
*  gradle-7.4.1
`modules/mobac.patch`
*  @echo off
`modules/full.bat`
*  upgrade tools
`README.md`
*  refactor all, *anddeps > full.bat
`modules/all.bat`
`modules/full.bat`
`modules/httpdanddeps.bat`
`modules/phpanddeps.bat`
`modules/projgeolibanddeps.bat`
`modules/subversionanddeps.bat`
`usage.txt`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`


## 1.5.1 _(2022-03-09)_

*  pcre > pcre2
`usage.txt`
*  node reuse: false for msbuild
`env_sample.bat`
*  move to DIR_LIB_UNUSED
`modules/libyuv.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
*  fix version (badly on apr-util...) add ZLIB_LIBRARY
`modules/libzip.bat`
*  disable STATIC build lib name: iconv > libiconv
`modules/libiconv.bat`
*  add DIR_LIB_UNUSED
`modules/clean.bat`
*  pcre > pcre2
`modules/httpdanddeps.bat`
*  fix offsets for 2.4.53
`modules/httpd.patch`
*  accord lib name changes: iconv > libiconv
`modules/php-src.patch`
*  accord lib name changes: - iconv > libiconv - libmaxminddb_static > maxminddb
`modules/httpd.bat`
*  update NBBIN
`utils/bininfo.bat`
*  disbale dll check for DIR_LIB_UNUSED
`utils/libcheck.bat`
`utils/sub/libcheck.php`
*  fix space
`env_sample.bat`
*  force strtolower($argv[1])
`utils/sub/version.php`
*  build STATIC > SHARED
`modules/libmaxminddb.bat`
`modules/libmaxminddb.sh`
*  disable STATIC_LIB
`modules/bzip2.bat`
`modules/cares.bat`
`modules/freeglut.bat`
`modules/freetype2.bat`
`modules/lerc.bat`
`modules/libdeflate.bat`
`modules/libev.bat`
`modules/libffi.bat`
`modules/libjpeg-turbo.bat`
`modules/liblzma.bat`
`modules/libpng.bat`
`modules/libsodium.bat`
`modules/libssh2.bat`
`modules/libxml2.bat`
`modules/libxpm.bat`
`modules/libxslt.bat`
`modules/lua.bat`
`modules/mpir.bat`
`modules/nghttp2.bat`
`modules/nghttp3.bat`
`modules/ngtcp2.bat`
`modules/zlib.bat`
`modules/zstd.bat`
*  move to DIR_LIB_UNUSED
`modules/brotli.bat`
*  add apriconv-1.lib to release move to DIR_LIB_UNUSED
`modules/apr.bat`
*  pretty copy loop
`modules/aom.bat`
*  add DIR_LIB_UNUSED
`avx.bat`
`env_sample.bat`
*  pcre > pcre2 (httpd 2.4.53)
`modules/pcre.bat`
`modules/pcre2.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  improve some options and fix cmake patch
`modules/curl.bat`
`modules/curl.patch`
`utils/bininfo.bat`
*  fix warning: nssm.vcproj has type 100644, expected 100755
`modules/nssm.patch`
*  update src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  serf: build only SHARED for subversion
`modules/serf.bat`
`modules/subversion.bat`


## 1.5.0 _(2022-03-03)_

*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix NBBIN + php-ext-zstd - giflib & wineditline static to shared builb
`utils/bininfo.bat`
*  add giflib as nogit echo 'nogit' file information on debug mode only
`utils/sub/version.php`
*  add php-ext-zstd
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  bump to 3.38.0 cmake options - remove dirty patch - SQLITE_OMIT_DECLTYPE + SQLITE_ENABLE_COLUMN_METADATA
`modules/sqlite.bat`
*  use edit SHARED
`modules/phpsdk-local.bat`
*  bump cmake option to 9.0.0 fix bad option remove deps icu for useless static libsqlite3
`modules/proj.bat`
*  use giflib SHARED
`modules/libwebp.bat`
*  add --expire-unreachable=now for gitgc
`utils/sub/srcstatus.php`
*  add python packages config
`config/python.pip`
*  move from STATIC to SHARED build
`modules/giflib.bat`
`modules/giflib.patch`
`modules/wineditline.bat`
`modules/wineditline.patch`


## 1.4.6 _(2022-02-28)_

*  fix NBBIN
`utils/bininfo.bat`
*  call version
`modules/verpatch.bat`
*  fix norpdb in version
`modules/dependencies.bat`
*  fix unused abseil.dll
`modules/libgav1.bat`
*  fix ending tag LinkIncremental
`modules/common/vcxproj.sh`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  upgrade tools
`README.md`
*  use shared lib: libgav1
`modules/libavif.bat`
*  remove sed of LinkIncremental as now included in vcxproj.sh manual copy of include
`modules/aom.bat`
*  fix shared build
`modules/libgav1.bat`
`modules/libgav1.sh`
*  fix for v2.1.3
`modules/libjpeg-turbo.bat`
*  disable tools/dav1d.exe (unused & conflict pdb with dll) manual copy of include
`modules/dav1d.bat`
*  remove LinkIncremental tags (LTCG conflict)
`modules/common/vcxproj.sh`
*  remove /MD
`modules/common/ninja.sh`
*  change shared lib names: sqlite3 > libsqlite3 (conlict with exe for pdb in /bin) build exe (for proj)
`modules/sqlite.bat`
*  fix lib names: sqlite3.lib > libsqlite3.lib
`modules/apr.bat`
`modules/phpsdk-local.bat`
*  fix lib names: libcurl_imp.lib > libcurl.lib & sqlite3.lib > libsqlite3.lib
`modules/proj.bat`
*  zlib1.dll > zlib.dll
`modules/subversion.bat`
*  use shared libs : webp_static.lib > webp.lib
`modules/phpsdk-local.bat`
*  use shared libs : yuv_static > libyuv & libdav1d > dav1d
`modules/libavif.bat`
*  accord imp lib to dll name: yuv > libyuv
`modules/libyuv.bat`
*  shared without asm
`modules/dav1d.bat`
*  DBUILD_SHARED_LIBS with vcxproj
`modules/aom.bat`
*  static > shared
`modules/libwebp.bat`
*  fix libname disable add deps to libs (shared build)
`modules/phpsdk-local.bat`
*  refactor shared & static build - disable exe build - shared : libsqlite3 - static : sqlite3
`modules/sqlite.bat`
*  fix deps name: libmaxminddb.lib > libmaxminddb_static.lib & libcurl_imp.lib > libcurl.lib
`modules/httpd.bat`
*  use shared deps : nghttp3_static.lib > nghttp3.lib & libev_static.lib > libev.lib
`modules/ngtcp2.bat`
*  use shared deps : cares_static.lib > cares.lib & libev_static.lib > libev.lib
`modules/nghttp2.bat`
*  libxpm_a > libxpm_static
`modules/libxpm.bat`
*  disable cxx (tiffxx) build use shared deps: turbojpeg-static.lib > jpeg.lib & libdeflatestatic.lib > libdeflate.lib
`modules/libtiff.bat`
*  libmaxminddbstatic > libmaxminddb_static
`modules/libmaxminddb.bat`
*  static: .*-static > .*_static shared (jpeg.lib): jpeg8.dll > jpeg.dll
`modules/libjpeg-turbo.bat`
*  static: libiconv_a > libiconv_static shared (iconv.lib): libiconv.dll > iconv.dll
`modules/libiconv.bat`
*  use deps shared: png_static.lib > libpng16
`modules/freetype2.bat`
*  shared impl lib libcurl_imp.lib > libcurl.lib
`modules/curl.bat`
*  *-static.lib > *._static
`modules/brotli.bat`
*  remove 'if not exist %PATH_INSTALL%\lib\sqlite3.pdb mklink /H %PATH_INSTALL%\lib\sqlite3.pdb %PATH_INSTALL%\bin\sqlite3.pdb'
`modules/apr.bat`
*  zlibstatic.pdb > zlib_static.pdb zlib1.dll > zlib.dll
`modules/zlib.bat`
*  color for lid shared with different dll name
`utils/sub/libcheck.php`
*  rename libdeflatestatic > libdeflate_static
`modules/libdeflate.bat`
*  generate imp lib for shared dll if EV_API_STATIC: EV_API_DECL extern > __declspec(dllexport)
`modules/libev.bat`
`modules/libev.patch`
*  rename -static > _static
`modules/libjpeg-turbo.bat`
*  don't copy yuvconvert.lib
`modules/libyuv.bat`
*  add lerc for libtiff
`SRC_VERSION.md`
`modules/lerc.bat`
`modules/phpanddeps.bat`
`usage.txt`
`utils/bininfo.bat`
`utils/srccreate.bat`
*  add lerc for libtiff
`SRC_VERSION.md`
`modules/lerc.bat`
`modules/phpanddeps.bat`
`usage.txt`
`utils/srccreate.bat`


## 1.4.5 _(2022-02-23)_

*  clean switch for libxml: static || shared
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  libxml2s: - better fix libname & deps in php-src.patch (better than phpsdk-local.bat + phpsdk-config_make.bat) - !! NOT WORKING: add with-libxmlshared in ext/libxml/config.w32 & prepare fix libname: webp & mpir (with %AVXMPIR%)
`modules/php-src.patch`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  update srccreate.bat change mpir scm
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix pdb for webp.lib webpdecoder.lib webpdemux.lib webpmux.lib !! TO DE FINISHED : release-dynamic with good pdb
`modules/libwebp.bat`
*  build static libs
`modules/libxslt.bat`
*  fix static pdb name (missing libxml'2')
`modules/libxml2.bat`
*  accod CFLAGS + /Zf /Zi /FS
`modules/common/meson.sh`
`modules/common/ninja.sh`
*  copy missing imp libs improve 'copy search' loop
`modules/apr.bat`
*  update CMake option for 1.47.0
`modules/nghttp2.bat`
*  disable CMake 'EXPERIMENTAL' warning message
`modules/serf.patch`
*  pdbordllused: fix multiple use of same pdf or dll for multiple libs
`utils/sub/libcheck.php`
*  add specific version & mpir error keywords enable CMake Warning
`utils/sub/logcheck.php`
*  avx.bat: add AVXMPIR mpir.bat: finalize
`avx.bat`
`modules/mpir.bat`
*  fix find LibXml2
`modules/libxlst.FindLibXml2.cmake`
`modules/libxslt.bat`
*  2.9.13 don't need patch cmake > nmake for libxml_a_dll used in php
`modules/libxml2.bat`
`modules/libxml2.patch`
*  indent
`modules/libxslt.bat`
*  dependencies in all
`modules/all.bat`
`usage.txt`
*  add YASM
`README.md`
*  fix shared ON
`modules/libxslt.bat`
*  mpir: static > shared
`modules/php-src.patch`
`modules/phpsdk-local.bat`
*  fix glut > freeglut add mpir & libxslt
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add libxslt
`modules/libxslt.bat`
*  add mpir & libxslt
`utils/bininfo.bat`
*  add gmp (mpir)
`modules/phpsdk-local.bat`
*  add mpir & libxslt mbstring shared
`modules/phpsdk-config_make.bat`
*  libdeflate & libtiff from projgeolibanddeps.bat to phpanddeps.bat rebuild libwebp again for tiff support add mpir & libxslt
`modules/phpanddeps.bat`
`modules/projgeolibanddeps.bat`
`usage.txt`
*  phpanddeps after httpd
`modules/all.bat`
*  add mpir (GMP)
`modules/mpir.bat`
`utils/sub/srcstatus.php`
`utils/sub/version.php`
*  add freeglut giflib libwebp
`SRC_VERSION.md`
`modules/freeglut.bat`
`modules/giflib.bat`
`modules/libwebp.bat`
`modules/phpanddeps.bat`
`usage.txt`
`utils/bininfo.bat`
`utils/srccreate.bat`
*  enable webp
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  enable webp & glut (opengl)
`modules/libtiff.bat`
*  fix BUILD_SHARED_LIBS
`modules/libev.bat`
*  add ref for build and shared issue in PHP
`modules/libiconv.bat`
*  del unused %PATH_INSTALL%\lib\xml2Conf.sh
`modules/libxml2.bat`


## 1.4.4 _(2022-02-19)_

*  all php module as shared (as possible): 30 > 78 global config for --with-toolset=vs & --with-cygwin fix php_iconv.lib required for iconv shared add shared liblzma.lib for libxml
`modules/phpsdk-config_make.bat`
`utils/bininfo.bat`
*  fix bad VERSION for libxml 2.9.12 (according to phpinfo)
`modules/libxml2.patch`
*  update src change scm for libxml2 (mirror github > official gitlab)
`SRC_VERSION.md`
`utils/srccreate.bat`
*  refactor sed in configure.js for comprehensive change in shared & static lib names
`modules/phpsdk-local.bat`
*  fix ext/iconv/iconv.c _libiconv_version for shared iconv.lib (instead of static libiconv_a.lib) move patch for ssl support in phar (libeay32st > libcrypto) from sed (php.bat) to php-src.patch
`modules/php-src.patch`
`modules/php.bat`
*  fix unnecessary multiple checklib
`modules/php-geos.patch`
*  tools config
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  rollback libiconv shared for php (many error LNK2005: _libiconv_version already defined in buf.c.obj in libxml2)
`modules/libiconv.patch`
`modules/phpsdk-local.bat`


## 1.4.3 _(2022-02-18)_

*  comment of lib name corresponding
`modules/icu.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  rewrite bat fix unresolved _libiconv_version for shared use in php build
`modules/libiconv.bat`
`modules/libiconv.patch`
*  fix ninja.sh %AVX% in sse2
`modules/aom.bat`
`modules/apr.bat`
`modules/apr.sh`
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/cares.bat`
`modules/common/meson.sh`
`modules/common/ninja.sh`
`modules/curl.bat`
`modules/dav1d.bat`
`modules/freetype2.bat`
`modules/geographiclib.bat`
`modules/geos.bat`
`modules/httpd.bat`
`modules/jansson.bat`
`modules/libavif.bat`
`modules/libdeflate.bat`
`modules/libev.bat`
`modules/libevent.bat`
`modules/libexpat.bat`
`modules/libgav1.bat`
`modules/libjpeg-turbo.bat`
`modules/libpng.bat`
`modules/libssh2.bat`
`modules/libtiff.bat`
`modules/libxdiff.bat`
`modules/libxml2.bat`
`modules/libyuv.bat`
`modules/libzip.bat`
`modules/nghttp2.bat`
`modules/nghttp3.bat`
`modules/ngtcp2.bat`
`modules/pcre.bat`
`modules/proj.bat`
`modules/serf.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
`modules/wineditline.bat`
`modules/zlib.bat`
`modules/zstd.bat`
*  libffi bump to 3.4.2  - change scm for own msvc building  - build static & shared
`modules/libffi.bat`
`utils/bininfo.bat`
*  update src change scm for libffi
`SRC_VERSION.md`
`utils/srccreate.bat`
*  clean avx var
`avx.bat`
`modules/aom.bat`
`modules/apr.bat`
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/cares.bat`
`modules/curl.bat`
`modules/dav1d.bat`
`modules/freetype2.bat`
`modules/geographiclib.bat`
`modules/geos.bat`
`modules/httpd.bat`
`modules/jansson.bat`
`modules/libavif.bat`
`modules/libdeflate.bat`
`modules/libev.bat`
`modules/libevent.bat`
`modules/libexpat.bat`
`modules/libgav1.bat`
`modules/libjpeg-turbo.bat`
`modules/libpng.bat`
`modules/libssh2.bat`
`modules/libtiff.bat`
`modules/libxdiff.bat`
`modules/libxml2.bat`
`modules/libyuv.bat`
`modules/libzip.bat`
`modules/nghttp2.bat`
`modules/nghttp3.bat`
`modules/ngtcp2.bat`
`modules/pcre.bat`
`modules/phpsdk-config_make.bat`
`modules/proj.bat`
`modules/serf.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
`modules/wineditline.bat`
`modules/zlib.bat`
`modules/zstd.bat`
*  shared lib for dll
`modules/libyuv.bat`
*  memcached > %1
`modules/memcached.bat`
*  change color display LIB WITH NO DLL & PDB
`utils/sub/libcheck.php`
*  check dll for shared lib
`utils/sub/libcheck.php`
*  build curl in global (not_curl/%CURL_VERSION%) %PATH_INSTALL%
`env_sample.bat`
`modules/curl.bat`
`modules/httpd.bat`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
`modules/proj.bat`
`utils/libcheck.bat`
*  remove unused var CURL_VER
`modules/geographiclib.bat`
*  clean unused ressources in /bin
`modules/libxml2.bat`
`modules/openssl.bat`
`utils/bininfo.bat`
*  fix internal libname bz2-1 > bz2
`modules/bzip2.bat`
*  bzip - 1.0.8 > 1.1.0 unreleased - new scm for cmake build
`SRC_VERSION.md`
`modules/bzip2.bat`
`utils/srccreate.bat`
`utils/sub/srcstatus.php`
`utils/sub/version.php`
*  upgrade tools
`README.md`
*  fix libname to use shared
`modules/phpsdk-local.bat`
*  copy impllib to /lib
`modules/libxpm.bat`
*  fix hardcoded path
`modules/liblzma.bat`
`modules/libyuv.bat`
*  comment build type
`modules/libxml2.bat`
*  pretty comment
`modules/libssh2.bat`
*  del bin\event_rpcgen.py
`modules/libevent.bat`
*  fix hard coded path
`modules/php.bat`
*  fix patch for define vsnprintf & strcasecmp
`modules/tidy.patch`
*  add icu libs for sqlite3 dep
`modules/apr.bat`
`modules/proj.bat`
*  upgrade cmake options build with icu fix implib for shared
`modules/sqlite.bat`
*  fix same name for shared and static lib
`modules/freetype2.bat`
`modules/liblzma.bat`
`modules/libssh2.bat`
*  force curl imp lib remove with-xsl
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  remove test call version
`modules/wineditline.bat`
*  move set NINJA to init for -v in verbose mode
`env_sample.bat`
`modules/common/init.bat`
*  add libsodium xsl & xdebug-compression
`modules/phpsdk-config_make.bat`
*  add libsodium for PHP
`SRC_VERSION.md`
`modules/libsodium.bat`
`modules/phpanddeps.bat`
`usage.txt`
`utils/srccreate.bat`
*  update vc_ver: 14.31 > 14.32
`README.md`
`vs17.bat`
*  enable LIBDEFLATE for TIFF
`SRC_VERSION.md`
`modules/libdeflate.bat`
`modules/libtiff.bat`
`modules/projgeolibanddeps.bat`
`usage.txt`
`utils/srccreate.bat`
*  enable NGHTTP3 for NGTCP2
`modules/httpdanddeps.bat`
`modules/ngtcp2.bat`


## 1.4.2 _(2022-02-15)_

*  fix INIT PATH for vs17 in %PATH_RELEASE% & %PATH_BUILDROOT% fix INIT PATH for php in %PATH_BUILDROOT%
`env_sample.bat`
*  fix pdn name: tidy_a.pdb > tidy_static.pdb fix pdb move and copy for /bin & /lib
`modules/tidy.bat`
*  fix pdn name: serf_static.pdb > serf-2.pdb
`modules/serf.bat`
*  fix "warning: failed to remove NUL: Invalid argument" in init.bat 'git clean'
`modules/openssl.bat`
*  create and copy liblua_static.pdb
`modules/lua.bat`
*  CMAKE_DISABLE_FIND_PACKAGE_PkgConfig=ON fix lib name: libgav1_static.lib
`modules/libavif.bat`
*  fix pdb name: GeographicLib_STATIC.pdb > Geographic.pdb
`modules/geographiclib.bat`
*  enable zstd
`modules/libzip.bat`
*  fix pdb name: SQLite3.pdb > sqlite3.pdb
`modules/sqlite.bat`
*  fix lib name: libgav1.lib > libgav1_static.lib
`modules/libgav1.bat`
*  copy ONLY required pdb *.lib in /lib
`modules/apr.bat`
`modules/brotli.bat`
`modules/freetype2.bat`
`modules/icu.bat`
`modules/libevent.bat`
`modules/libjpeg-turbo.bat`
`modules/libpng.bat`
`modules/libxml2.bat`
`modules/ngtcp2.bat`
`modules/zlib.bat`
*  force one pdb for libdav1d
`modules/dav1d.bat`
*  set CURL_VER: from httpd to env_sample (used in libcheck) remove \lib\*.exp
`env_sample.bat`
`modules/httpd.bat`
*  rename c-ares > cares
`modules/httpdanddeps.bat`
*  fix libimpl name: proj.lib > proj_imp.lib
`modules/proj.bat`
*  add libcheck
`modules/all.bat`
*  update NBBIN with zstd
`utils/bininfo.bat`
*  add zstd
`modules/phpanddeps.bat`
*  enable zstd fix comments in cmake cmdline
`modules/libtiff.bat`
*  add zstd rename c-ares > cares
`SRC_VERSION.md`
`modules/cares.bat`
`utils/srccreate.bat`
*  fix wording: upstream > origin
`utils/sub/srcstatus.php`
*  remove unused curlperf util
`utils/sub/curlperf.php`
`utils/sub/curlperf.txt`
*  add zstd
`modules/zstd.bat`
*  add libcheck utils
`utils/libcheck.bat`
`utils/sub/libcheck.php`
*  add libcheck utils add zstd rename c-ares > cares
`usage.txt`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  perl activestate > strawberry
`README.md`
`env_sample.bat`
*  gradle 7.3.3 > 7.4
`modules/mobac.patch`
*  fix LOCAL_COPY
`modules/mobac.bat`
*  add and fix LOCAL_COPY var
`env_sample.bat`
*  simplify clean
`modules/lua.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  r2656
`modules/mobac.patch`
*  update src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix target
`modules/mapsforgesrv.bat`
*  fix  - warning : Unable to find target lstm_res, a dependency of brkitr_brk [C:\sdk\src\icu\icu4c\source\data\makedata.vcxproj]  - LINK : /LTCG specified but no code generation required; remove /LTCG from the link command line to improve linker performance
`modules/icu.bat`
`modules/icu.patch`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  change scm for mod_fcgid (ownn with patch)
`modules/mod_fcgid.patch`
`utils/sub/version.php`
*  update src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  r2645
`modules/mobac.patch`


## 1.4.1 _(2022-01-31)_

*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix version & bininfo
`modules/all.bat`
`modules/apr.bat`
*  add apr apr-util change specific item at the end of description
`utils/sub/version.php`
*  fix unset SCM var fix varonly to set SCM var echo SCM var on verbose
`modules/common/init.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  upgrade tools
`README.md`
*  fix version
`modules/apr.bat`
*  remove unexpected (debug) exit
`modules/phpsdk-local.bat`
*  fix NBBIN
`utils/bininfo.bat`
*  fix icu build before libxml2
`modules/httpdanddeps.bat`
`modules/phpanddeps.bat`
`usage.txt`
*  enable ICU for libxml2.bat add icu lib dep for php libxml2 build
`modules/libxml2.bat`
`modules/phpsdk-local.bat`
*  enable LIBLZMA
`modules/libtiff.bat`
*  clean install dir before building
`modules/proj.bat`
*  fix copy dll
`modules/sqlite.bat`
*  upgrade tools
`README.md`
*  not used anymore
`modules/php-getdeps.php`
*  refactor & clean init sequence
`modules/php.bat`
*  add varonly to init for version
`modules/phpsdk-config_make.bat`
*  add fix in config for lixml static name move sed in src & link for module ressource to php.bat fix configure file name (PHPGITVER:~4,-1 > PHPVER) remove useless var BUILDDIR
`modules/phpsdk-local.bat`
*  keep static name libxml2s and fix pdb name (warn in php build) fix lib path order for ICU if built with (in comment)
`modules/libxml2.bat`
*  remove useless new line
`modules/common/ninja.sh`
*  SCM_VERSION > SCM_COMORREV add varonly better log for SCM_COMORREV & patch apply
`modules/common/init.bat`
*  init varonly for mod version
`modules/httpd.bat`
*  SCM_VERSION > SCM_COMORREV
`modules/mobac.bat`
*  add "err open" vor version error
`utils/sub/logcheck.php`
*  SCM_VERSION > SCM_COMORREV
`utils/sub/version.php`
*  update src change scm for libxpm & mapsforgesrv
`SRC_VERSION.md`
`utils/srccreate.bat`
*  change scm with windows assets https://gitlab.freedesktop.org/xorg/lib/libxpm > https://github.com/nono303/libxpm
`modules/libxpm.bat`
`modules/libxpm.zip`
`modules/libxpm_version.h`
*  simplify revision & version for pecl_memcache in phpinfo()
`modules/pecl-memcache.patch.version`
`modules/php.bat`
*  openssl-quic on main branch (no tag for version)
`utils/sub/srcstatus.php`
*  upgrade tools export config
`README.md`
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  clean unused
`config/eclipse.ini`
`modules/packages-8.1-vc15-x64-staging.txt`
`modules/packages-8.1-vc15-x86-staging.txt`
*  improve LINK FLAGS (dll exe) sed
`modules/common/ninja.sh`
*  fix required targets fix pdb for static lib
`modules/geographiclib.bat`
*  update nb modules (mod_bikeshed)
`utils/bininfo.bat`
*  standalone cmake added to path
`README.md`
`env_sample.bat`
*  win32 readwrite now fixed
`modules/apr.patch`
*  fixe !cmake init
`modules/apr.bat`


## 1.4.0 _(2022-01-19)_

*  add QUIC support
`modules/curl.bat`
`modules/nghttp2.bat`
*  refactor in single batch add QUIC support
`modules/curl.bat`
*  move quick to specific batch update README.md
`env_sample.bat`
`quic.bat`
*  remove OpenSSL in 'find_package(NGTCP2 REQUIRED OpenSSL)' which thrown fatal whereas it had been found...
`modules/curl.patch`
*  prettify: all now in curl.bat
`modules/curl-sub.bat`
*  single build for static & shared build crypto (openssl) fix install, pdb & version
`modules/ngtcp2.bat`
*  fix incorrect pdb path
`modules/nghttp3.bat`
*  add ngtcp2 & nghttp3 if QUIC_BUILD
`modules/httpdanddeps.bat`
*  add QUIC_BUILD and vars depends on
`env_sample.bat`
*  enbale build for openssl & openssl-quic add enable-tls1_3 fix hard coded path
`modules/openssl.bat`
*  set NBBIN for QUIC and !QUIC build
`utils/bininfo.bat`
*  add ngtcp2 & nghttp3 if QUIC enabled
`usage.txt`
*  add openssl-quic
`utils/sub/version.php`
*  add openssl-quic update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add nghttp3 & ngtcp2 (QUIC)
`SRC_VERSION.md`
*  fix sed for https://github.com/quictls/openssl/
`modules/openssl.bat`
*  add ngtcp2.bat & nghttp3.bat (unused as openssl doesn't yet support QUIC)
`modules/nghttp3.bat`
`modules/ngtcp2.bat`
*  fix unused cmake option
`README.md`
`SRC_VERSION.md`
`modules/nghttp2.bat`
`modules/openssl.bat`
`utils/srccreate.bat`
*  add Schannel in Enabled SSL backends (OpenSSL & Schannel)
`modules/curl-sub.bat`
*  add mod_bikeshed
`modules/httpd.patch`
*  add nodejc to PATH
`env_sample.bat`
*  avoid meson error deprecated
`modules/dav1d.patch`
*  build zlib with cmake/ninja (instead of nmake)
`modules/zlib.bat`
`modules/zlib.patch`
*  php-sdk : github.com/microsoft/php-sdk-binary-tools > github.com/php/php-sdk-binary-tools
`SRC_VERSION.md`
`utils/srccreate.bat`
*  remove col diff rename secondsToTime > secondsToNbDay add date from last commit for notags
`utils/sub/_functions.php`
`utils/sub/srcstatus.php`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  mapsforgeVersion = '0.17.0'
`modules/mobac.patch`


## 1.3.2 _(2022-01-06)_

*  update srccreate.bat add short commit id for notags
`SRC_VERSION.md`
`utils/srccreate.bat`
*  1.6.1 > 1.7.0-dev
`modules/apr-util.patch`
*  1.7.0 > 1.7.1-dev
`modules/apr.patch`
*  "apr","apr-util" on trunk short commit id for notags in logtags
`utils/sub/srcstatus.php`
*  v7.81.0
`modules/curl-sub.bat`
*  r2638
`modules/mobac.patch`
*  https://github.com/apache/httpd/pull/258#issuecomment-995717866
`modules/httpd-pr258.patch`
`modules/httpd.bat`
*  upgrade tools
`README.md`
*  r2637
`modules/mobac.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  upgrade tools
`README.md`
*  upgrade tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  2635 log4j > logback
`modules/mobac.patch`
*  mapsforgesrv patch merged in scm
`modules/mapsforgesrv.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  upgrade tools
`README.md`
*  vs17.1 config
`config/.vsconfig`
*  set SCM_* vars for SVN
`modules/common/init.bat`
*  upgrade gradle & deps version
`modules/freetype2.bat`
`modules/icu.bat`
`modules/mapsforgesrv.patch`
*  upgrade gradle version
`modules/mobac.patch`
*  upgrade tools
`README.md`
*  vcxproj.sh for *.props files
`modules/common/vcxproj.sh`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix cd /D %PHP_SRC_DIR% for TS build fix --with-php-build=%PATH_INSTALL% for %PHPVER% != %PHP_FULLBUILD% in 8.1 disable version of module for %PHPVER% != %PHP_FULLBUILD%
`modules/phpsdk-config_make.bat`
*  na
`modules/php.bat`
*  nowarn C4133
`modules/liblzma.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  git reset before pull
`utils/sub/srcstatus.php`


## 1.3.1 _(2021-11-18)_

*  fix Win32 build to x86 version install to %PATH_INSTALL%\_dependencies
`modules/dependencies.bat`
*  version & x64 build (patched)
`modules/verpatch.bat`
*  version
`modules/sdlna.bat`
*  align var name
`modules/liblzma.bat`
*  remove unnecessary calls
`modules/clean.bat`
*  patch for x64 version copy to %PATH_INSTALL%\bin
`modules/verpatch.patch`
`utils/sub/version.php`
*  upgrade tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  nssm & php-cgi-spawner in "all"
`modules/all.bat`
`usage.txt`
`utils/bininfo.bat`
*  disable updaterc review displaying
`utils/sub/bininfo.php`
*  add \bin\iconv  & \iconv
`utils/bininfo.bat`
*  add product root complete nogit for pecl use SCM_TAG instead of git cmd improve verpatch cmd
`utils/sub/version.php`
*  fix git cmd for LIB_VERSION
`modules/phpsdk-local.bat`
*  refactor init and var from git with SCM_*
`modules/php.bat`
*  copy exe & pdb to %PATH_INSTALL%\bin\
`modules/php-cgi-spawner.bat`
*  version and dirty hack for setted value
`modules/nssm.bat`
*  retrieve SCM_* var for git
`modules/common/init.bat`
*  version + extra for modules
`modules/httpd.bat`
`modules/phpsdk-config_make.bat`
*  version
`modules/freetype2.bat`
`modules/libiconv.bat`
`modules/liblzma.bat`
`modules/libssh2.bat`
`modules/nghttp2.bat`
`modules/openssl.bat`
`modules/subversion.bat`
`modules/zlib.bat`
*  disable patch in curl.rc and use version
`modules/curl-sub.bat`
`modules/curl.bat`
*  version for %PATH_INSTALL%\bin\iconv\
`modules/apr.bat`
*  remove updaterc from bininfo
`usage.txt`
*  bugfix replace_extension
`utils/sub/_functions.php`
*  version for openssl.exe
`modules/openssl.bat`
*  disable avx512
`modules/dav1d.bat`
*  fix !avx opts
`modules/common/meson.sh`
*  link to avx cl option
`avx.bat`
*  add options for dav1d.batfix sse2 build in meson
`modules/common/meson.sh`
`modules/dav1d.bat`
*  disable VS telemetry
`avx.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  upgrade tools
`README.md`
*  upgrade vcvars_ver to 14.31
`vs17.bat`
*  upgrade gradle 7.2 > 7.3
`modules/mapsforgesrv.patch`
`modules/mobac.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  ICU 70 BreakIterator now compatible with php8.1.0rc6
`modules/php-src.patch`


## 1.3.0 _(2021-11-09)_

*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  https://github.com/openssl/openssl/issues/16984
`modules/openssl.bat`
*  update windows kit to 10.0.22000.0
`env_sample.bat`
*  openssl3
`env_sample.bat`
`modules/httpd-pr258.patch`
`modules/httpd.bat`
`modules/openssl.bat`
`modules/phpsdk-local.bat`
`modules/serf.patch`
`modules/subversion.bat`
*  ossl-modules added with openssl3
`utils/bininfo.bat`
*  do clean on httpdanddeps.bat
`modules/all.bat`
`modules/httpdanddeps.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`


## 1.2.5 _(2021-11-03)_

*  src change
`modules/libgav1.bat`
`modules/liblzma.patch`
*  update tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  proj 8.2 : 16 > 20
`utils/bininfo.bat`
*  libevent 2.0 x86 : local src on tb303
`modules/memcached_event-2.0.sh`
*  better clean build dir
`modules/phpsdk-local.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  disable dependencies from NO_TAGS
`utils/sub/srcstatus.php`
*  disable false warn
`utils/sub/logcheck.php`
*  update tools
`README.md`
*  add upgrade_pip.bat
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix icu pdb dt version
`modules/icu.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  Fix icu data pdb disable testing build
`modules/icu.bat`
*  patch icu >= 70 https://cgit.freebsd.org/ports/diff/devel/php80-intl/files/patch-icu70?id=2c2eb4692242d0f7c9e125920a712bc8f4ec0154
`modules/php-src.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix typo
`utils/sub/srcstatus.php`
*  improve notags pull and check fix branch regexp
`utils/sub/srcstatus.php`
*  disable 1 new warning for all targets
`modules/icu.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  build all module for icu (required for php intl)
`modules/icu.bat`
*  add icu
`modules/icu.bat`
`modules/phpanddeps.bat`
`usage.txt`
`utils/bininfo.bat`
`utils/sub/version.php`
*  disable php-getdeps clean include & lib dir
`modules/php-getdeps.php`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  add PATH_PHP_BUILD
`env_sample.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  2632
`modules/mobac.patch`
*  update python
`README.md`
*  refactor PHP_BUILD_DIR with PATH_PHP_BUILD
`env_sample.bat`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`


## 1.2.4 _(2021-10-06)_

*  fix libyuv version from file
`utils/sub/version.php`
*  better pad for avx check
`utils/sub/bininfo.php`
*  update nb file (libavif and deps : aom dav1d libgav1 libyuv)
`utils/bininfo.bat`
*  add libavif deps : aom dav1d libgav1 libyuv
`modules/phpanddeps.bat`
*  fix libzma before libxml2
`modules/httpdanddeps.bat`
*  update index
`modules/php-src.patch`
*  copy pdb for bin
`modules/libxml2.bat`
*  add /w (may be redundant) for libxml2
`modules/common/ninja.sh`
*  upgrade vc15 deps for php 8.1
`modules/packages-8.1-vc15-x64-staging.txt`
`modules/packages-8.1-vc15-x86-staging.txt`
*  add libavif and deps : aom dav1d libgav1 (abseil-cpp) libyuv
`SRC_VERSION.md`
`modules/aom.bat`
`modules/dav1d.bat`
`modules/libavif.bat`
`modules/libgav1.bat`
`modules/libyuv.bat`
`usage.txt`
`utils/srccreate.bat`
*  add Meson
`README.md`
`modules/common/meson.sh`
*  @echo off before init
`modules/libavif.bat`
`modules/libjpeg-turbo.bat`
`modules/liblzma.bat`
`modules/libpng.bat`
`modules/libssh2.bat`
`modules/libxdiff.bat`
`modules/libxml2.bat`
`modules/libzip.bat`
`modules/lua.bat`
`modules/pcre.bat`
`modules/tidy.bat`
`modules/wineditline.bat`
*  build php 8.1
`modules/php.bat`
*  add libavif
`modules/libavif.bat`
`modules/phpanddeps.bat`
`modules/phpsdk-local.bat`
`usage.txt`
*  cmake / ninza enable lzma support
`modules/libxml2.bat`
`modules/libxml2.patch`
*  add php 8.1
`modules/phpsdk-config_make.bat`
*  correct pdb for sqlite.lib (static)
`modules/sqlite.bat`
*  fix lastupate lock with php version
`modules/php-getdeps.php`
*  add LZMA static support
`modules/libtiff.bat`
`modules/libtiff.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  refactor usage & remove unused comment in all.bat
`modules/all.bat`
`usage.txt`
*  version for php-cgi-spawner
`modules/php-cgi-spawner.bat`
`utils/sub/version.php`
*  remove unused
`modules/dummy.bat`
*  pdb & version
`modules/libjpeg-turbo.bat`
*  update nb bin (fix png + jpeg > libjpeg-turbo)
`utils/bininfo.bat`
*  fix pdb & version
`modules/libpng.bat`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  v3.10
`modules/geos.bat`
`modules/geos.patch`
*  %SLASHPATH_INSTALL% > %PATH_INSTALL:\=/%
`avx.bat`
`modules/httpd.bat`
`modules/libpng.bat`
`modules/libssh2.bat`
`modules/nghttp2.bat`
`modules/openssl.bat`
`modules/proj.bat`
*  jpeg > libjpeg-turbo
`modules/phpanddeps.bat`
*  jpeg > libjpeg-turbo
`modules/libtiff.bat`
*  update php-getdeps.php
`modules/php-getdeps.php`
*  jpeg > libjpeg-turbo
`usage.txt`
*  update openjdk 16 > 17
`README.md`
*  jpeg > libjpeg-turbo
`modules/phpsdk-local.bat`
*  remove duplicate /Zi
`modules/common/ninja.sh`
*  rm old mod_fcgid patch
`modules/mod_fcgid_53693-benson.patch`
`modules/mod_fcgid_53693-kroonenberg.patch`
`modules/mod_fcgid_53693-pqf_.patch`
*  replace jpeg by libjpeg-turbo
`modules/jpeg.bat`
`modules/libjpeg-turbo.bat`
*  correct cygdrive for libevent2.0
`modules/memcached_event-2.0.sh`
*  mod_h2 2.0.0
`modules/httpd.patch`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  simply network drive src for libevent2 / x86
`modules/memcached_event-2.0.sh`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  openssl 3.0 > 1.1
`modules/httpd-pr258.patch`
`modules/httpd.bat`
`modules/openssl.bat`
`modules/php-src.patch`
`modules/phpsdk-local.bat`
`modules/serf.patch`
`modules/subversion.bat`
*  libpng cmake build
`modules/freetype2.bat`
`modules/libpng.bat`
`modules/libpng.sln`
`modules/libpng.vcxproj`
*  update mod_h2 extra src
`modules/httpd.patch`
*  update usage for all option
`usage.txt`
*  add vs17 to all option
`go.bat`
*  mod_h2 v2
`modules/httpd.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update dependencies
`modules/mapsforgesrv.patch`
`modules/mobac.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  openssl3
`modules/httpd-pr258.patch`
`modules/httpd.bat`
`modules/openssl.bat`
`modules/php-src.patch`
`modules/phpsdk-local.bat`
`modules/serf.patch`
`modules/subversion.bat`
*  remove gradle false warning
`utils/sub/logcheck.php`
*  disable man & doc install correct version
`modules/libssh2.patch`
*  update src
`utils/srccreate.bat`
*  update src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`


## 1.2.3 _(2021-09-20)_

*  geos 8.X build enhance
`modules/geos.bat`
`modules/geos.patch`
*  upgrade src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  upgrade tools
`README.md`
*  add brotli lib in deps for freetype
`modules/phpsdk-local.bat`
*  upgrade gradle 7.2
`modules/mapsforgesrv.patch`
`modules/mobac.patch`
*  update modules in usage
`usage.txt`
*  upgrade mapforgesrv src
`SRC_VERSION.md`
`modules/mapsforgesrv.patch`
*  fix pdb issue clean cmake loop task
`modules/sqlite.bat`
*  r2621
`modules/mobac.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add mapforgesrv
`modules/all.bat`
`modules/mapsforgesrv.bat`
`modules/mapsforgesrv.patch`
*  add secondsToTime (for srcstatus)
`utils/sub/_functions.php`
*  add nb days from last tag
`utils/sub/srcstatus.php`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  upgrade patch for v1.6.10
`modules/memcached.patch`
*  standalone script to buil memcached with libevent 2.0 (tr606 x64 & tb303 x86)
`modules/memcached_event-2.0.sh`
*  change PATH_RELEASE_MEMCACHED for build with libevent 2.0 AND 2.1
`env_sample.bat`
*  fix dll name for libevent 2.1
`modules/memcached.sh`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add NuGet cli
`README.md`
*  add dependencies (commented)
`modules/all.bat`
*  add .NET version update on vcxproj
`env_sample.bat`
`modules/common/vcxproj.sh`
`modules/jemalloc.bat`
`modules/jpeg.bat`
`modules/libffi.bat`
`modules/libiconv.bat`
`modules/liblzma.bat`
`modules/libmaxminddb.bat`
`modules/libpng.bat`
`modules/libxpm.bat`
`modules/nssm.bat`
`modules/subversion.bat`
`modules/verpatch.bat`
`utils/srccreate.bat`
*  add dependencies
`modules/dependencies.bat`
*  var to build TS and/or NTS
`modules/php.bat`
`modules/phpsdk-local.bat`


## 1.2.2 _(2021-07-23)_

*  fix: add lib target instruction instead of link not understand for vc15 build
`modules/liblzma.bat`
*  fix lib & pdb are not build in same folder according to MSVC version (vc15 pdb issue)
`modules/libffi.bat`
*  fix WindowsTargetPlatformVersion (without 'v' prefix)
`modules/common/vcxproj.sh`
*  clean build dir after all
`modules/all.bat`
*  ts OR nts
`modules/php.bat`
*  ts OR nts
`modules/phpsdk-local.bat`
*  disable loop bugfix LTCG for x64
`modules/common/ninja.sh`


## 1.2.1 _(2021-07-22)_

*  nmake > ninja
`modules/geographiclib.bat`
`modules/httpd.bat`
`modules/nghttp2.bat`
*  no change
`modules/zlib.bat`
*  add %NMAKE_OPTS%
`modules/jpeg.bat`
*  disable FindHarfBuzz to avoid useless warning message
`modules/freetype2.bat`
*  no change : rename var
`modules/curl-sub.bat`
*  no change
`modules/apr.bat`
*  unused (nmake > ninja)
`modules/common/flags.sh`
*  sed inline in httpd.bat
`modules/httpd_flags.sh`
*  ninja build instead of nmake (parallel tasks)
`README.md`
`env_sample.bat`
`modules/brotli.bat`
`modules/c-ares.bat`
`modules/common/ninja.sh`
`modules/curl-sub.bat`
`modules/freetype2.bat`
`modules/geos.bat`
`modules/jansson.bat`
`modules/libev.bat`
`modules/libevent.bat`
`modules/libexpat.bat`
`modules/libssh2.bat`
`modules/libtiff.bat`
`modules/libxdiff.bat`
`modules/libzip.bat`
`modules/pcre.bat`
`modules/proj.bat`
`modules/serf.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
`modules/wineditline.bat`
*  2.4.48 : no change
`modules/httpd.patch`
*  sed inline in libev.bat
`modules/libev.sh`
*  not used anymore : built in httpd
`modules/mod_fcgid.bat`
*  vswhere with -prerelease
`modules/php-sdk.patch`
*  /LTCG for lib.exe
`modules/common/flags.sh`
*  change PlatformToolset, VCToolsVersion, WindowsTargetPlatformVersion on vcxproj
`modules/common/vcxproj.sh`
`modules/jemalloc.bat`
`modules/jpeg.bat`
`modules/libffi.bat`
`modules/libiconv.bat`
`modules/liblzma.bat`
`modules/libmaxminddb.bat`
`modules/libpng.bat`
`modules/libxpm.bat`
`modules/nssm.bat`
`modules/subversion.bat`
`modules/verpatch.bat`
*  set VCTOOLSVER
`env_sample.bat`
*  unused
`modules/subversion-svn.sh`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update for vs17 (2022)
`README.md`
*  add /GL /LTCG warnings
`utils/sub/logcheck.php`


## 1.2.0 _(2021-07-21)_

*  rollback vswhere with correct vs2022 install
`modules/php-sdk.patch`
*  fix vs2022 path
`env_sample.bat`
*  export config
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  "dirty" patch while vs17 is not supported on src
`modules/libffi.bat`
`modules/libiconv.bat`
`modules/php-getdeps.php`
*  bugfix srcpath for geos_c.h
`modules/geos.bat`
*  use phpsdk-starter.bat with params instead of phpsdk-%MSVC_DEPS%-%ARCH%.bat
`modules/php.bat`
*  disable vswhere (not working anymore with vs17) for finding set PHP_SDK_VC_DIR and set it with known var %PATH_VS%\VC
`modules/php-sdk.patch`
*  del pcre-config from /bin
`modules/pcre.bat`
*  junction for vs17 with vs16 sln
`modules/libiconv.bat`
*  build with NMake instead of VS (compatibility with vs17)
`modules/geos.bat`
*  update to gradle-7.1.1
`modules/mobac.patch`
*  add vs17
`vs17.bat`
*  update to Visual Studio 2022 (vs17 - 14.3) update to Windows Kit 10.0.20348.0
`env_sample.bat`
*  update tools
`README.md`
*  update src
`modules/pecl-memcache.ccf702b.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`


## 1.1.8 _(2021-05-28)_

*  vs16.10 changes: - version 14.29 - msbuild target rebuild (cf. https://stackoverflow.com/questions/67729222/msbuild-error-msb4057-after-updating-to-vs-2019-16-10-0)
`modules/geos.bat`
`modules/libiconv.bat`
`modules/liblzma.bat`
`modules/libpng.bat`
`modules/subversion.bat`
`vs16.bat`
*  update src
`modules/pecl-memcache.c615b13.patch`
`utils/srccreate.bat`
*  update tools
`README.md`
*  add detail for pecl_memcache version on phpinfo
`modules/php.bat`
*  enable ffi on full build only remove unused options and disable geos for fast build
`modules/phpsdk-config_make.bat`
*  upgrade gradle
`modules/mobac.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  2.4.47 > 2.4.48
`modules/httpd.patch`
*  pecl-text-xdiff 2.1.1-dev
`modules/pecl-text-xdiff.patch`
*  comment for building tilestore-util:jar
`modules/mobac.bat`
*  lzma=no (unimplemented methods ??)
`modules/libxml2.bat`
*  clean nogit versions disable SRC_VERSION.md overwriting
`utils/sub/version.php`
*  clean extra mod_http2_src
`modules/httpd.patch`
*  update version change lzma repo to official
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update config
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  update tools
`README.md`


## 1.1.7 _(2021-05-06)_

*  add LOCAL_COPY for mobac, proj, geographiclib
`env_sample.bat`
`modules/geographiclib.bat`
`modules/mobac.bat`
`modules/proj.bat`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  tools update
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  correct pdb path correct define for useless warnings
`modules/libffi.bat`
*  add new line in log after init
`modules/common/init.bat`
*  gradle 7.0 deprecated launch4j upgrade
`modules/mobac.patch`
*  ASF 2.4.47 changes:
`modules/httpd.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  copy jar to exec dir
`modules/mobac.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add check for _geographiclib
`utils/bininfo.bat`
*  correct projgeolibanddeps
`modules/all.bat`
*  var for filenames padding
`utils/sub/bininfo.php`


## 1.1.6 _(2021-04-10)_

*  change git:// url to https://
`SRC_VERSION.md`
*  clean on all and not on httpdanddeps
`modules/all.bat`
`modules/clean.bat`
`modules/httpdanddeps.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update tools
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  build: libtiff proj geographiclib
`modules/projanddeps.bat`
`modules/projgeolibanddeps.bat`
*  remove clean.bat (unused)
`modules/clean.bat`
*  add geographiclib
`modules/geographiclib.bat`
*  update tools
`README.md`
`config/eclipse.ini`
*  r2583
`modules/mobac.patch`
*  correct SQLITE3_BINARY env var
`modules/proj.bat`
`modules/proj.patch`
*  checkJAXBVersion
`modules/mobac.patch`


## 1.1.5 _(2021-04-01)_

*  avoid ApacheMonitor.rc LONG_NAME redef
`modules/httpd.patch`
*  update tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  FOLDER_RELEASE_CURL pdb & version
`modules/proj.bat`
*  echo off FOLDER_RELEASE_CURL
`modules/httpd.bat`
*  change to RELEASE_PATH
`modules/phpsdk-config_make.bat`
*  version & pdb
`modules/libtiff.bat`
*  display improve
`utils/sub/bininfo.php`
*  add proj.bat var PHP_PATH configure nb
`utils/bininfo.bat`
*  var FOLDER_RELEASE_CURL
`modules/php.bat`
*  correct c-ares
`modules/httpdanddeps.bat`
*  just echo off
`modules/curl.bat`
*  var FOLDER_RELEASE_CURL
`modules/curl-sub.bat`
*  just echo off
`modules/all.bat`
*  remove PATH_RELEASE_PHP (set to PATH_RELEASE) add FOLDER_RELEASE_CURL
`env_sample.bat`
*  unused
`utils/curlperf.bat`
*  add scm link to src name add proj & libtiff
`SRC_VERSION.md`
`utils/srccreate.bat`
*  rename cares > c-ares
`modules/c-ares.bat`
*  correct clean build dir for cmake
`modules/common/init.bat`
*  add required include lauxlib.h
`modules/lua.bat`
*  add proj and lintiff (deps)
`modules/libtiff.bat`
`modules/proj.bat`
`modules/proj.patch`
`modules/projanddeps.bat`


## 1.1.4 _(2021-03-26)_

*  update lua 5.3 > 5.4 (remove luac)
`modules/lua.bat`
`modules/lua.patch`
`utils/bininfo.bat`
`utils/sub/version.php`
*  patch https://patch-diff.githubusercontent.com/raw/apache/httpd/pull/133.patch for lua5.4
`modules/httpd.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  clean build dir
`modules/mobac.bat`
*  update tools
`README.md`
*  bugfix php deps for 8.0 vc15 with locale list
`modules/packages-8.0-vc15-x64-staging.txt`
`modules/packages-8.0-vc15-x86-staging.txt`
`modules/php-getdeps.php`
*  update soft
`README.md`
*  retrieve curl-ca-bundle.crt to /bin
`modules/curl.bat`
*  bugfix release path for x86
`modules/libffi.bat`
*  disable warning C4028 (vc15)
`modules/liblzma.bat`
*  gradle-6.8.3
`modules/mobac.patch`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  exit if deps download fail
`modules/php.bat`
*  disable libcurl.dll for php (same as httpd with openssl backend)
`modules/phpsdk-config_make.bat`
*  update tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  disable phpdbg & phpdbgs correct sed warning CFLAGS
`modules/phpsdk-config_make.bat`
`utils/bininfo.bat`
*  remove prgma warning
`modules/xdebug.patch`
*  disable warning
`modules/geos.bat`
*  update gradle
`modules/mobac.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update tools
`README.md`
*  disable curl winssl backend for httpd mod_md use lib/url.c patch instead - https://www.apachelounge.com/viewtopic.php?p=39826#39826
`modules/curl.bat`
`modules/curl.patch`
`modules/httpd.bat`


## 1.1.3 _(2021-02-05)_

*  disable phpdbg for vc15 (not working)
`modules/phpsdk-config_make.bat`
*  correct ARCH build
`modules/geos.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update mapsforgeVersion = '0.15.0'  get svgSalamander from "https://jitpack.io" and not local anymore update gradle-6.8
`modules/mobac.bat`
`modules/mobac.patch`
`modules/svgSalamander-v1.1.1.jar`
*  uodate tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`SRC_VERSION.md`
`modules/pecl-memcache.e014963.patch`
`utils/srccreate.bat`
*  mod_md 2.3.4
`modules/httpd.patch`
*  update tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  r2661
`modules/mobac.bat`
`modules/mobac.patch`
`modules/svgSalamander-v1.1.1.jar`


## 1.1.2 _(2020-12-28)_

*  mobac v2.2.0: gradle build
`README.md`
`env_sample.bat`
`modules/mobac.bat`
`modules/mobac.patch`
`modules/sqlite-jdbc-3.34.0.jar`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  disable --remove-ignored for svn
`modules/common/init.bat`
*  nowarn C4018
`modules/geos.bat`
*  version 3.34 tagged on git
`modules/sqlite.patch`
*  update ant via eclipse
`env_sample.bat`
*  add verbose option
`usage.txt`
`utils/sub/srcstatus.php`
*  update sqlite for mobac
`modules/mobac.bat`
`modules/sqlite-jdbc-3.34.0.jar`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  split alpah & beta as '.'
`utils/sub/version.php`
*  add version
`modules/geos.bat`
*  disable warning ffi
`modules/libffi.bat`
*  disable patch $revision$ for pecl-memcache
`modules/php.bat`
*  update sdk tools
`README.md`
`env_sample.bat`
*  update src
`SRC_VERSION.md`
`modules/pecl-memcache.0fa35c0.patch`
`utils/srccreate.bat`
*  httpd bin : 157 > 161 : geos (2 dll & pdb) php : 30 > 36 : php_geos (dll & pdb) + php8phpdbg (dll+exe & pdb)
`utils/bininfo.bat`


## 1.1.1 _(2020-12-06)_

*  add php-geos & deps (libgeos)
`modules/geos.bat`
`modules/php.bat`
`modules/phpanddeps.bat`
`modules/phpsdk-config_make.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update pecl-memcache 8.0 c:36d7181
`modules/pecl-memcache.36d7181.patch`
`modules/pecl-memcache.e090f05.patch`
`modules/pecl-memcache.patch.version`
*  correct typo
`modules/php-getdeps.php`
*  update version
`SRC_VERSION.md`
`utils/srccreate.bat`
*  endlocal
`modules/common/init.bat`
*  enable-phpdbg enable-phpdbgs
`modules/phpsdk-config_make.bat`
*  inttypes.h > main/php_stdint.h
`modules/pecl-memcache.e090f05.patch`
*  rename SCM_VERSION patch for pecl-memcache
`modules/pecl-memcache.e090f05.patch`
*  set SCM_VERSION find & SCM_VERSION patch after global patch
`modules/common/init.bat`
*  use global SCM_VERSION
`modules/mobac.bat`
*  revert to common current build
`modules/php.bat`
*  correct PATH_*_SVN
`env_sample.bat`
*  casse change
`modules/sqlite.bat`


## 1.1.0 _(2020-11-14)_

*  last correction for memcache release for all different php and pecl src versions
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  add extra version information for pecl-memcache
`modules/pecl-memcache.patch.version`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  php8
`SRC_VERSION.md`
`modules/pecl-memcache.patch`
`modules/php.bat`
`utils/srccreate.bat`


## 1.0.8 _(2020-11-12)_

*  build libffi for php
`SRC_VERSION.md`
`modules/libffi.bat`
`modules/php-getdeps.php`
`modules/phpanddeps.bat`
`utils/srccreate.bat`
*  correct REM for libzip
`modules/phpsdk-local.bat`
*  update msvc
`README.md`
`vs16.bat`
*  pr 77 & 78
`modules/pecl-memcache.patch`
*  php8 : PR5 fix : pr 2 & 4
`modules/pecl-text-xdiff.patch`
*  php8 : ifdef EAI_SYSTEM
`modules/php-src.patch`
*  php8 : avoid duplicate define strcasecmp & vsnprintf
`modules/tidy.patch`
*  add php8   rename php-memcache-dll out dir
`env_sample.bat`
`modules/phpsdk-config_make.bat`
*  add PHP_FULLBUILD version variable
`modules/php.bat`
*  patch configure liblzma_a lib name
`modules/phpsdk-local.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update tools
`README.md`
*  correct padding
`utils/sub/srcstatus.php`
*  fix current branch check
`utils/sub/srcstatus.php`


## 1.0.7 _(2020-11-01)_

*  clean pecl-memcache_verpatch in build process
`modules/pecl-memcache_verpatch.php`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  tools update
`README.md`
*  version for sqlite from file and not git (repo not maintained)
`utils/sub/version.php`
*  version 3.33.0
`modules/sqlite.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  src update phpsdk-local copy instead of hard link (different disk issue)
`SRC_VERSION.md`
`modules/php.bat`
*  vermatch for openjdk 15
`modules/subversion.patch`
*  https://www.apachelounge.com/viewtopic.php?p=39558#39558
`modules/apr.patch`


## 1.0.6 _(2020-10-02)_

*  tools update
`README.md`
*  add eclipse config
`config/eclipse.ini`
*  5.3.6
`modules/lua.patch`
*  https://github.com/websupport-sk/pecl-memcache/pull/71 merged in  websupport-sk:NON_BLOCKING_IO_php7
`modules/pecl-memcache.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`


## 1.0.5 _(2020-08-26)_

*  add pr71 patch & specific verpath for pecl-memcache
`modules/pecl-memcache.patch`
`modules/pecl-memcache_verpatch.php`
*  correct bug for nb params passing & path
`utils/bininfo.bat`
*  add php 7.1
`modules/phpsdk-config_make.bat`
*  remove libhttpd from deps
`modules/subversion.bat`
*  update src
`utils/srccreate.bat`
*  bug correct if no linker info
`utils/sub/bininfo.php`
*  7.72 : CMAKE_USE_WINSSL > CMAKE_USE_SCHANNEL
`modules/curl-sub.bat`
*  add libhttpd copy to github /deps
`modules/subversion.bat`
*  MSVS 16.7.2
`README.md`
*  add inetutils
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  set STD_PHP_INI_BOOLEAN for change value type for better phpinfo view
`modules/pecl-memcache.patch`
*  build TS patch unset pecl_memcache $Revision$ with current git values (branch & commit)
`modules/php.bat`
*  clean build dir at the end (~2Gb)
`modules/phpsdk-config_make.bat`


## 1.0.4 _(2020-08-11)_

*  prefix dll files with 'lib' for lua, tidy, sqlite (to differentiate pdb with same exe name...)
`modules/httpd.bat`
`modules/lua.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
`utils/bininfo.bat`
*  clean unused xcopy for pdb
`modules/libxml2.bat`
*  note for no-deprecated option
`modules/openssl.bat`
*  correct xcopy for github pecl_memcache
`modules/phpsdk-config_make.bat`
*  update src
`utils/srccreate.bat`
*  https://github.com/websupport-sk/pecl-memcache/pull/71
`modules/pecl-memcache.patch`


## 1.0.3 _(2020-08-07)_

*  vcvars uypdate to 14.27
`vs16.bat`
*  tools update
`README.md`
*  src update to 1.7.3
`modules/libzip.patch`
*  use JAVA_HOME instead of PATH_JDK and current ARCH
`modules/subversion.bat`
*  src update
`utils/srccreate.bat`
*  add reference to sqlite patch
`modules/mobac.bat`
*  remove version in openjdk path
`env_sample.bat`
*  update src
`utils/srccreate.bat`
*  add pdb libzip
`modules/libzip.bat`
*  update Cmake option for 3.23 patch for shared build
`modules/sqlite.bat`
*  update MSVC & NASM
`README.md`
*  add pdb to libzip
`modules/libzip.patch`
`utils/bininfo.bat`
*  add python2\Scripts to PATH_BIN_PYTHON
`env_sample.bat`
*  update 2488 don't build unused ressources
`modules/mobac.bat`
`modules/mobac.patch`
*  sqlite update 3.16.1 > 3.30.1
`modules/mobac.bat`
*  r2478
`modules/mobac.patch`
*  clean patch 53693 for mod_fcgid
`modules/fcgid_bridge.c`
`modules/mod_fcgid.bat`
`modules/mod_fcgid.patch`
`modules/mod_fcgid_53693-kroonenberg.patch`
*  update softs & src
`README.md`
`utils/srccreate.bat`
*  change JavaDK from Oracle 8 to OpenJDK 11
`env_sample.bat`
*  mobac r2477
`modules/mobac.patch`


## 1.0.2 _(2020-06-04)_

*  https://sourceforge.net/p/mobac/forum/general/thread/8cc729d3ee/#191c
`modules/mobac.patch`
*  add libzip & liblzma (for php)
`SRC_VERSION.md`
`modules/liblzma.bat`
`modules/libzip.bat`
`modules/libzip.patch`
`modules/php-getdeps.php`
`modules/phpanddeps.bat`
`modules/phpsdk-local.bat`
`utils/bininfo.bat`
`utils/srccreate.bat`
*  add curlperf description
`usage.txt`
*  correct ARG path for cmake
`modules/libxdiff.bat`
*  use normal init
`modules/mod_fcgid.bat`
*  use another patch for mod_fcgid issue #53693 and include all usable
`modules/fcgid_bridge.c`
`modules/mod_fcgid_53693-benson.patch`
`modules/mod_fcgid_53693-kroonenberg.patch`
`modules/mod_fcgid_53693-pqf_.patch`
*  add link in head for modules
`README.md`
*  r2473
`modules/mobac.bat`
`modules/mobac.patch`


## 1.0.1 _(2020-05-26)_

*  correct "conflicts" check (with ending space)
`utils/sub/logcheck.php`
*  update MSVS 16.6.0 (MSVC 14.26)
`README.md`
`vs16.bat`
*  add keepsrc option (see usage.txt)
`go.bat`
`modules/common/init.bat`
`usage.txt`
*  mod_h2 & subversion updated
`utils/srccreate.bat`
*  add test launch cmd in comment
`modules/subversion.bat`
*  support Tile View even if HTTP code != 200 (but don't cache data)
`modules/mobac.patch`
*  change svn path for avx-version
`env_sample.bat`
*  add mod_fcgid
`usage.txt`
*  keywords for patch failed
`utils/sub/logcheck.php`
*  https://www.apachelounge.com/viewtopic.php?p=39147
`modules/mod_fcgid.patch`
*  standalone
`modules/mod_fcgid.bat`




