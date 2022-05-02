# changelog

## 1.5.3 _(2022-04-05)_

*  1.2.12 : fix no asm
`modules/zlib.bat`
`modules/zlib.patch`
*  bump to 6ee0f95
`modules/php-sdk.patch`
*  0.3.0 : remove fix for dll install bad path
`modules/ngtcp2.bat`
*  bump to gradle-7.4.2
`modules/mobac.patch`
*  add arg[3]: memcached
`utils/sub/version.php`
*  fix missing init and correct version
`modules/memcached.bat`
*  add NOLOGO to link
`modules/lua.bat`
*  remobe unused .net fix
`modules/libmaxminddb.sh`
*  typo
`modules/libavif.bat`
*  fix 'C:\sdk\release\vs17_x64-avx\include\libyuv\scale.h(224): warning C4115: 'libyuv': named type definition in parentheses' for libavif
`modules/libyuv.bat`
*  upgrade tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`


## 1.5.2 _(2022-03-20)_

*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  refactor all, *anddeps > full.bat
`modules/all.bat`
`modules/full.bat`
`modules/httpdanddeps.bat`
`modules/phpanddeps.bat`
`modules/projgeolibanddeps.bat`
`modules/subversionanddeps.bat`
`usage.txt`
*  upgrade tools
`README.md`
*  @echo off
`modules/full.bat`
*  gradle-7.4.1
`modules/mobac.patch`
*  pip-review --pre (pre-release)
`upgrade_pip.bat`
*  keep pcre2-config (needed for httpd)
`modules/pcre2.bat`
*  PREFIXLOG for 'full' build with module or shortcut param
`go.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix DIR_LIB_UNUSED
`modules/apr.bat`
*  fix exit condition
`modules/full.bat`
*  71.1: refactor & limit target
`modules/icu.bat`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add mod_qos (and pcre) for httpd
`SRC_VERSION.md`
`modules/full.bat`
`modules/httpd.bat`
`modules/httpd.patch`
`modules/pcre.bat`
`utils/bininfo.bat`
`utils/srccreate.bat`
`utils/sub/version.php`
*  bump to dav1d 1.0.0
`modules/dav1d.bat`
`modules/dav1d.patch`
*  upgrade tools
`README.md`
*  mapsforge without tag
`utils/sub/srcstatus.php`


## 1.5.1 _(2022-03-09)_

*  serf: build only SHARED for subversion
`modules/serf.bat`
`modules/subversion.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix warning: nssm.vcproj has type 100644, expected 100755
`modules/nssm.patch`
*  improve some options and fix cmake patch
`modules/curl.bat`
`modules/curl.patch`
`utils/bininfo.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  pcre > pcre2 (httpd 2.4.53)
`modules/pcre.bat`
`modules/pcre2.bat`
*  add DIR_LIB_UNUSED
`avx.bat`
`env_sample.bat`
*  pretty copy loop
`modules/aom.bat`
*  add apriconv-1.lib to release move to DIR_LIB_UNUSED
`modules/apr.bat`
*  move to DIR_LIB_UNUSED
`modules/brotli.bat`
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
*  build STATIC > SHARED
`modules/libmaxminddb.bat`
`modules/libmaxminddb.sh`
*  force strtolower($argv[1])
`utils/sub/version.php`
*  fix space
`env_sample.bat`
*  disbale dll check for DIR_LIB_UNUSED
`utils/libcheck.bat`
`utils/sub/libcheck.php`
*  update NBBIN
`utils/bininfo.bat`
*  accord lib name changes: - iconv > libiconv - libmaxminddb_static > maxminddb
`modules/httpd.bat`
*  accord lib name changes: iconv > libiconv
`modules/php-src.patch`
*  fix offsets for 2.4.53
`modules/httpd.patch`
*  pcre > pcre2
`modules/httpdanddeps.bat`
*  add DIR_LIB_UNUSED
`modules/clean.bat`
*  disable STATIC build lib name: iconv > libiconv
`modules/libiconv.bat`
*  fix version (badly on apr-util...) add ZLIB_LIBRARY
`modules/libzip.bat`
*  move to DIR_LIB_UNUSED
`modules/libyuv.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
*  node reuse: false for msbuild
`env_sample.bat`
*  pcre > pcre2
`usage.txt`


## 1.5.0 _(2022-03-03)_

*  move from STATIC to SHARED build
`modules/giflib.bat`
`modules/giflib.patch`
`modules/wineditline.bat`
`modules/wineditline.patch`
*  add python packages config
`config/python.pip`
*  add --expire-unreachable=now for gitgc
`utils/sub/srcstatus.php`
*  use giflib SHARED
`modules/libwebp.bat`
*  bump cmake option to 9.0.0 fix bad option remove deps icu for useless static libsqlite3
`modules/proj.bat`
*  use edit SHARED
`modules/phpsdk-local.bat`
*  bump to 3.38.0 cmake options - remove dirty patch - SQLITE_OMIT_DECLTYPE + SQLITE_ENABLE_COLUMN_METADATA
`modules/sqlite.bat`
*  add php-ext-zstd
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  add giflib as nogit echo 'nogit' file information on debug mode only
`utils/sub/version.php`
*  fix NBBIN + php-ext-zstd - giflib & wineditline static to shared builb
`utils/bininfo.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`


## 1.4.6 _(2022-02-28)_

*  add lerc for libtiff
`SRC_VERSION.md`
`modules/lerc.bat`
`modules/phpanddeps.bat`
`usage.txt`
`utils/srccreate.bat`
*  add lerc for libtiff
`SRC_VERSION.md`
`modules/lerc.bat`
`modules/phpanddeps.bat`
`usage.txt`
`utils/bininfo.bat`
`utils/srccreate.bat`
*  don't copy yuvconvert.lib
`modules/libyuv.bat`
*  rename -static > _static
`modules/libjpeg-turbo.bat`
*  generate imp lib for shared dll if EV_API_STATIC: EV_API_DECL extern > __declspec(dllexport)
`modules/libev.bat`
`modules/libev.patch`
*  rename libdeflatestatic > libdeflate_static
`modules/libdeflate.bat`
*  color for lid shared with different dll name
`utils/sub/libcheck.php`
*  zlibstatic.pdb > zlib_static.pdb zlib1.dll > zlib.dll
`modules/zlib.bat`
*  remove 'if not exist %PATH_INSTALL%\lib\sqlite3.pdb mklink /H %PATH_INSTALL%\lib\sqlite3.pdb %PATH_INSTALL%\bin\sqlite3.pdb'
`modules/apr.bat`
*  *-static.lib > *._static
`modules/brotli.bat`
*  shared impl lib libcurl_imp.lib > libcurl.lib
`modules/curl.bat`
*  use deps shared: png_static.lib > libpng16
`modules/freetype2.bat`
*  static: libiconv_a > libiconv_static shared (iconv.lib): libiconv.dll > iconv.dll
`modules/libiconv.bat`
*  static: .*-static > .*_static shared (jpeg.lib): jpeg8.dll > jpeg.dll
`modules/libjpeg-turbo.bat`
*  libmaxminddbstatic > libmaxminddb_static
`modules/libmaxminddb.bat`
*  disable cxx (tiffxx) build use shared deps: turbojpeg-static.lib > jpeg.lib & libdeflatestatic.lib > libdeflate.lib
`modules/libtiff.bat`
*  libxpm_a > libxpm_static
`modules/libxpm.bat`
*  use shared deps : cares_static.lib > cares.lib & libev_static.lib > libev.lib
`modules/nghttp2.bat`
*  use shared deps : nghttp3_static.lib > nghttp3.lib & libev_static.lib > libev.lib
`modules/ngtcp2.bat`
*  fix deps name: libmaxminddb.lib > libmaxminddb_static.lib & libcurl_imp.lib > libcurl.lib
`modules/httpd.bat`
*  refactor shared & static build - disable exe build - shared : libsqlite3 - static : sqlite3
`modules/sqlite.bat`
*  fix libname disable add deps to libs (shared build)
`modules/phpsdk-local.bat`
*  static > shared
`modules/libwebp.bat`
*  DBUILD_SHARED_LIBS with vcxproj
`modules/aom.bat`
*  shared without asm
`modules/dav1d.bat`
*  accord imp lib to dll name: yuv > libyuv
`modules/libyuv.bat`
*  use shared libs : yuv_static > libyuv & libdav1d > dav1d
`modules/libavif.bat`
*  use shared libs : webp_static.lib > webp.lib
`modules/phpsdk-local.bat`
*  zlib1.dll > zlib.dll
`modules/subversion.bat`
*  fix lib names: libcurl_imp.lib > libcurl.lib & sqlite3.lib > libsqlite3.lib
`modules/proj.bat`
*  fix lib names: sqlite3.lib > libsqlite3.lib
`modules/apr.bat`
`modules/phpsdk-local.bat`
*  change shared lib names: sqlite3 > libsqlite3 (conlict with exe for pdb in /bin) build exe (for proj)
`modules/sqlite.bat`
*  remove /MD
`modules/common/ninja.sh`
*  remove LinkIncremental tags (LTCG conflict)
`modules/common/vcxproj.sh`
*  disable tools/dav1d.exe (unused & conflict pdb with dll) manual copy of include
`modules/dav1d.bat`
*  fix for v2.1.3
`modules/libjpeg-turbo.bat`
*  fix shared build
`modules/libgav1.bat`
`modules/libgav1.sh`
*  remove sed of LinkIncremental as now included in vcxproj.sh manual copy of include
`modules/aom.bat`
*  use shared lib: libgav1
`modules/libavif.bat`
*  upgrade tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix ending tag LinkIncremental
`modules/common/vcxproj.sh`
*  fix unused abseil.dll
`modules/libgav1.bat`
*  fix norpdb in version
`modules/dependencies.bat`
*  call version
`modules/verpatch.bat`
*  fix NBBIN
`utils/bininfo.bat`


## 1.4.5 _(2022-02-23)_

*  del unused %PATH_INSTALL%\lib\xml2Conf.sh
`modules/libxml2.bat`
*  add ref for build and shared issue in PHP
`modules/libiconv.bat`
*  fix BUILD_SHARED_LIBS
`modules/libev.bat`
*  enable webp & glut (opengl)
`modules/libtiff.bat`
*  enable webp
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  add freeglut giflib libwebp
`SRC_VERSION.md`
`modules/freeglut.bat`
`modules/giflib.bat`
`modules/libwebp.bat`
`modules/phpanddeps.bat`
`usage.txt`
`utils/bininfo.bat`
`utils/srccreate.bat`
*  add mpir (GMP)
`modules/mpir.bat`
`utils/sub/srcstatus.php`
`utils/sub/version.php`
*  phpanddeps after httpd
`modules/all.bat`
*  libdeflate & libtiff from projgeolibanddeps.bat to phpanddeps.bat rebuild libwebp again for tiff support add mpir & libxslt
`modules/phpanddeps.bat`
`modules/projgeolibanddeps.bat`
`usage.txt`
*  add mpir & libxslt mbstring shared
`modules/phpsdk-config_make.bat`
*  add gmp (mpir)
`modules/phpsdk-local.bat`
*  add mpir & libxslt
`utils/bininfo.bat`
*  add libxslt
`modules/libxslt.bat`
*  fix glut > freeglut add mpir & libxslt
`SRC_VERSION.md`
`utils/srccreate.bat`
*  mpir: static > shared
`modules/php-src.patch`
`modules/phpsdk-local.bat`
*  fix shared ON
`modules/libxslt.bat`
*  add YASM
`README.md`
*  dependencies in all
`modules/all.bat`
`usage.txt`
*  indent
`modules/libxslt.bat`
*  2.9.13 don't need patch cmake > nmake for libxml_a_dll used in php
`modules/libxml2.bat`
`modules/libxml2.patch`
*  fix find LibXml2
`modules/libxlst.FindLibXml2.cmake`
`modules/libxslt.bat`
*  avx.bat: add AVXMPIR mpir.bat: finalize
`avx.bat`
`modules/mpir.bat`
*  add specific version & mpir error keywords enable CMake Warning
`utils/sub/logcheck.php`
*  pdbordllused: fix multiple use of same pdf or dll for multiple libs
`utils/sub/libcheck.php`
*  disable CMake 'EXPERIMENTAL' warning message
`modules/serf.patch`
*  update CMake option for 1.47.0
`modules/nghttp2.bat`
*  copy missing imp libs improve 'copy search' loop
`modules/apr.bat`
*  accod CFLAGS + /Zf /Zi /FS
`modules/common/meson.sh`
`modules/common/ninja.sh`
*  fix static pdb name (missing libxml'2')
`modules/libxml2.bat`
*  build static libs
`modules/libxslt.bat`
*  fix pdb for webp.lib webpdecoder.lib webpdemux.lib webpmux.lib !! TO DE FINISHED : release-dynamic with good pdb
`modules/libwebp.bat`
*  update srccreate.bat change mpir scm
`SRC_VERSION.md`
`utils/srccreate.bat`
*  libxml2s: - better fix libname & deps in php-src.patch (better than phpsdk-local.bat + phpsdk-config_make.bat) - !! NOT WORKING: add with-libxmlshared in ext/libxml/config.w32 & prepare fix libname: webp & mpir (with %AVXMPIR%)
`modules/php-src.patch`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  clean switch for libxml: static || shared
`modules/php.bat`
`modules/phpsdk-config_make.bat`


## 1.4.4 _(2022-02-19)_

*  rollback libiconv shared for php (many error LNK2005: _libiconv_version already defined in buf.c.obj in libxml2)
`modules/libiconv.patch`
`modules/phpsdk-local.bat`
*  tools config
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  fix unnecessary multiple checklib
`modules/php-geos.patch`
*  fix ext/iconv/iconv.c _libiconv_version for shared iconv.lib (instead of static libiconv_a.lib) move patch for ssl support in phar (libeay32st > libcrypto) from sed (php.bat) to php-src.patch
`modules/php-src.patch`
`modules/php.bat`
*  refactor sed in configure.js for comprehensive change in shared & static lib names
`modules/phpsdk-local.bat`
*  update src change scm for libxml2 (mirror github > official gitlab)
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix bad VERSION for libxml 2.9.12 (according to phpinfo)
`modules/libxml2.patch`
*  all php module as shared (as possible): 30 > 78 global config for --with-toolset=vs & --with-cygwin fix php_iconv.lib required for iconv shared add shared liblzma.lib for libxml
`modules/phpsdk-config_make.bat`
`utils/bininfo.bat`


## 1.4.3 _(2022-02-18)_

*  enable NGHTTP3 for NGTCP2
`modules/httpdanddeps.bat`
`modules/ngtcp2.bat`
*  enable LIBDEFLATE for TIFF
`SRC_VERSION.md`
`modules/libdeflate.bat`
`modules/libtiff.bat`
`modules/projgeolibanddeps.bat`
`usage.txt`
`utils/srccreate.bat`
*  update vc_ver: 14.31 > 14.32
`README.md`
`vs17.bat`
*  add libsodium for PHP
`SRC_VERSION.md`
`modules/libsodium.bat`
`modules/phpanddeps.bat`
`usage.txt`
`utils/srccreate.bat`
*  add libsodium xsl & xdebug-compression
`modules/phpsdk-config_make.bat`
*  move set NINJA to init for -v in verbose mode
`env_sample.bat`
`modules/common/init.bat`
*  remove test call version
`modules/wineditline.bat`
*  force curl imp lib remove with-xsl
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  fix same name for shared and static lib
`modules/freetype2.bat`
`modules/liblzma.bat`
`modules/libssh2.bat`
*  upgrade cmake options build with icu fix implib for shared
`modules/sqlite.bat`
*  add icu libs for sqlite3 dep
`modules/apr.bat`
`modules/proj.bat`
*  fix patch for define vsnprintf & strcasecmp
`modules/tidy.patch`
*  fix hard coded path
`modules/php.bat`
*  del bin\event_rpcgen.py
`modules/libevent.bat`
*  pretty comment
`modules/libssh2.bat`
*  comment build type
`modules/libxml2.bat`
*  fix hardcoded path
`modules/liblzma.bat`
`modules/libyuv.bat`
*  copy impllib to /lib
`modules/libxpm.bat`
*  fix libname to use shared
`modules/phpsdk-local.bat`
*  upgrade tools
`README.md`
*  bzip - 1.0.8 > 1.1.0 unreleased - new scm for cmake build
`SRC_VERSION.md`
`modules/bzip2.bat`
`utils/srccreate.bat`
`utils/sub/srcstatus.php`
`utils/sub/version.php`
*  fix internal libname bz2-1 > bz2
`modules/bzip2.bat`
*  clean unused ressources in /bin
`modules/libxml2.bat`
`modules/openssl.bat`
`utils/bininfo.bat`
*  remove unused var CURL_VER
`modules/geographiclib.bat`
*  build curl in global (not_curl/%CURL_VERSION%) %PATH_INSTALL%
`env_sample.bat`
`modules/curl.bat`
`modules/httpd.bat`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
`modules/proj.bat`
`utils/libcheck.bat`
*  check dll for shared lib
`utils/sub/libcheck.php`
*  change color display LIB WITH NO DLL & PDB
`utils/sub/libcheck.php`
*  memcached > %1
`modules/memcached.bat`
*  shared lib for dll
`modules/libyuv.bat`
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
*  update src change scm for libffi
`SRC_VERSION.md`
`utils/srccreate.bat`
*  libffi bump to 3.4.2  - change scm for own msvc building  - build static & shared
`modules/libffi.bat`
`utils/bininfo.bat`
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
*  rewrite bat fix unresolved _libiconv_version for shared use in php build
`modules/libiconv.bat`
`modules/libiconv.patch`
*  comment of lib name corresponding
`modules/icu.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`


## 1.4.2 _(2022-02-15)_

*  r2645
`modules/mobac.patch`
*  update src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  change scm for mod_fcgid (ownn with patch)
`modules/mod_fcgid.patch`
`utils/sub/version.php`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix  - warning : Unable to find target lstm_res, a dependency of brkitr_brk [C:\sdk\src\icu\icu4c\source\data\makedata.vcxproj]  - LINK : /LTCG specified but no code generation required; remove /LTCG from the link command line to improve linker performance
`modules/icu.bat`
`modules/icu.patch`
*  fix target
`modules/mapsforgesrv.bat`
*  update src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  r2656
`modules/mobac.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  simplify clean
`modules/lua.bat`
*  add and fix LOCAL_COPY var
`env_sample.bat`
*  fix LOCAL_COPY
`modules/mobac.bat`
*  gradle 7.3.3 > 7.4
`modules/mobac.patch`
*  perl activestate > strawberry
`README.md`
`env_sample.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add libcheck utils add zstd rename c-ares > cares
`usage.txt`
*  add libcheck utils
`utils/libcheck.bat`
`utils/sub/libcheck.php`
*  add zstd
`modules/zstd.bat`
*  remove unused curlperf util
`utils/sub/curlperf.php`
`utils/sub/curlperf.txt`
*  fix wording: upstream > origin
`utils/sub/srcstatus.php`
*  add zstd rename c-ares > cares
`SRC_VERSION.md`
`modules/cares.bat`
`utils/srccreate.bat`
*  enable zstd fix comments in cmake cmdline
`modules/libtiff.bat`
*  add zstd
`modules/phpanddeps.bat`
*  update NBBIN with zstd
`utils/bininfo.bat`
*  add libcheck
`modules/all.bat`
*  fix libimpl name: proj.lib > proj_imp.lib
`modules/proj.bat`
*  rename c-ares > cares
`modules/httpdanddeps.bat`
*  set CURL_VER: from httpd to env_sample (used in libcheck) remove \lib\*.exp
`env_sample.bat`
`modules/httpd.bat`
*  force one pdb for libdav1d
`modules/dav1d.bat`
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
*  fix lib name: libgav1.lib > libgav1_static.lib
`modules/libgav1.bat`
*  fix pdb name: SQLite3.pdb > sqlite3.pdb
`modules/sqlite.bat`
*  enable zstd
`modules/libzip.bat`
*  fix pdb name: GeographicLib_STATIC.pdb > Geographic.pdb
`modules/geographiclib.bat`
*  CMAKE_DISABLE_FIND_PACKAGE_PkgConfig=ON fix lib name: libgav1_static.lib
`modules/libavif.bat`
*  create and copy liblua_static.pdb
`modules/lua.bat`
*  fix "warning: failed to remove NUL: Invalid argument" in init.bat 'git clean'
`modules/openssl.bat`
*  fix pdn name: serf_static.pdb > serf-2.pdb
`modules/serf.bat`
*  fix pdn name: tidy_a.pdb > tidy_static.pdb fix pdb move and copy for /bin & /lib
`modules/tidy.bat`
*  fix INIT PATH for vs17 in %PATH_RELEASE% & %PATH_BUILDROOT% fix INIT PATH for php in %PATH_BUILDROOT%
`env_sample.bat`


## 1.4.1 _(2022-01-31)_

*  fixe !cmake init
`modules/apr.bat`
*  win32 readwrite now fixed
`modules/apr.patch`
*  standalone cmake added to path
`README.md`
`env_sample.bat`
*  update nb modules (mod_bikeshed)
`utils/bininfo.bat`
*  fix required targets fix pdb for static lib
`modules/geographiclib.bat`
*  improve LINK FLAGS (dll exe) sed
`modules/common/ninja.sh`
*  clean unused
`config/eclipse.ini`
`modules/packages-8.1-vc15-x64-staging.txt`
`modules/packages-8.1-vc15-x86-staging.txt`
*  upgrade tools export config
`README.md`
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  openssl-quic on main branch (no tag for version)
`utils/sub/srcstatus.php`
*  simplify revision & version for pecl_memcache in phpinfo()
`modules/pecl-memcache.patch.version`
`modules/php.bat`
*  change scm with windows assets https://gitlab.freedesktop.org/xorg/lib/libxpm > https://github.com/nono303/libxpm
`modules/libxpm.bat`
`modules/libxpm.zip`
`modules/libxpm_version.h`
*  update src change scm for libxpm & mapsforgesrv
`SRC_VERSION.md`
`utils/srccreate.bat`
*  SCM_VERSION > SCM_COMORREV
`utils/sub/version.php`
*  add "err open" vor version error
`utils/sub/logcheck.php`
*  SCM_VERSION > SCM_COMORREV
`modules/mobac.bat`
*  init varonly for mod version
`modules/httpd.bat`
*  SCM_VERSION > SCM_COMORREV add varonly better log for SCM_COMORREV & patch apply
`modules/common/init.bat`
*  remove useless new line
`modules/common/ninja.sh`
*  keep static name libxml2s and fix pdb name (warn in php build) fix lib path order for ICU if built with (in comment)
`modules/libxml2.bat`
*  add fix in config for lixml static name move sed in src & link for module ressource to php.bat fix configure file name (PHPGITVER:~4,-1 > PHPVER) remove useless var BUILDDIR
`modules/phpsdk-local.bat`
*  add varonly to init for version
`modules/phpsdk-config_make.bat`
*  refactor & clean init sequence
`modules/php.bat`
*  not used anymore
`modules/php-getdeps.php`
*  upgrade tools
`README.md`
*  fix copy dll
`modules/sqlite.bat`
*  clean install dir before building
`modules/proj.bat`
*  enable LIBLZMA
`modules/libtiff.bat`
*  enable ICU for libxml2.bat add icu lib dep for php libxml2 build
`modules/libxml2.bat`
`modules/phpsdk-local.bat`
*  fix icu build before libxml2
`modules/httpdanddeps.bat`
`modules/phpanddeps.bat`
`usage.txt`
*  fix NBBIN
`utils/bininfo.bat`
*  remove unexpected (debug) exit
`modules/phpsdk-local.bat`
*  fix version
`modules/apr.bat`
*  upgrade tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix unset SCM var fix varonly to set SCM var echo SCM var on verbose
`modules/common/init.bat`
*  add apr apr-util change specific item at the end of description
`utils/sub/version.php`
*  fix version & bininfo
`modules/all.bat`
`modules/apr.bat`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`


## 1.4.0 _(2022-01-19)_

*  mapsforgeVersion = '0.17.0'
`modules/mobac.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  remove col diff rename secondsToTime > secondsToNbDay add date from last commit for notags
`utils/sub/_functions.php`
`utils/sub/srcstatus.php`
*  php-sdk : github.com/microsoft/php-sdk-binary-tools > github.com/php/php-sdk-binary-tools
`SRC_VERSION.md`
`utils/srccreate.bat`
*  build zlib with cmake/ninja (instead of nmake)
`modules/zlib.bat`
`modules/zlib.patch`
*  avoid meson error deprecated
`modules/dav1d.patch`
*  add nodejc to PATH
`env_sample.bat`
*  add mod_bikeshed
`modules/httpd.patch`
*  add Schannel in Enabled SSL backends (OpenSSL & Schannel)
`modules/curl-sub.bat`
*  fix unused cmake option
`README.md`
`SRC_VERSION.md`
`modules/nghttp2.bat`
`modules/openssl.bat`
`utils/srccreate.bat`
*  add ngtcp2.bat & nghttp3.bat (unused as openssl doesn't yet support QUIC)
`modules/nghttp3.bat`
`modules/ngtcp2.bat`
*  fix sed for https://github.com/quictls/openssl/
`modules/openssl.bat`
*  add nghttp3 & ngtcp2 (QUIC)
`SRC_VERSION.md`
*  add openssl-quic update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add openssl-quic
`utils/sub/version.php`
*  add ngtcp2 & nghttp3 if QUIC enabled
`usage.txt`
*  set NBBIN for QUIC and !QUIC build
`utils/bininfo.bat`
*  enbale build for openssl & openssl-quic add enable-tls1_3 fix hard coded path
`modules/openssl.bat`
*  add QUIC_BUILD and vars depends on
`env_sample.bat`
*  add ngtcp2 & nghttp3 if QUIC_BUILD
`modules/httpdanddeps.bat`
*  fix incorrect pdb path
`modules/nghttp3.bat`
*  single build for static & shared build crypto (openssl) fix install, pdb & version
`modules/ngtcp2.bat`
*  prettify: all now in curl.bat
`modules/curl-sub.bat`
*  remove OpenSSL in 'find_package(NGTCP2 REQUIRED OpenSSL)' which thrown fatal whereas it had been found...
`modules/curl.patch`
*  move quick to specific batch update README.md
`env_sample.bat`
`quic.bat`
*  refactor in single batch add QUIC support
`modules/curl.bat`
*  add QUIC support
`modules/curl.bat`
`modules/nghttp2.bat`


## 1.3.2 _(2022-01-06)_

*  git reset before pull
`utils/sub/srcstatus.php`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  nowarn C4133
`modules/liblzma.bat`
*  na
`modules/php.bat`
*  fix cd /D %PHP_SRC_DIR% for TS build fix --with-php-build=%PATH_INSTALL% for %PHPVER% != %PHP_FULLBUILD% in 8.1 disable version of module for %PHPVER% != %PHP_FULLBUILD%
`modules/phpsdk-config_make.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  vcxproj.sh for *.props files
`modules/common/vcxproj.sh`
*  upgrade tools
`README.md`
*  upgrade gradle version
`modules/mobac.patch`
*  upgrade gradle & deps version
`modules/freetype2.bat`
`modules/icu.bat`
`modules/mapsforgesrv.patch`
*  set SCM_* vars for SVN
`modules/common/init.bat`
*  vs17.1 config
`config/.vsconfig`
*  upgrade tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  mapsforgesrv patch merged in scm
`modules/mapsforgesrv.patch`
*  2635 log4j > logback
`modules/mobac.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
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
*  r2637
`modules/mobac.patch`
*  upgrade tools
`README.md`
*  https://github.com/apache/httpd/pull/258#issuecomment-995717866
`modules/httpd-pr258.patch`
`modules/httpd.bat`
*  r2638
`modules/mobac.patch`
*  v7.81.0
`modules/curl-sub.bat`
*  "apr","apr-util" on trunk short commit id for notags in logtags
`utils/sub/srcstatus.php`
*  1.7.0 > 1.7.1-dev
`modules/apr.patch`
*  1.6.1 > 1.7.0-dev
`modules/apr-util.patch`
*  update srccreate.bat add short commit id for notags
`SRC_VERSION.md`
`utils/srccreate.bat`


## 1.3.1 _(2021-11-18)_

*  ICU 70 BreakIterator now compatible with php8.1.0rc6
`modules/php-src.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  upgrade gradle 7.2 > 7.3
`modules/mapsforgesrv.patch`
`modules/mobac.patch`
*  upgrade vcvars_ver to 14.31
`vs17.bat`
*  upgrade tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  disable VS telemetry
`avx.bat`
*  add options for dav1d.batfix sse2 build in meson
`modules/common/meson.sh`
`modules/dav1d.bat`
*  link to avx cl option
`avx.bat`
*  fix !avx opts
`modules/common/meson.sh`
*  disable avx512
`modules/dav1d.bat`
*  version for openssl.exe
`modules/openssl.bat`
*  bugfix replace_extension
`utils/sub/_functions.php`
*  remove updaterc from bininfo
`usage.txt`
*  version for %PATH_INSTALL%\bin\iconv\
`modules/apr.bat`
*  disable patch in curl.rc and use version
`modules/curl-sub.bat`
`modules/curl.bat`
*  version
`modules/freetype2.bat`
`modules/libiconv.bat`
`modules/liblzma.bat`
`modules/libssh2.bat`
`modules/nghttp2.bat`
`modules/openssl.bat`
`modules/subversion.bat`
`modules/zlib.bat`
*  version + extra for modules
`modules/httpd.bat`
`modules/phpsdk-config_make.bat`
*  retrieve SCM_* var for git
`modules/common/init.bat`
*  version and dirty hack for setted value
`modules/nssm.bat`
*  copy exe & pdb to %PATH_INSTALL%\bin\
`modules/php-cgi-spawner.bat`
*  refactor init and var from git with SCM_*
`modules/php.bat`
*  fix git cmd for LIB_VERSION
`modules/phpsdk-local.bat`
*  add product root complete nogit for pecl use SCM_TAG instead of git cmd improve verpatch cmd
`utils/sub/version.php`
*  add \bin\iconv  & \iconv
`utils/bininfo.bat`
*  disable updaterc review displaying
`utils/sub/bininfo.php`
*  nssm & php-cgi-spawner in "all"
`modules/all.bat`
`usage.txt`
`utils/bininfo.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  upgrade tools
`README.md`
*  patch for x64 version copy to %PATH_INSTALL%\bin
`modules/verpatch.patch`
`utils/sub/version.php`
*  remove unnecessary calls
`modules/clean.bat`
*  align var name
`modules/liblzma.bat`
*  version
`modules/sdlna.bat`
*  version & x64 build (patched)
`modules/verpatch.bat`
*  fix Win32 build to x86 version install to %PATH_INSTALL%\_dependencies
`modules/dependencies.bat`


## 1.3.0 _(2021-11-09)_

*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  do clean on httpdanddeps.bat
`modules/all.bat`
`modules/httpdanddeps.bat`
*  ossl-modules added with openssl3
`utils/bininfo.bat`
*  openssl3
`env_sample.bat`
`modules/httpd-pr258.patch`
`modules/httpd.bat`
`modules/openssl.bat`
`modules/phpsdk-local.bat`
`modules/serf.patch`
`modules/subversion.bat`
*  update windows kit to 10.0.22000.0
`env_sample.bat`
*  https://github.com/openssl/openssl/issues/16984
`modules/openssl.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`


## 1.2.5 _(2021-11-03)_

*  refactor PHP_BUILD_DIR with PATH_PHP_BUILD
`env_sample.bat`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  update python
`README.md`
*  2632
`modules/mobac.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add PATH_PHP_BUILD
`env_sample.bat`
*  disable php-getdeps clean include & lib dir
`modules/php-getdeps.php`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  add icu
`modules/icu.bat`
`modules/phpanddeps.bat`
`usage.txt`
`utils/bininfo.bat`
`utils/sub/version.php`
*  build all module for icu (required for php intl)
`modules/icu.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  disable 1 new warning for all targets
`modules/icu.bat`
*  improve notags pull and check fix branch regexp
`utils/sub/srcstatus.php`
*  fix typo
`utils/sub/srcstatus.php`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  patch icu >= 70 https://cgit.freebsd.org/ports/diff/devel/php80-intl/files/patch-icu70?id=2c2eb4692242d0f7c9e125920a712bc8f4ec0154
`modules/php-src.patch`
*  Fix icu data pdb disable testing build
`modules/icu.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix icu pdb dt version
`modules/icu.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add upgrade_pip.bat
*  update tools
`README.md`
*  disable false warn
`utils/sub/logcheck.php`
*  disable dependencies from NO_TAGS
`utils/sub/srcstatus.php`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  better clean build dir
`modules/phpsdk-local.bat`
*  libevent 2.0 x86 : local src on tb303
`modules/memcached_event-2.0.sh`
*  proj 8.2 : 16 > 20
`utils/bininfo.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update tools
`README.md`
*  src change
`modules/libgav1.bat`
`modules/liblzma.patch`


## 1.2.4 _(2021-10-06)_

*  update src & tools
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`utils/srccreate.bat`
*  disable man & doc install correct version
`modules/libssh2.patch`
*  remove gradle false warning
`utils/sub/logcheck.php`
*  openssl3
`modules/httpd-pr258.patch`
`modules/httpd.bat`
`modules/openssl.bat`
`modules/php-src.patch`
`modules/phpsdk-local.bat`
`modules/serf.patch`
`modules/subversion.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update dependencies
`modules/mapsforgesrv.patch`
`modules/mobac.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  mod_h2 v2
`modules/httpd.patch`
*  add vs17 to all option
`go.bat`
*  update usage for all option
`usage.txt`
*  update mod_h2 extra src
`modules/httpd.patch`
*  libpng cmake build
`modules/freetype2.bat`
`modules/libpng.bat`
`modules/libpng.sln`
`modules/libpng.vcxproj`
*  openssl 3.0 > 1.1
`modules/httpd-pr258.patch`
`modules/httpd.bat`
`modules/openssl.bat`
`modules/php-src.patch`
`modules/phpsdk-local.bat`
`modules/serf.patch`
`modules/subversion.bat`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  simply network drive src for libevent2 / x86
`modules/memcached_event-2.0.sh`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  mod_h2 2.0.0
`modules/httpd.patch`
*  correct cygdrive for libevent2.0
`modules/memcached_event-2.0.sh`
*  replace jpeg by libjpeg-turbo
`modules/jpeg.bat`
`modules/libjpeg-turbo.bat`
*  rm old mod_fcgid patch
`modules/mod_fcgid_53693-benson.patch`
`modules/mod_fcgid_53693-kroonenberg.patch`
`modules/mod_fcgid_53693-pqf_.patch`
*  remove duplicate /Zi
`modules/common/ninja.sh`
*  jpeg > libjpeg-turbo
`modules/phpsdk-local.bat`
*  update openjdk 16 > 17
`README.md`
*  jpeg > libjpeg-turbo
`usage.txt`
*  update php-getdeps.php
`modules/php-getdeps.php`
*  jpeg > libjpeg-turbo
`modules/libtiff.bat`
*  jpeg > libjpeg-turbo
`modules/phpanddeps.bat`
*  %SLASHPATH_INSTALL% > %PATH_INSTALL:\=/%
`avx.bat`
`modules/httpd.bat`
`modules/libpng.bat`
`modules/libssh2.bat`
`modules/nghttp2.bat`
`modules/openssl.bat`
`modules/proj.bat`
*  v3.10
`modules/geos.bat`
`modules/geos.patch`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix pdb & version
`modules/libpng.bat`
*  update nb bin (fix png + jpeg > libjpeg-turbo)
`utils/bininfo.bat`
*  pdb & version
`modules/libjpeg-turbo.bat`
*  remove unused
`modules/dummy.bat`
*  version for php-cgi-spawner
`modules/php-cgi-spawner.bat`
`utils/sub/version.php`
*  refactor usage & remove unused comment in all.bat
`modules/all.bat`
`usage.txt`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add LZMA static support
`modules/libtiff.bat`
`modules/libtiff.patch`
*  fix lastupate lock with php version
`modules/php-getdeps.php`
*  correct pdb for sqlite.lib (static)
`modules/sqlite.bat`
*  add php 8.1
`modules/phpsdk-config_make.bat`
*  cmake / ninza enable lzma support
`modules/libxml2.bat`
`modules/libxml2.patch`
*  add libavif
`modules/libavif.bat`
`modules/phpanddeps.bat`
`modules/phpsdk-local.bat`
`usage.txt`
*  build php 8.1
`modules/php.bat`
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
*  add Meson
`README.md`
`modules/common/meson.sh`
*  add libavif and deps : aom dav1d libgav1 (abseil-cpp) libyuv
`SRC_VERSION.md`
`modules/aom.bat`
`modules/dav1d.bat`
`modules/libavif.bat`
`modules/libgav1.bat`
`modules/libyuv.bat`
`usage.txt`
`utils/srccreate.bat`
*  upgrade vc15 deps for php 8.1
`modules/packages-8.1-vc15-x64-staging.txt`
`modules/packages-8.1-vc15-x86-staging.txt`
*  add /w (may be redundant) for libxml2
`modules/common/ninja.sh`
*  copy pdb for bin
`modules/libxml2.bat`
*  update index
`modules/php-src.patch`
*  fix libzma before libxml2
`modules/httpdanddeps.bat`
*  add libavif deps : aom dav1d libgav1 libyuv
`modules/phpanddeps.bat`
*  update nb file (libavif and deps : aom dav1d libgav1 libyuv)
`utils/bininfo.bat`
*  better pad for avx check
`utils/sub/bininfo.php`
*  fix libyuv version from file
`utils/sub/version.php`


## 1.2.3 _(2021-09-20)_

*  var to build TS and/or NTS
`modules/php.bat`
`modules/phpsdk-local.bat`
*  add dependencies
`modules/dependencies.bat`
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
*  add dependencies (commented)
`modules/all.bat`
*  add NuGet cli
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix dll name for libevent 2.1
`modules/memcached.sh`
*  change PATH_RELEASE_MEMCACHED for build with libevent 2.0 AND 2.1
`env_sample.bat`
*  standalone script to buil memcached with libevent 2.0 (tr606 x64 & tb303 x86)
`modules/memcached_event-2.0.sh`
*  upgrade patch for v1.6.10
`modules/memcached.patch`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add nb days from last tag
`utils/sub/srcstatus.php`
*  add secondsToTime (for srcstatus)
`utils/sub/_functions.php`
*  add mapforgesrv
`modules/all.bat`
`modules/mapsforgesrv.bat`
`modules/mapsforgesrv.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  r2621
`modules/mobac.patch`
*  fix pdb issue clean cmake loop task
`modules/sqlite.bat`
*  upgrade mapforgesrv src
`SRC_VERSION.md`
`modules/mapsforgesrv.patch`
*  update modules in usage
`usage.txt`
*  upgrade gradle 7.2
`modules/mapsforgesrv.patch`
`modules/mobac.patch`
*  add brotli lib in deps for freetype
`modules/phpsdk-local.bat`
*  upgrade tools
`README.md`
*  upgrade src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  geos 8.X build enhance
`modules/geos.bat`
`modules/geos.patch`


## 1.2.2 _(2021-07-23)_

*  disable loop bugfix LTCG for x64
`modules/common/ninja.sh`
*  ts OR nts
`modules/phpsdk-local.bat`
*  ts OR nts
`modules/php.bat`
*  clean build dir after all
`modules/all.bat`
*  fix WindowsTargetPlatformVersion (without 'v' prefix)
`modules/common/vcxproj.sh`
*  fix lib & pdb are not build in same folder according to MSVC version (vc15 pdb issue)
`modules/libffi.bat`
*  fix: add lib target instruction instead of link not understand for vc15 build
`modules/liblzma.bat`


## 1.2.1 _(2021-07-22)_

*  add /GL /LTCG warnings
`utils/sub/logcheck.php`
*  update for vs17 (2022)
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  unused
`modules/subversion-svn.sh`
*  set VCTOOLSVER
`env_sample.bat`
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
*  /LTCG for lib.exe
`modules/common/flags.sh`
*  vswhere with -prerelease
`modules/php-sdk.patch`
*  not used anymore : built in httpd
`modules/mod_fcgid.bat`
*  sed inline in libev.bat
`modules/libev.sh`
*  2.4.48 : no change
`modules/httpd.patch`
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
*  sed inline in httpd.bat
`modules/httpd_flags.sh`
*  unused (nmake > ninja)
`modules/common/flags.sh`
*  no change
`modules/apr.bat`
*  no change : rename var
`modules/curl-sub.bat`
*  disable FindHarfBuzz to avoid useless warning message
`modules/freetype2.bat`
*  add %NMAKE_OPTS%
`modules/jpeg.bat`
*  no change
`modules/zlib.bat`
*  nmake > ninja
`modules/geographiclib.bat`
`modules/httpd.bat`
`modules/nghttp2.bat`


## 1.2.0 _(2021-07-21)_

*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`modules/pecl-memcache.ccf702b.patch`
*  update tools
`README.md`
*  update to Visual Studio 2022 (vs17 - 14.3) update to Windows Kit 10.0.20348.0
`env_sample.bat`
*  add vs17
`vs17.bat`
*  update to gradle-7.1.1
`modules/mobac.patch`
*  build with NMake instead of VS (compatibility with vs17)
`modules/geos.bat`
*  junction for vs17 with vs16 sln
`modules/libiconv.bat`
*  del pcre-config from /bin
`modules/pcre.bat`
*  disable vswhere (not working anymore with vs17) for finding set PHP_SDK_VC_DIR and set it with known var %PATH_VS%\VC
`modules/php-sdk.patch`
*  use phpsdk-starter.bat with params instead of phpsdk-%MSVC_DEPS%-%ARCH%.bat
`modules/php.bat`
*  bugfix srcpath for geos_c.h
`modules/geos.bat`
*  "dirty" patch while vs17 is not supported on src
`modules/libffi.bat`
`modules/libiconv.bat`
`modules/php-getdeps.php`
*  export config
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  fix vs2022 path
`env_sample.bat`
*  rollback vswhere with correct vs2022 install
`modules/php-sdk.patch`


## 1.1.8 _(2021-05-28)_

*  update tools
`README.md`
*  update config
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  update version change lzma repo to official
`SRC_VERSION.md`
`utils/srccreate.bat`
*  clean extra mod_http2_src
`modules/httpd.patch`
*  clean nogit versions disable SRC_VERSION.md overwriting
`utils/sub/version.php`
*  lzma=no (unimplemented methods ??)
`modules/libxml2.bat`
*  comment for building tilestore-util:jar
`modules/mobac.bat`
*  pecl-text-xdiff 2.1.1-dev
`modules/pecl-text-xdiff.patch`
*  2.4.47 > 2.4.48
`modules/httpd.patch`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  upgrade gradle
`modules/mobac.patch`
*  enable ffi on full build only remove unused options and disable geos for fast build
`modules/phpsdk-config_make.bat`
*  add detail for pecl_memcache version on phpinfo
`modules/php.bat`
*  update tools
`README.md`
*  update src
`modules/pecl-memcache.c615b13.patch`
`utils/srccreate.bat`
*  vs16.10 changes: - version 14.29 - msbuild target rebuild (cf. https://stackoverflow.com/questions/67729222/msbuild-error-msb4057-after-updating-to-vs-2019-16-10-0)
`modules/geos.bat`
`modules/libiconv.bat`
`modules/liblzma.bat`
`modules/libpng.bat`
`modules/subversion.bat`
`vs16.bat`


## 1.1.7 _(2021-05-06)_

*  var for filenames padding
`utils/sub/bininfo.php`
*  correct projgeolibanddeps
`modules/all.bat`
*  add check for _geographiclib
`utils/bininfo.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  copy jar to exec dir
`modules/mobac.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  ASF 2.4.47 changes:
`modules/httpd.patch`
*  gradle 7.0 deprecated launch4j upgrade
`modules/mobac.patch`
*  add new line in log after init
`modules/common/init.bat`
*  correct pdb path correct define for useless warnings
`modules/libffi.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  tools update
`README.md`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add LOCAL_COPY for mobac, proj, geographiclib
`env_sample.bat`
`modules/geographiclib.bat`
`modules/mobac.bat`
`modules/proj.bat`


## 1.1.6 _(2021-04-10)_

*  checkJAXBVersion
`modules/mobac.patch`
*  correct SQLITE3_BINARY env var
`modules/proj.bat`
`modules/proj.patch`
*  r2583
`modules/mobac.patch`
*  update tools
`README.md`
`config/eclipse.ini`
*  add geographiclib
`modules/geographiclib.bat`
*  remove clean.bat (unused)
`modules/clean.bat`
*  build: libtiff proj geographiclib
`modules/projanddeps.bat`
`modules/projgeolibanddeps.bat`
*  update tools
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  clean on all and not on httpdanddeps
`modules/all.bat`
`modules/clean.bat`
`modules/httpdanddeps.bat`
*  change git:// url to https://
`SRC_VERSION.md`


## 1.1.5 _(2021-04-01)_

*  add proj and lintiff (deps)
`modules/libtiff.bat`
`modules/proj.bat`
`modules/proj.patch`
`modules/projanddeps.bat`
*  add required include lauxlib.h
`modules/lua.bat`
*  correct clean build dir for cmake
`modules/common/init.bat`
*  rename cares > c-ares
`modules/c-ares.bat`
*  add scm link to src name add proj & libtiff
`SRC_VERSION.md`
`utils/srccreate.bat`
*  unused
`utils/curlperf.bat`
*  remove PATH_RELEASE_PHP (set to PATH_RELEASE) add FOLDER_RELEASE_CURL
`env_sample.bat`
*  just echo off
`modules/all.bat`
*  var FOLDER_RELEASE_CURL
`modules/curl-sub.bat`
*  just echo off
`modules/curl.bat`
*  correct c-ares
`modules/httpdanddeps.bat`
*  var FOLDER_RELEASE_CURL
`modules/php.bat`
*  add proj.bat var PHP_PATH configure nb
`utils/bininfo.bat`
*  display improve
`utils/sub/bininfo.php`
*  version & pdb
`modules/libtiff.bat`
*  change to RELEASE_PATH
`modules/phpsdk-config_make.bat`
*  echo off FOLDER_RELEASE_CURL
`modules/httpd.bat`
*  FOLDER_RELEASE_CURL pdb & version
`modules/proj.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update tools
`README.md`
*  avoid ApacheMonitor.rc LONG_NAME redef
`modules/httpd.patch`


## 1.1.4 _(2021-03-26)_

*  disable curl winssl backend for httpd mod_md use lib/url.c patch instead - https://www.apachelounge.com/viewtopic.php?p=39826#39826
`modules/curl.bat`
`modules/curl.patch`
`modules/httpd.bat`
*  update tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update gradle
`modules/mobac.patch`
*  disable warning
`modules/geos.bat`
*  remove prgma warning
`modules/xdebug.patch`
*  disable phpdbg & phpdbgs correct sed warning CFLAGS
`modules/phpsdk-config_make.bat`
`utils/bininfo.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update tools
`README.md`
*  disable libcurl.dll for php (same as httpd with openssl backend)
`modules/phpsdk-config_make.bat`
*  exit if deps download fail
`modules/php.bat`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  gradle-6.8.3
`modules/mobac.patch`
*  disable warning C4028 (vc15)
`modules/liblzma.bat`
*  bugfix release path for x86
`modules/libffi.bat`
*  retrieve curl-ca-bundle.crt to /bin
`modules/curl.bat`
*  update soft
`README.md`
*  bugfix php deps for 8.0 vc15 with locale list
`modules/packages-8.0-vc15-x64-staging.txt`
`modules/packages-8.0-vc15-x86-staging.txt`
`modules/php-getdeps.php`
*  update tools
`README.md`
*  clean build dir
`modules/mobac.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  patch https://patch-diff.githubusercontent.com/raw/apache/httpd/pull/133.patch for lua5.4
`modules/httpd.patch`
*  update lua 5.3 > 5.4 (remove luac)
`modules/lua.bat`
`modules/lua.patch`
`utils/bininfo.bat`
`utils/sub/version.php`


## 1.1.3 _(2021-02-05)_

*  r2661
`modules/mobac.bat`
`modules/mobac.patch`
`modules/svgSalamander-v1.1.1.jar`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update tools
`README.md`
*  mod_md 2.3.4
`modules/httpd.patch`
*  update src
`SRC_VERSION.md`
`modules/pecl-memcache.e014963.patch`
`utils/srccreate.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  uodate tools
`README.md`
*  update mapsforgeVersion = '0.15.0'  get svgSalamander from "https://jitpack.io" and not local anymore update gradle-6.8
`modules/mobac.bat`
`modules/mobac.patch`
`modules/svgSalamander-v1.1.1.jar`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  correct ARCH build
`modules/geos.bat`
*  disable phpdbg for vc15 (not working)
`modules/phpsdk-config_make.bat`


## 1.1.2 _(2020-12-28)_

*  httpd bin : 157 > 161 : geos (2 dll & pdb) php : 30 > 36 : php_geos (dll & pdb) + php8phpdbg (dll+exe & pdb)
`utils/bininfo.bat`
*  update src
`SRC_VERSION.md`
`modules/pecl-memcache.0fa35c0.patch`
`utils/srccreate.bat`
*  update sdk tools
`README.md`
`env_sample.bat`
*  disable patch $revision$ for pecl-memcache
`modules/php.bat`
*  disable warning ffi
`modules/libffi.bat`
*  add version
`modules/geos.bat`
*  split alpah & beta as '.'
`utils/sub/version.php`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update sqlite for mobac
`modules/mobac.bat`
`modules/sqlite-jdbc-3.34.0.jar`
*  add verbose option
`usage.txt`
`utils/sub/srcstatus.php`
*  update ant via eclipse
`env_sample.bat`
*  version 3.34 tagged on git
`modules/sqlite.patch`
*  nowarn C4018
`modules/geos.bat`
*  disable --remove-ignored for svn
`modules/common/init.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  mobac v2.2.0: gradle build
`README.md`
`env_sample.bat`
`modules/mobac.bat`
`modules/mobac.patch`
`modules/sqlite-jdbc-3.34.0.jar`


## 1.1.1 _(2020-12-06)_

*  casse change
`modules/sqlite.bat`
*  correct PATH_*_SVN
`env_sample.bat`
*  revert to common current build
`modules/php.bat`
*  use global SCM_VERSION
`modules/mobac.bat`
*  set SCM_VERSION find & SCM_VERSION patch after global patch
`modules/common/init.bat`
*  rename SCM_VERSION patch for pecl-memcache
`modules/pecl-memcache.e090f05.patch`
*  inttypes.h > main/php_stdint.h
`modules/pecl-memcache.e090f05.patch`
*  enable-phpdbg enable-phpdbgs
`modules/phpsdk-config_make.bat`
*  endlocal
`modules/common/init.bat`
*  update version
`SRC_VERSION.md`
`utils/srccreate.bat`
*  correct typo
`modules/php-getdeps.php`
*  update pecl-memcache 8.0 c:36d7181
`modules/pecl-memcache.36d7181.patch`
`modules/pecl-memcache.e090f05.patch`
`modules/pecl-memcache.patch.version`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add php-geos & deps (libgeos)
`modules/geos.bat`
`modules/php.bat`
`modules/phpanddeps.bat`
`modules/phpsdk-config_make.bat`


## 1.1.0 _(2020-11-14)_

*  php8
`SRC_VERSION.md`
`modules/pecl-memcache.patch`
`modules/php.bat`
`utils/srccreate.bat`
*  add extra version information for pecl-memcache
`modules/pecl-memcache.patch.version`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  last correction for memcache release for all different php and pecl src versions
`modules/php.bat`
`modules/phpsdk-config_make.bat`


## 1.0.8 _(2020-11-12)_

*  fix current branch check
`utils/sub/srcstatus.php`
*  correct padding
`utils/sub/srcstatus.php`
*  update tools
`README.md`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  patch configure liblzma_a lib name
`modules/phpsdk-local.bat`
*  add PHP_FULLBUILD version variable
`modules/php.bat`
*  add php8   rename php-memcache-dll out dir
`env_sample.bat`
`modules/phpsdk-config_make.bat`
*  php8 : avoid duplicate define strcasecmp & vsnprintf
`modules/tidy.patch`
*  php8 : ifdef EAI_SYSTEM
`modules/php-src.patch`
*  php8 : PR5 fix : pr 2 & 4
`modules/pecl-text-xdiff.patch`
*  pr 77 & 78
`modules/pecl-memcache.patch`
*  update msvc
`README.md`
`vs16.bat`
*  correct REM for libzip
`modules/phpsdk-local.bat`
*  build libffi for php
`SRC_VERSION.md`
`modules/libffi.bat`
`modules/php-getdeps.php`
`modules/phpanddeps.bat`
`utils/srccreate.bat`


## 1.0.7 _(2020-11-01)_

*  https://www.apachelounge.com/viewtopic.php?p=39558#39558
`modules/apr.patch`
*  vermatch for openjdk 15
`modules/subversion.patch`
*  src update phpsdk-local copy instead of hard link (different disk issue)
`SRC_VERSION.md`
`modules/php.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  version 3.33.0
`modules/sqlite.patch`
*  version for sqlite from file and not git (repo not maintained)
`utils/sub/version.php`
*  tools update
`README.md`
*  src update
`SRC_VERSION.md`
`utils/srccreate.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  clean pecl-memcache_verpatch in build process
`modules/pecl-memcache_verpatch.php`
`modules/php.bat`
`modules/phpsdk-config_make.bat`


## 1.0.6 _(2020-10-02)_

*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  https://github.com/websupport-sk/pecl-memcache/pull/71 merged in  websupport-sk:NON_BLOCKING_IO_php7
`modules/pecl-memcache.patch`
*  5.3.6
`modules/lua.patch`
*  add eclipse config
`config/eclipse.ini`
*  tools update
`README.md`


## 1.0.5 _(2020-08-26)_

*  clean build dir at the end (~2Gb)
`modules/phpsdk-config_make.bat`
*  build TS patch unset pecl_memcache $Revision$ with current git values (branch & commit)
`modules/php.bat`
*  set STD_PHP_INI_BOOLEAN for change value type for better phpinfo view
`modules/pecl-memcache.patch`
*  add inetutils
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  MSVS 16.7.2
`README.md`
*  add libhttpd copy to github /deps
`modules/subversion.bat`
*  7.72 : CMAKE_USE_WINSSL > CMAKE_USE_SCHANNEL
`modules/curl-sub.bat`
*  bug correct if no linker info
`utils/sub/bininfo.php`
*  update src
`utils/srccreate.bat`
*  remove libhttpd from deps
`modules/subversion.bat`
*  add php 7.1
`modules/phpsdk-config_make.bat`
*  correct bug for nb params passing & path
`utils/bininfo.bat`
*  add pr71 patch & specific verpath for pecl-memcache
`modules/pecl-memcache.patch`
`modules/pecl-memcache_verpatch.php`


## 1.0.4 _(2020-08-11)_

*  https://github.com/websupport-sk/pecl-memcache/pull/71
`modules/pecl-memcache.patch`
*  update src
`utils/srccreate.bat`
*  correct xcopy for github pecl_memcache
`modules/phpsdk-config_make.bat`
*  note for no-deprecated option
`modules/openssl.bat`
*  clean unused xcopy for pdb
`modules/libxml2.bat`
*  prefix dll files with 'lib' for lua, tidy, sqlite (to differentiate pdb with same exe name...)
`modules/httpd.bat`
`modules/lua.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
`utils/bininfo.bat`


## 1.0.3 _(2020-08-07)_

*  mobac r2477
`modules/mobac.patch`
*  change JavaDK from Oracle 8 to OpenJDK 11
`env_sample.bat`
*  update softs & src
`README.md`
`utils/srccreate.bat`
*  clean patch 53693 for mod_fcgid
`modules/fcgid_bridge.c`
`modules/mod_fcgid.bat`
`modules/mod_fcgid.patch`
`modules/mod_fcgid_53693-kroonenberg.patch`
*  r2478
`modules/mobac.patch`
*  sqlite update 3.16.1 > 3.30.1
`modules/mobac.bat`
*  update 2488 don't build unused ressources
`modules/mobac.bat`
`modules/mobac.patch`
*  add python2\Scripts to PATH_BIN_PYTHON
`env_sample.bat`
*  add pdb to libzip
`modules/libzip.patch`
`utils/bininfo.bat`
*  update MSVC & NASM
`README.md`
*  update Cmake option for 3.23 patch for shared build
`modules/sqlite.bat`
*  add pdb libzip
`modules/libzip.bat`
*  update src
`utils/srccreate.bat`
*  remove version in openjdk path
`env_sample.bat`
*  add reference to sqlite patch
`modules/mobac.bat`
*  src update
`utils/srccreate.bat`
*  use JAVA_HOME instead of PATH_JDK and current ARCH
`modules/subversion.bat`
*  src update to 1.7.3
`modules/libzip.patch`
*  tools update
`README.md`
*  vcvars uypdate to 14.27
`vs16.bat`


## 1.0.2 _(2020-06-04)_

*  r2473
`modules/mobac.bat`
`modules/mobac.patch`
*  add link in head for modules
`README.md`
*  use another patch for mod_fcgid issue #53693 and include all usable
`modules/fcgid_bridge.c`
`modules/mod_fcgid_53693-benson.patch`
`modules/mod_fcgid_53693-kroonenberg.patch`
`modules/mod_fcgid_53693-pqf_.patch`
*  use normal init
`modules/mod_fcgid.bat`
*  correct ARG path for cmake
`modules/libxdiff.bat`
*  add curlperf description
`usage.txt`
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
*  https://sourceforge.net/p/mobac/forum/general/thread/8cc729d3ee/#191c
`modules/mobac.patch`


## 1.0.1 _(2020-05-26)_

*  standalone
`modules/mod_fcgid.bat`
*  https://www.apachelounge.com/viewtopic.php?p=39147
`modules/mod_fcgid.patch`
*  keywords for patch failed
`utils/sub/logcheck.php`
*  add mod_fcgid
`usage.txt`
*  change svn path for avx-version
`env_sample.bat`
*  support Tile View even if HTTP code != 200 (but don't cache data)
`modules/mobac.patch`
*  add test launch cmd in comment
`modules/subversion.bat`
*  mod_h2 & subversion updated
`utils/srccreate.bat`
*  add keepsrc option (see usage.txt)
`go.bat`
`modules/common/init.bat`
`usage.txt`
*  update MSVS 16.6.0 (MSVC 14.26)
`README.md`
`vs16.bat`
*  correct "conflicts" check (with ending space)
`utils/sub/logcheck.php`




