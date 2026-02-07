# changelog


## 1.15.3 _(2026-02-07)_

*  update tools & src
`README.md`
`SRC_VERSION.md`
`config/cyg64.packagelist`
`utils/srccreate.bat`
*  gradle 9.4.0-m5
`patches/mobac_gradle-wrapper.jar`
*  typo
`modules/common/msbuild.php`
*  2.7.4
`modules/libexpat.bat`
*  VS2022 > VS2026 (fix hardcoded path)
`modules/libiconv.bat`
*  BUILD_PYTHON_BINDINGS: OFF > ON (require numpy & swig) * build & install python_wheel
`config/python.pip`
`modules/gdal.bat`
*  extract PATH_SCRIPT_PYTHON from PATH_BIN_PYTHON for swig (gdal)
`env_sample.bat`


## 1.15.2 _(2026-01-15)_

*  1.15.2
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  gradle 9.4.0-milestone-4
`env_sample.bat`
`patches/mobac_gradle-wrapper.jar`
*  3.51.2
`modules/sqlite.bat`
*  8.18
`patches/curl.patch`
*  libheif 1.21: - build with FFmpeg - dirty patch to fix missing (useless) aom_static
`env_sample.bat`
`modules/libheif.bat`
`patches/libheif.patch`
*  gradle - upgarde - use --configuration-cache
`env_sample.bat`
`modules/fit2gpx.bat`
`modules/mapsforgesrv.bat`
`modules/mobac.bat`
`modules/tzdataservice.bat`
`patches/mobac_gradle-wrapper.jar`
*  Lua: 5.4 > 5.5 https://gitlab.kitware.com/cmake/cmake/-/issues/27476
`modules/lua.bat`
`patches/mod_security.patch`
*  fix 'redefinition; different basic types' when compiling pecl-parallel: 1.2.8 > 1.2.9 https://sourceforge.net/p/mingw-w64/mailman/mingw-w64-public/thread/0ede7d94-2a48-44b6-a5d7-02403d9e05df%40126.com/ ``` C:\sdk\phpmaster\vs18\x64\php-src\main\php.h(95): error C2371: 'pid_t': redefinition; different basic types (compiling source file ..\pecl\pecl-parallel\src\check.c) C:\sdk\release\vs18_x64-avx2\include\sched.h(60): note: see declaration of 'pid_t' (compiling source file ..\pecl\pecl-parallel\src\check.c) ```
`patches/pthread-win32.patch`
*  https://github.com/yrutschle/sslh/issues/506 fixed
`patches/sslh.patch`
`utils/sub/version.php`


## 1.15.1 _(2025-12-13)_

*  1.15.1
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix null & add disabled display of useless cmake opts
`utils/sub/cmopts.php`
*  disable program build
`modules/libxslt.bat`
`utils/bininfo.bat`
*  add, remove, fix CMake opts
`modules/cares.bat`
`modules/curl.bat`
`modules/freetype2.bat`
`modules/libavif.bat`
`modules/libevent.bat`
`modules/libgd.bat`
`modules/libheif.bat`
`modules/libjpeg-turbo.bat`
`modules/libpng.bat`
`modules/libssh2.bat`
`modules/libwebp.bat`
`modules/libzip.bat`
`modules/pcre2.bat`
`modules/proj.bat`
`modules/qhull.bat`
`modules/serf.bat`
`modules/sqlite.bat`
*  fix CRLF
`modules/aom.bat`
`modules/apr-util.bat`
`modules/apr.bat`
`modules/brotli.bat`
`modules/dav1d.bat`
`modules/freeglut.bat`
`modules/gdal.bat`
`modules/geographiclib.bat`
`modules/geos.bat`
`modules/giflib.bat`
`modules/httpd.bat`
`modules/icu.bat`
`modules/jansson.bat`
`modules/jemalloc.bat`
`modules/lerc.bat`
`modules/libdeflate.bat`
`modules/libev.bat`
`modules/libexpat.bat`
`modules/libffi.bat`
`modules/libgav1.bat`
`modules/libgeotiff.bat`
`modules/libiconv.bat`
`modules/liblzma.bat`
`modules/libmaxminddb.bat`
`modules/libsodium.bat`
`modules/libtiff.bat`
`modules/libxdiff.bat`
`modules/libxml2.bat`
`modules/libxpm.bat`
`modules/libyuv.bat`
`modules/mod_fcgid.bat`
`modules/mpir.bat`
`modules/openssl.bat`
`modules/pthread-win32.bat`
`modules/sslh.bat`
`modules/verpatch.bat`
`modules/wineditline.bat`
`modules/yajl.bat`
*  zstd: add LZMA & ZLIB support
`modules/full.bat`
`modules/zstd.bat`
*  BUILD_TESTING only available for STATIC build
`modules/nghttp2.bat`
`modules/nghttp3.bat`
`modules/ngtcp2.bat`
*  add missing and remove useles CMakeopts
`modules/aom.bat`
`modules/cares.bat`
`modules/curl.bat`
`modules/freeglut.bat`
`modules/freetype2.bat`
`modules/gdal.bat`
*  pdb path changed in CMake 4.2.1
`modules/apr.bat`
`modules/libxml2.bat`
*  remove useless
`config/vs2026.vssettings`
`utils/cmakeopts.bat`
*  1.34.6
`patches/cares.patch`
*  2.0.37
`patches/mod_h2.patch`
*  fix copy moved to ApacheCommon HttpClient
`modules/mobac.bat`
`patches/mobac.patch`
*  +arg cmakeopts
`go.bat`
`modules/aom.bat`
`modules/apr-util.bat`
`modules/apr.bat`
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/cares.bat`
`modules/common/init.bat`
`modules/freeglut.bat`
`modules/freetype2.bat`
`modules/gdal.bat`
`modules/geographiclib.bat`
`modules/geos.bat`
`modules/giflib.bat`
`modules/jansson.bat`
`modules/lerc.bat`
`modules/libavif.bat`
`modules/libdeflate.bat`
`modules/libev.bat`
`modules/libevent.bat`
`modules/libexpat.bat`
`modules/libffi.bat`
`modules/libgav1.bat`
`modules/libgd.bat`
`modules/libgeotiff.bat`
`modules/libheif.bat`
`modules/libjpeg-turbo.bat`
`modules/liblzma.bat`
`modules/libmaxminddb.bat`
`modules/libpng.bat`
`modules/libssh2.bat`
`modules/libtiff.bat`
`modules/libwebp.bat`
`modules/libxdiff.bat`
`modules/libxslt.bat`
`modules/libyuv.bat`
`modules/libzip.bat`
`modules/mod_fcgid.bat`
`modules/nghttp2.bat`
`modules/nghttp3.bat`
`modules/ngtcp2.bat`
`modules/pcre2.bat`
`modules/proj.bat`
`modules/pthread-win32.bat`
`modules/qhull.bat`
`modules/serf.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
`modules/wineditline.bat`
`modules/yajl.bat`
`modules/zlib.bat`
`modules/zstd.bat`
`usage.txt`
`utils/cmakeopts.bat`
`utils/sub/cmopts.php`
*  improx flag fix
`modules/common/meson.sh`
*  8.18
`modules/curl.bat`
`patches/curl.patch`
*  2.4.66
`patches/httpd.patch`
*  remove useless +Xlint:-removal +Cmake Build in comment (wait for SVN_ENABLE_JAVAHL)
`modules/subversion.bat`
*  - nssm serf
`utils/bininfo.bat`
*  clean implement %PATH_INSTALL%.svn
`go.bat`
`modules/subversionanddeps.bat`
*  build to %PATH_INSTALL%.svn fix deps copy for openssl
`modules/subversionanddeps.bat`
*  1.15.0-dev
`modules/subversion.bat`
`patches/subversion.patch`
*  SERF_LAST_GOOD https://github.com/apache/serf/commit/013f693de4c337b930d1c020a17d8daa574bbba3
`modules/serf.bat`
`patches/serf.013f693.patch`
`patches/serf.patch.disable`
*  -serf & nssm
`modules/full.bat`
*  mod_dav_install_lib only for svn build
`modules/httpd.bat`
`patches/httpd.patch`
*  https://github.com/apache/serf/commit/9cf0878aafefa04df775d3e424f16ee07d423901 breaks svn fix version on https://github.com/apache/serf/commit/013f693de4c337b930d1c020a17d8daa574bbba3
`modules/serf.bat`
`patches/serf.patch.disable`
*  fix alpha, beta & rc for all (+nogit, not only git)
`utils/sub/version.php`
*  typo
`modules/openssl.bat`
*  fix null
`utils/sub/bininfo.php`
*  +arg svn without brotli
`modules/serf.bat`
`modules/subversionanddeps.bat`
*  sh > php
`modules/verpatch.bat`
*  install mod_dav lib (for subversion)
`patches/httpd.patch`
*  fix null
`utils/sub/bininfo.php`
*  -libiconv openssl-quic
`utils/sub/version.php`
*  cmake 1.17 > msbuild 1.18
`modules/libiconv.bat`
`patches/libiconv.patch`
*  sh > php
`avx.bat`
`modules/common/msbuild.php`
`modules/common/vcxproj.sh`
`modules/dependencies.bat`
`modules/icu.bat`
`modules/jemalloc.bat`
`modules/libsodium.bat`
`modules/libxpm.bat`
`modules/nssm.bat`
`modules/subversion.bat`
*  + \bin\engines-3 \bin\ossl-modules - gperf.exe libcharset.dll
`utils/bininfo.bat`
*  fix & clean before moving it to php
`modules/common/vcxproj.sh`
*  CMake 4.2: fix pdb path
`modules/libxml2.bat`
*  +CMAKE_DISABLE_FIND_PACKAGE_xxx
`modules/libheif.bat`
`modules/libiconv.bat`
*  tiff-cxx: ON > OFF (unused)
`modules/libtiff.bat`
*  fix: delete unused exp in /lib
`modules/httpd.bat`
*  comment usage of libaprapp-1
`modules/apr.bat`
*  9b161dcc: +nowarn C4319
`modules/libsodium.bat`
*  +BUILD_TESTING=OFF
`modules/nghttp2.bat`
*  1.13.1
`modules/nghttp3.bat`
*  Visual Studio 18.0.x
`config/.vsconfig`
`config/vs2026.vssettings`
`patches/php-sdk.patch`
*  fix -pcre2_compile_class.c for >= 8.4.15
`patches/php-src/8.4/ext-pcre.patch`
*  search dll in /bin subdirs & /_php-ts
`utils/sub/libcheck.php`
*  -"Using unknown MSVC version" // php +"Could NOT find" // CMake except gdal & libwebp first pass
`utils/sub/logcheck.php`
*  comment install_lib for mod_cache, mod_dav, mod_proxy, mod_session, mod_watchdog
`patches/httpd.patch`
*  https://gist.github.com/nono303/be0f9b3f04da2ee921b938a0ab8f1e74 https://www.apachelounge.com/viewtopic.php?p=43821#43821
`patches/php-src/8.5/win7.patch`
*  fix COMPILE_PDB_NAME libaprapp-1
`patches/apr.patch`
*  3.8.0
`modules/freeglut.bat`
*  update msbuild opts
`env_sample.bat`
`modules/common/vcxproj.sh`
*  remove log "Status engine is currently disabled"
`patches/mod_security.patch`
*  8.5.0-rc5
`patches/php-src/8.5/ext-pcre.patch`
*  https://www.apachelounge.com/viewtopic.php?p=43799#43799
`patches/curl.patch`
*  https://bugs.xdebug.org/view.php?id=2372#c7412
`patches/php-src/8.5/pecl-xdebug.patch`
*  3.12.0
`patches/gdal.patch`
*  fix svn patch: PATH_MODULES > PATH_PATCHES
`modules/common/init.bat`
*  3.6.0
`modules/openssl.bat`
`patches/openssl.patch`
*  upgrade gradle
`env_sample.bat`
`modules/mobac.bat`
*  https://github.com/xdebug/xdebug/pull/1040
`patches/php-src/8.5/pecl-xdebug.patch`
*  upgrade gradle
`modules/mobac_gradle-wrapper.jar`
`patches/mobac.patch`
`patches/mobac_gradle-wrapper.jar`


## 1.15.0 _(2025-10-22)_

*  1.15.0
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix typo
`env_sample.bat`
*  0a9450c6
`modules/libsodium.bat`
*  fix install headers files
`modules/tidy.bat`
`patches/tidy.patch`
*  +md_util_exec for MDMessageCmd & MDNotifyCmd initialized at startup
`patches/mod_md.patch`
*  pretty log for configure
`modules/phpsdk-config_make.bat`
*  10.47
`patches/pcre2.patch`
*  3.12
`modules/gdal.bat`
*  refactor & clean for parallel build (5x faster)
`modules/openssl.bat`
`patches/openssl.patch`
*  add JOM for openssl parallel build
`README.md`
`env_sample.bat`
`modules/common/init.bat`
*  https://github.com/libgd/libgd/commit/4fed668cc9bb953055a6cf1df5df0131e53bd96d
`patches/libgd/pr970.patch`
*  call ninja.sh use LIBCURL_STATIC_NAME fix name & copy pdb
`modules/curl.bat`
*  add LIBCURL_STATIC_NAME for curl & httpd fix hardcoded & rename DIR_LIB_UNUSED > DIR_LIB_STATIC
`avx.bat`
`env_sample.bat`
`modules/brotli.bat`
`modules/clean.bat`
`modules/httpd.bat`
`modules/php.bat`
`utils/libcheck.bat`
`utils/sub/libcheck.php`
*  comment
`modules/common/ninja.sh`
*  https://github.com/websupport-sk/pecl-memcache/issues/119 https://github.com/websupport-sk/pecl-memcache/pull/120
`patches/pecl-memcache.patch`
*  disable unused static build
`modules/tidy.bat`
`modules/yajl.bat`
`patches/tidy.patch`
`patches/yajl.patch`
*  * php 8.5 (-php_opcache) * PATH_INSTALL_OSSL >  PATH_INSTALL
`utils/bininfo.bat`
*  fix patch for ENABLE_LIB_ONLY=ON remove legacy QUIC build type
`modules/nghttp2.bat`
`patches/nghttp2.patch`
*  remove legacy QUIC build type regarding OpenSSL version (patched or not) PATH_INSTALL_OSSL > PATH_INSTALL - OPENSSL_SCM & OPENSSL_SUF
`README.md`
`avx.bat`
`modules/common/init.bat`
`modules/full.bat`
`modules/httpd.bat`
`modules/libssh2.bat`
`modules/openssl.bat`
`modules/serf.bat`
`modules/subversion.bat`
`modules/subversionanddeps.bat`
`quic.bat`
`usage.txt`
`utils/libcheck.bat`
*  rollback missing IMPORT_LIB_SUFFIX
`modules/curl.bat`
*  global refactor * better vars for configure options according to build type   * log current configure for build type   * fix configure option (duplicate, non-sense...) * remove legacy QUIC var for OpenSSL * add SHARED_OPCACHE for shared dll removed in 8.5
`modules/phpsdk-config_make.bat`
*  fix nghttp3 eroro with ENABLE_LIB_ONLY
`patches/nghttp2.patch`
*  global refactor * use gitapply factorized by patch type (version, ext, pecl) + core build_type + improve dependencies check for win7 build type + generate def files for libxml2 & ext_pcre
`modules/php.bat`
*  build & use curl_static with only schannel (WinSSL) as backend https://github.com/icing/mod_md/issues/14 always (legacy QUIC 1) build libcurl with HTTP/3 + Openssl Only (MultiSSL cannot be enabled with HTTP/3 and vice versa)
`modules/curl.bat`
`modules/httpd.bat`
`patches/httpd.patch`
*  fix LOCAL_COPY_MSVC_VER: 17 > 18
`env_sample.bat`
*  8.17 https://github.com/curl/curl/pull/18703
`env_sample.bat`
`modules/curl.bat`
`patches/curl/ca-win.patch`
*  typo
`utils/gitapply.bat`
*  +OPTION(BUILD_PROGRAMS) fix: BUILD_TEST > BUILD_TESTS fix: #ifdef _MSC_VER: #define ssize_t SSIZE_T > #include <stdint.h> fix: patch offset
`modules/libgd.bat`
`patches/libgd.patch`
`patches/libgd/pr514.patch`
`patches/libgd/pr851.patch`
`patches/libgd/pr883.patch`
`patches/libgd/pr884.patch`
`patches/libgd/pr895.patch`
`patches/libgd/pr920.patch`
`patches/libgd/pr946.patch`
`patches/libgd/pr960.patch`
`patches/libgd/pr967.patch`
`patches/libgd/pr968.patch`
`patches/libgd/pr969.patch`
*  waiting PR as patch https://github.com/libgd/libgd/pulls
`patches/libgd/pr852.skip`
`patches/libgd/pr876.skip`
`patches/libgd/pr877.skip`
`patches/libgd/pr883.patch`
`patches/libgd/pr884.patch`
`patches/libgd/pr895.patch`
`patches/libgd/pr906.skip`
`patches/libgd/pr912.patch`
`patches/libgd/pr913.ko`
`patches/libgd/pr918.patch`
`patches/libgd/pr920.patch`
`patches/libgd/pr939.patch`
`patches/libgd/pr940.skip`
`patches/libgd/pr949.patch`
`patches/libgd/pr960.patch`
`patches/libgd/pr961.patch`
`patches/libgd/pr965.patch`
`patches/libgd/pr966.patch`
`patches/libgd/pr967.patch`
`patches/libgd/pr968.patch`
`patches/libgd/pr969.patch`
`patches/libgd/pr970.patch`
*  https://github.com/libgd/libgd/pull/946
`patches/libgd.patch`
`patches/libgd/pr946.patch`
*  use gitapply
`modules/curl.bat`
`modules/libgd.bat`
`utils/gitapply.bat`
*  use gitapply display branch if not on tag
`modules/common/init.bat`
*  fix from 8.5
`patches/php-src/8.4/ext-iconv.patch`
*  PHP_EXTERNAL_PCRE:  + pcre2-32.lib  + ext_pcre.def (generated in php.bat)  fix parseInt for PCRE2_CODE_UNIT_WIDTH
`patches/php-src/8.4/ext-pcre.patch`
`patches/php-src/8.5/ext-pcre.patch`
*  + /nologo for minilua.exe & gen_ir_fold_hash.exe
`patches/php-src/8.4/ext-opcache.patch`
`patches/php-src/8.5/ext-opcache.patch`
*  https://bugs.xdebug.org/view.php?id=2372
`patches/php-src/8.5/pecl-xdebug.patch`
*  for static ext build: fix error LNK2001: symbole externe non resolu _libiconv_version
`patches/php-src/8.4/ext-iconv.patch`
`patches/php-src/8.5/ext-iconv.patch`
*  https://github.com/php/php-src/commit/f50942068da95af1a712f3a0fd784f96ffc77027
`modules/php-src_libxml2-def.patch`
*  explode patches by ext
`patches/php-src/8.4/ext-gd.patch`
`patches/php-src/8.4/ext-gmp.patch`
`patches/php-src/8.4/ext-iconv.patch`
`patches/php-src/8.4/ext-intl.patch`
`patches/php-src/8.4/ext-libxml.patch`
`patches/php-src/8.4/ext-pcre.patch`
`patches/php-src/8.4/ext-phar.patch`
`patches/php-src/8.4/pr17848.patch`
`patches/php-src/8.4/win7.patch`
`patches/php-src/8.5/ext-gd.patch`
`patches/php-src/8.5/ext-gmp.patch`
`patches/php-src/8.5/ext-iconv.patch`
`patches/php-src/8.5/ext-intl.patch`
`patches/php-src/8.5/ext-libxml.patch`
`patches/php-src/8.5/ext-pcre.patch`
`patches/php-src/8.5/ext-phar.patch`
*  move patches: PATH_MODULES > PATH_PATCHES
`env_sample.bat`
`patches/aom.patch`
`patches/apr-util.patch`
`patches/cares.patch`
`patches/curl/ca-win.patch`
`patches/dependencies.patch`
`patches/gdal.patch`
`patches/giflib.patch`
`patches/httpd.patch`
`patches/icu.patch`
`patches/libconfig.patch`
`patches/libev.patch`
`patches/libffi.patch`
`patches/libgd.patch`
`patches/libgd/pr514.patch`
`patches/libgd/pr692.patch`
`patches/libgd/pr851.patch`
`patches/libiconv.patch`
`patches/libssh2.patch`
`patches/libtiff.patch`
`patches/libxml2.patch`
`patches/libxslt.patch`
`patches/libzip.patch`
`patches/memcached.patch`
`patches/mobac.patch`
`patches/mod_h2.patch`
`patches/mod_h264_streaming.patch`
`patches/mod_security-sdbm-util.patch`
`patches/mod_security.patch`
`patches/ngtcp2.patch`
`patches/nssm.patch`
`patches/openssl.patch`
`patches/pcre2.patch`
`patches/pecl-memcache.patch`
`patches/pecl-parallel.patch`
`patches/pecl-system-sync.patch`
`patches/php-sdk.patch`
`patches/php-src/8.5/pr17848.patch`
`patches/php-src/8.5/win7.patch`
`patches/pthread-win32.patch`
`patches/serf.patch`
`patches/sqlite.patch`
`patches/sslh.patch`
`patches/subversion.patch`
`patches/verpatch.patch`
`patches/wineditline.patch`
`patches/xdebug.patch`
`patches/yajl.patch`
`patches/zstd.patch`
*  add PHP_BUILD_TYPE=win7 remove conflicted --enable-embed on full build
`modules/phpsdk-config_make.bat`
*  remove Win7 debug apply tmp php-src patch after main one add PHP_BUILD_TYPE=win7
`modules/php.bat`
*  remove debug only Win7 upgrade patch for 8.4
`modules/php-src_win7.patch`
`modules/php-src_win7d.patch`
*  fixed https://github.com/php/php-src/pull/20110
`modules/php-src_8.5.patch`
*  2662e1bb
`modules/pcre2.patch`
*  update nowarn
`modules/icu.bat`
*  update libxml 2.15.0
`modules/php-src_libxml2-def.patch`
*  fix NTS --with-openssl-argon2 & TS --with-parallel=shared only on full build
`modules/phpsdk-local.bat`
*  -cmake +14.4 ATL
`config/.vsconfig`
*  https://github.com/php/php-src/issues/20106
`modules/php-src_8.5.patch`
*  78.1
`modules/icu.bat`
*  1.2.0
`modules/brotli.bat`
*  clean useless old fix commented
`modules/phpsdk-config_make.bat`
*  https://bugs.xdebug.org/view.php?id=2372
`modules/xdebug.patch`
*  fix: subversion-deps > subversionanddeps
`usage.txt`
*  fix vs17 hardcoded references
`modules/libxslt.bat`
`modules/libyuv.bat`
`modules/mod_zstd.bat`
`modules/sqlite.bat`
*  set modules optionnals for svn build
`modules/httpd.patch`
*  update PATH_XXX_SVN: vs17 > vs18
`env_sample.bat`
*  fix dest path for libaprapp-1.pdb
`modules/apr.bat`
*  upgrade deps
`modules/dependencies.patch`
*  https://github.com/libexpat/libexpat/issues/1070
`modules/libexpat.patch`
`modules/subversion.patch`
*  https://github.com/libexpat/libexpat/issues/1070
`modules/libexpat.patch`
*  drop vs16 & add vs18 support
`README.md`
`config/.vsconfig`
`env_sample.bat`
`go.bat`
`usage.txt`
`utils/sub/php.ini`
`vs16.bat`
`vs18.bat`
*  fix missing links for pecl ext when creating folder structure
`modules/php.bat`
*  fix missing pdb for libaprapp-1
`modules/apr.bat`
*  2.6
`modules/geographiclib.bat`
*  clean useless
`modules/libffi.bat`
`modules/libffi.sh`


## 1.14.2 _(2025-09-30)_

*  1.14.2
`changelog.md`
*  b0cea02e
`modules/pcre2.patch`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  r2798
`modules/mobac.bat`
`modules/mobac.patch`
*  f2df5593 * fix duplicate cmake option APU_USE_EXPAT & APU_USE_LIBXML2 * APU_DSO_BUILD: ON > OFF * disable static build
`modules/apr-util.bat`
`modules/apr-util.patch`
`utils/bininfo.bat`
*  disable static build
`modules/apr.bat`
*  simply & improve view in row of tags, branch & revision
`utils/sub/srcstatus.php`
*  pull deps before build
`modules/pcre2.bat`
*  update src
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix param passing to php
`utils/version.bat`
*  remove unused local git branch on gitgc
`utils/sub/srcstatus.php`
*  upgrade tools
`README.md`
`config/cyg64.packagelist`
`config/python.pip`
*  https://github.com/php/php-src/pull/18660
`modules/phpsdk-config_make.bat`
*  fix sed for BROTLI_LIB_VERSION
`modules/php.bat`
*  fix runtime dependency name
`modules/sslh.bat`
*  +nocxx
`modules/nghttp3.bat`
`modules/ngtcp2.bat`
*  https://github.com/apache/serf/commit/fc79b45ddbfc1276a75487510684200b0d362e3a SerfFindPkgConfig(OpenSSL...) don't work: rollback to find_package(OpenSSL REQUIRED) ``` CMake Error in CMakeLists.txt:   Imported target "PkgConfig::OPENSSL_SSL" includes non-existent path     "/usr/include"   in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:   * The path was deleted, renamed, or moved to another location.   * An install or uninstall procedure did not complete successfully.   * The installation package was faulty and references files it does not   provide. ```
`modules/serf.bat`
`modules/serf.patch`
*  extract var SET LIBCONFIG_NAME
`modules/sslh.bat`
*  2.3.0 https://github.com/yrutschle/sslh/issues/506
`modules/sslh.patch`
*  QUIC_BUILD or not: same number of built files
`utils/bininfo.bat`
*  8.16.0
`modules/curl_ca-win.patch`
*  always build nghttp3 & ngtcp2 (with ossl support)
`modules/full.bat`
*  fix php_ffi versioning
`modules/phpsdk-config_make.bat`
*  1.15.1 fix built dll: quictls > ossl
`modules/ngtcp2.bat`
*  https://github.com/websupport-sk/pecl-memcache/commit/ac8e8c521a18aae14c8f2859694536ead304ce97
`modules/pecl-memcache.patch`
*  2.0.35
`modules/mod_h2.patch`
*  disable check_include_file(zlib.h) before find_package(ZLIB)
`modules/sqlite.patch`
*  fix double dotted version
`utils/sub/version.php`
*  4.7.1
`modules/libtiff.bat`
*  3.13.1
`modules/aom.patch`
*  9.7.0
`modules/proj.bat`
*  1.11.0
`modules/nghttp3.bat`
*  nghttp2
`modules/nghttp2.bat`
*  2.15.0
`modules/libxml2.bat`
`modules/libxml2.patch`
*  10.47
`modules/pcre2.patch`
*  2797
`modules/mobac.patch`
*  GRADLEVER: 9.0 > 9.1
`env_sample.bat`
*  org.mapsforge > com.github.mapsforge.mapsforge
`modules/mapsforgesrv.bat`
`modules/mobac.bat`
*  disable warning message
`modules/ngtcp2.patch`
*  upgrade gradle & deps
`env_sample.bat`
`modules/mobac.patch`
*  fix Can't exec "git": Permission denied at version.pl
`modules/memcached.bat`


## 1.14.1 _(2025-07-30)_

*  1.14.1
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  fix php_ffi version
`modules/phpsdk-config_make.bat`
*  https://github.com/icing/mod_md/pull/389
`modules/httpd.patch`
*  8.15.0
`modules/curl.bat`
*  +php_src fix: check if file exist before calling verpatch
`utils/sub/version.php`
*  fix build without git tag
`modules/php.bat`
*  local copy only for full build
`modules/phpsdk-config_make.bat`
*  +pthread version in phpinfo
`modules/pecl-parallel.patch`
*  pthreads4w > pthread-win32
`modules/full.bat`
`usage.txt`
`utils/sub/version.php`
*  6c65db1
`modules/serf.patch`
*  disable address sanitizer
`modules/openssl.bat`
*  move https://github.com/jwinarske/pthreads4w to updated https://github.com/GerHobbelt/pthread-win32
`modules/pthread-win32.bat`
`modules/pthread-win32.patch`
`modules/pthreads4w.patch`
*  remove  * build for php < 8.4 (configure & link openssl3 applink.c sources to module)  * useless var native-intrinsics add  * php 8.5 configure:  * + --with-verbosity=2  * - --enable-sanitizer (https://stackoverflow.com/questions/67854212/msvc-address-sanitizer-any-reason-to-use-it-in-release-builds)  * --with-parallel=shared wrongly duplicated in phpsdk-config_make.bat (set in phpsdk-local.bat for TS only)
`modules/php-src_8.5.patch`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  php 8.5 https://github.com/php/pecl-system-sync/commit/b2251ec9fdf0af1c898ec8e0b0b03099c9f246af.patch
`modules/pecl-system-sync.patch`
*  move to original repo: https://github.com/jwinarske/pthreads4w > https://git.code.sf.net/p/pthreads4w/code
`modules/pthreads4w.bat`
`modules/pthreads4w.patch`
*  proxytunnel from master (fixed https://github.com/proxytunnel/proxytunnel/commit/b4ddf94b4568b4d9a54b8893e8dbf11fb1f00177)
`modules/proxytunnel.patch`
`utils/sub/version.php`
*  8.4.11
`modules/php-src_pr17848.patch`
*  fix php_ffi version
`modules/phpsdk-config_make.bat`
*  http.maxConnections: 20 > 128 +http.keepalive: true
`modules/mobac.patch`


## 1.14.0 _(2025-07-13)_

*  1.14.0
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add libffi and enable php_ffi
`modules/full.bat`
`modules/libffi.bat`
`modules/libffi.patch`
`modules/libffi.sh`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`usage.txt`
`utils/bininfo.bat`
`utils/sub/version.php`
*  https://github.com/owasp-modsecurity/ModSecurity/issues/2893#issuecomment-3066608664
`modules/mod_security.patch`
*  remove dynamic DEFS fix WITH_PCRE2 https://github.com/owasp-modsecurity/ModSecurity/issues/2893#issuecomment-3065618986
`modules/mod_security.patch`
*  https://github.com/icing/mod_h2/issues/277#issuecomment-3048931035
`modules/httpd.patch`
*  fix version from git with multi-line tag
`utils/sub/version.php`
*  gradlew dependencyInsight
`modules/fit2gpx.bat`
`modules/mapsforgesrv.bat`
`modules/mobac.bat`
`modules/tzdataservice.bat`
*  comment all println
`modules/mobac.patch`
*  display runtime dependencies remove /out (deliver jar via github release)
`modules/fit2gpx.bat`
*  typo  improve [init]
`modules/common/init.bat`
*  typo:  + module duration  dos2unix quiet
`go.bat`
*  2.4.64
`modules/httpd.patch`
*  +GET_VERSION improve output
`modules/common/init.bat`
*  force 'git tag --points-at HEAD' instead of pathenv("SCM_TAG")
`utils/sub/version.php`
*  HTTPD_VERSION : init varonly > version.php + ZSTD_VERSION fix /std:clatest for vs16
`modules/mod_zstd.bat`
*  fix version for mod_bikeshed
`modules/httpd.bat`
*  BROTLI_VERSION : init varonly > version.php
`modules/php.bat`
*  + CMAKE_POLICY_VERSION_MINIMUM=3.5 for cmake 4.x HTTPD_VERSION : init varonly > version.php
`modules/mod_fcgid.bat`
*  3.5.1
`modules/openssl.patch`
*  const PATH_SRC = pathenv("PATH_SRC")  - remove useless param update sub module list for php & httpd +brotli as nogit fix getVersion() if SCM_TAG is not present
`utils/sub/version.php`
*  1.6.49
`modules/libpng.bat`
*  2.9.10
`modules/mod_security.patch`
*  bf50eeef
`modules/pcre2.bat`
`modules/pcre2.patch`
*  8.15
`modules/curl.bat`
`modules/curl_ca-win.patch`
*  + "git submodule update --remote --merge" for /third-party/urlparse
`modules/ngtcp2.bat`
*  1719c58
`modules/serf.patch`
*  find_package(LibXml2 CONFIG REQUIRED) > find_package(LibXml2 REQUIRED) to fix "The link interface of target "LibXml2::LibXml2" contains: Iconv::Iconv but the target was not found"
`modules/libxslt.patch`
*  + CMAKE_POLICY_VERSION_MINIMUM=3.5 for cmake 4.x
`modules/apr-util.bat`
`modules/apr.bat`
`modules/freeglut.bat`
`modules/jansson.bat`
`modules/libev.bat`
`modules/libevent.bat`
`modules/libiconv.bat`
`modules/libxdiff.bat`
`modules/qhull.bat`
`modules/tidy.bat`
`modules/wineditline.bat`
`modules/yajl.bat`
*  upgrade gradle 8.14 > 9.0.0rc1
`env_sample.bat`
`modules/mobac.patch`
`modules/mobac_gradle-wrapper.jar`


## 1.13.0 _(2025-05-19)_

*  1.13.0
`changelog.md`
*  update tools & src + proxytunnel - sdnspi-mysql, openssl-quic
`README.md`
`SRC_VERSION.md`
`config/cyg64.packagelist`
`config/python.pip`
`usage.txt`
`utils/srccreate.bat`
*  fix pdb test display result
`utils/sub/bininfo.php`
*  fix error with unexisting remove CodeAnalysisRuleSet
`modules/common/vcxproj.sh`
*  8.14
`modules/curl_ca-win.patch`
*  fix project-cache-dir symlink issue with gradle 8.14
`env_sample.bat`
`modules/fit2gpx.bat`
`modules/mapsforgesrv.bat`
`modules/mobac.bat`
`modules/tzdataservice.bat`
*  fix issue with svn binary diff
`modules/mobac.patch`
`modules/mobac_gradle-wrapper.jar`
*  moved to https://github.com/himeshsameera/Dependencies
`modules/dependencies.patch`
*  remove duplicate cmake opt
`modules/libavif.bat`
*  fix same pdb for gdal.exe & gdal.dll (reanmed to libgdal.dll) in /bin
`modules/gdal.bat`
`modules/gdal.patch`
`utils/bininfo.bat`
*  -warn C4715
`modules/icu.bat`
*  8.14
`modules/curl.bat`
*  GRADLEVER: 8.13 > 8.14
`env_sample.bat`
*  1.8
`modules/libconfig.patch`
*  upgrade gradle & plugins
`modules/mobac.patch`
*  1.6.48
`modules/libpng.bat`
*  8.14
`modules/curl.bat`
`modules/curl.patch`
`modules/curl_ca-win.patch`
*  8.4.7
`modules/php-src_pr18352.patch`
`modules/php.bat`
*  https://github.com/icing/mod_h2/issues/277#issuecomment-2425961501
`modules/mod_h2.patch`
*  issue 18136 > https://github.com/php/php-src/pull/18352.patch
`modules/php-src_pr18136.patch`
`modules/php-src_pr18352.patch`
`modules/php.bat`
*  3.11
`modules/gdal.bat`
*  2.14.2
`modules/libxml2.patch`
*  https://github.com/proxytunnel/proxytunnel/issues/96#issuecomment-2810258543
`modules/proxytunnel.patch`
*  https://github.com/php/php-src/issues/18136#issuecomment-2801875557
`modules/php-src_pr18136.patch`
`modules/php.bat`
*  +proxytunnel
`modules/proxytunnel.bat`
`modules/proxytunnel.patch`
`usage.txt`
*  1.34.5
`modules/cares.patch`
*  fix sslh preg
`utils/sub/version.php`
*  +php-src_pr18136.patch
`modules/php-src_pr18136.patch`
`modules/php.bat`
*  10.46
`modules/pcre2.bat`
`modules/pcre2.patch`
*  fix 302 on mk-ca-bundle.pl
`modules/curl.patch`
*  3.12.1
`modules/aom.bat`
`modules/aom.patch`
*  3.5.0 +enable-hqinterop fix libzstd refactor CFLAGS CXXFLAGS LDFLAGS
`modules/openssl.bat`
`modules/openssl.patch`
*  pcre2 10.46-dev
`modules/pcre2.patch`
`utils/sub/version.php`
*  libxml2 2.14.1
`modules/libxml2.bat`
`modules/libxml2.patch`
`modules/php-src_libxml2.14.patch`
`modules/php-src_pr17848.patch`
`modules/php.bat`
*  8.13.0
`modules/curl_ca-win.patch`
*  remove useless sed & path concerning IMPORT_LIB_SUFFIX
`modules/curl.bat`
`modules/curl.patch`
*  2792
`modules/mobac.patch`
*  2.7.0
`modules/libexpat.bat`
*  2.14.1
`modules/jansson.bat`
*  fix bininfo
`modules/memcached.bat`
*  V1
`modules/mod_zstd.bat`
*  9.6.0
`modules/proj.bat`
*  fix patch
`modules/sslh.patch`
*  remove test copy
`modules/mod_zstd.bat`
*  1.19.7
`modules/libheif.bat`


## 1.12.0 _(2025-03-03)_

*  1.12.0
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`config/python.pip`
`utils/srccreate.bat`
*  https://github.com/nono303/php-src/commit/8787e289b8fc8a1257d4d87addd6a775e0876b2a
`modules/php.bat`
`modules/php_curl.patch`
*  GRADLEVER: 8.12 > 8.13
`env_sample.bat`
*  bin: +zstd.exe modules: +mod_zstd php: check ts 96
`utils/bininfo.bat`
*  add libwrap for sslh
`config/cyg64.packagelist`
*  2be005f3
`modules/libgd.bat`
`modules/libgd.patch`
*  1.2.0
`modules/libavif.bat`
*  typo
`modules/mod_security.patch`
*  2.13.6
`modules/libxml2.patch`
*  release https://github.com/nono303/mod_zstd
`modules/mod_zstd.bat`
`modules/mod_zstd.patch`
`utils/sub/version.php`
*  rename shared: zstd > libzstd
`modules/httpd.bat`
`modules/zstd.bat`
`modules/zstd.patch`
*  +mod_zstd.bat
`modules/mod_zstd.bat`
*  improve github package
`modules/memcached.bat`
`modules/sslh.bat`
*  77rc
`modules/icu.bat`
*  fix "At least a source file is in a subdirectory, but the 'subdir-objects'  option is disabled" AM_INIT_AUTOMAKE: +subdir-objects
`modules/memcached.patch`
*  fix arg ext: comma > dash (same arg)
`usage.txt`
`utils/sub/bininfo.php`
*  fix duplicate git init
`modules/memcached.sh`
*  https://github.com/yrutschle/sslh/issues/489
`modules/sslh.patch`
*  +mod_zstd
`utils/sub/version.php`
*  https://github.com/php/php-src/pull/17848/commits/7278aae6770bdae699639182c4bc18174a1a4905
`modules/php_curl.patch`
*  https://github.com/foglede/mod_zstd/issues/4
`modules/mod_zstd.patch`
*  +mod_zstd
`modules/httpd.bat`
`modules/httpd.patch`
*  https://github.com/php/php-src/pull/17848
`modules/php_curl.patch`
*  remove php-ogr.bat and update usage.txt for building some PHP standalone shared module as argument
`modules/php-ogr.bat`
`usage.txt`
*  https://github.com/curl/curl/issues/16379
`modules/curl.bat`
*  ENABLE_THREADED_RESOLVER: ON > OFF (c-ares conflict for CURLOPT_DNS_SERVERS: CURLE_NOT_BUILT_IN)
`modules/curl.bat`


## 1.11.1 _(2025-02-13)_

*  1.11.1
`changelog.md`
*  with-parallel only for full build
`modules/phpsdk-local.bat`
*  update src
`utils/srccreate.bat`
*  del /Q /F > rm -fv (verbose)
`modules/aom.bat`
`modules/bzip2.bat`
`modules/curl.bat`
`modules/fit2gpx.bat`
`modules/httpd.bat`
`modules/libevent.bat`
`modules/libgd.bat`
`modules/libheif.bat`
`modules/libxml2.bat`
`modules/libxslt.bat`
`modules/lua.bat`
`modules/mobac.bat`
`modules/openssl.bat`
`modules/php.bat`
`modules/subversion.bat`
`modules/subversionanddeps.bat`
`modules/yajl.bat`
*  remove unnecessary git clone sljit
`modules/pcre2.bat`
*  8.12.1
`modules/curl.patch`
`modules/curl_ca-win.patch`
*  +pthreads4w
`utils/bininfo.bat`
*  update tools & src vcvars_ver: 14.42 > 14.44
`README.md`
`SRC_VERSION.md`
`config/.vsconfig`
`config/python.pip`
`utils/srccreate.bat`
`vs17.bat`
*  +pecl-parallel +pthreads4w
`modules/full.bat`
`usage.txt`
`utils/sub/version.php`
*  8.12
`modules/curl.bat`
`modules/curl_ca-win.patch`
*  build TS as default (for parallel)   fix specific TSLIBSUF & ZTS for argon2 (NTS only) & parallel (TS only) +standalone for igbinary & parallel
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  3.12.0
`modules/aom.patch`
*  fix warning: failed to remove NUL: Invalid argument
`modules/openssl.bat`
*  add pthreads4w
`modules/pthreads4w.bat`
`modules/pthreads4w.patch`
*  add pecl igbinary as default & standalone add params 'win7' & 'win7d' cf. https://github.com/php/php-src/issues/12762#issuecomment-1831673405
`modules/php-src_win7.patch`
`modules/php-src_win7d.patch`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`utils/bininfo.bat`
`utils/sub/version.php`
*  add param 'nostd' for disabling /std:c%C_STD_VER% for C and C++
`modules/common/init.bat`
*  5.7.1
`modules/liblzma.bat`
*  fix ENABLE_AVX2
`modules/libgav1.bat`
*  configexport
`README.md`
`config/cyg64.packagelist`
`config/python.pip`


## 1.11.0 _(2025-01-22)_

*  1.11.0
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`env_sample.bat`
`utils/srccreate.bat`
*  CMAKE_UNITY_BUILD 3.10.1
`modules/gdal.bat`
*  fix 'APR_INLINE': redefinition; different storage class
`modules/mod_security-sdbm-util.patch`
`modules/mod_security.patch`
*  https://github.com/php/php-src/issues/16449#issuecomment-2576656150
`modules/phpsdk-config_make.bat`
*  2.4.63
`modules/httpd.patch`
*  https://github.com/apache/serf/commit/d4dc7a996d1a2a34dc3aa504cf44c0658120d666
`modules/serf.patch`
*  8.4.3
`modules/php-src_8.4.patch`
*  typo
`utils/sub/opcode.list`
*  https://github.com/libgd/libgd/commit/66c20541101167089ff72183e695a7b3b763b697
`modules/libgd.patch`
`modules/libgd_pr514.patch`
`modules/libgd_pr692.patch`
`modules/libgd_pr851.patch`
*  unused as ninja.sh remove /GL do the job
`modules/libmaxminddb.sh`
*  10.45
`modules/pcre2.patch`
*  CMAKE_UNITY_BUILD
`modules/apr.bat`
`modules/bzip2.bat`
`modules/curl.bat`
`modules/freetype2.bat`
`modules/geographiclib.bat`
`modules/giflib.bat`
`modules/jansson.bat`
`modules/lerc.bat`
`modules/libdeflate.bat`
`modules/libev.bat`
`modules/libexpat.bat`
`modules/libiconv.bat`
`modules/libmaxminddb.bat`
`modules/libssh2.bat`
`modules/libtiff.bat`
`modules/libxslt.bat`
`modules/mod_fcgid.bat`
`modules/pcre2.bat`
`modules/proj.bat`
`modules/qhull.bat`
`modules/sqlite.bat`
`modules/wineditline.bat`
`modules/yajl.bat`
*  https://github.com/hyperrealm/libconfig/commit/e6b9fd1eac1d4b5cdaeda9d5829b587859211518
`modules/libconfig.patch`
*  1.5.0
`modules/libwebp.bat`
*  1.23
`modules/libdeflate.bat`
*  1.34.4
`modules/cares.patch`
*  gradle: 8.11 > 8.11.1 local copy for curl-ca-bundle.crt
`env_sample.bat`
*  3.1.0
`modules/libjpeg-turbo.bat`
*  gradle: 8.11 > 8.11.1
`modules/mobac.patch`
*  rm bin/*config
`modules/libxml2.bat`
`modules/pcre2.bat`
`utils/bininfo.bat`
*  use mk-ca-bundle.pl
`modules/curl.bat`
*  fix & pretty flags
`modules/openssl.bat`
*  LOCAL_COPY for php
`env_sample.bat`
`modules/phpsdk-config_make.bat`
*  8.11.1
`modules/curl.bat`
*  fix subversion build after deps
`modules/subversionanddeps.bat`
*  fix ltrim issue on 0
`utils/sub/version.php`
*  php-cgi-spawner removed
`utils/bininfo.bat`
*  openssl no-brotli no-zstd for subversion
`modules/openssl.bat`
`modules/subversionanddeps.bat`
*  https://github.com/hyperrealm/libconfig/pull/249
`modules/libconfig.patch`
*  1.14.5
`modules/subversion.patch`
*  fix warning D9025: overriding '/Ob2' with '/Ob3'
`modules/common/vcxproj.sh`
*  -php-cgi-spawner
`SRC_VERSION.md`
`modules/full.bat`
`modules/php-cgi-spawner.bat`
`usage.txt`
`utils/srccreate.bat`
`utils/sub/version.php`
*  https://github.com/php/php-src/issues/15709#issuecomment-2522477075
`modules/phpsdk-config_make.bat`
*  1.7.4
`modules/libconfig.patch`
`utils/sub/version.php`
*  8.4.2
`modules/php-src_8.4.patch`
*  php-ext-brotli with static libbrotli https://github.com/kjdev/php-ext-brotli/issues/55#issuecomment-2509678078
`env_sample.bat`
`modules/brotli.bat`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  typo
`go.bat`
*  fix missing PATH_BATCH
`x64.bat`
*  3.4.0
`modules/xdebug.patch`
*  fix start & end with dot
`utils/sub/version.php`


## 1.10.5 _(2024-11-25)_

*  1.10.5
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`config/python.pip`
`utils/srccreate.bat`
*  8.4.1
`modules/php-src_8.4.patch`
*  fix wineditline removes leading 0
`utils/sub/version.php`
*  svn > git (2.2.6 > 2.2.8)
`modules/wineditline.patch`
*  r1919860
`modules/httpd.patch`
*  cmake_minimum_required: 3.5 > 3.10
`modules/aom.patch`
`modules/libiconv.patch`
*  msvc: 14.40 > 14.42
`config/.vsconfig`
`modules/mod_security-sdbm-util.patch`
`vs17.bat`
*  upgrade gradle
`env_sample.bat`
`modules/mobac.patch`
*  typo
`utils/sub/srcstatus.php`
*  add nb commit after tag for sslh
`utils/sub/version.php`
*  typo
`modules/sslh.bat`
*  geos just before proj
`modules/full.bat`
*  8.11.0
`modules/curl.bat`
`modules/curl_ca-win.patch`
*  exclude: -coll_tree +unknown_element.c
`utils/sub/logcheck.php`
*  upgrade windows kits
`modules/dependencies.patch`
`modules/nssm.patch`
*  v1.19
`modules/libheif.bat`
*  openssl: +brotli +zstd +x_ASM
`modules/full.bat`
`modules/openssl.bat`
`modules/openssl.patch`
*  +MTFLAGS & RCFLAGS
`env_sample.bat`
*  fix overriding '/Ob1' with '/Ob3'
`modules/libsodium.bat`
*  upgrade deps
`modules/sdlna.bat`
*  gradle  - upgrade plugins & deps  - use latest (0.22) mapsforge from jitpack.io javac  - disable xxCompatibility = JavaVersion.VERSION_11  - options.deprecation: true > false src  - fix @SuppressWarnings("deprecation") > @SuppressWarnings("removal")
`modules/mobac.patch`
*  CFLAG: +/cgthreads8 +/Ob3
`modules/common/meson.sh`
`modules/common/ninja.sh`
`modules/common/vcxproj.sh`
`modules/mod_security-sdbm-util.bat`
`modules/mod_security.bat`
`modules/openssl.bat`
`modules/php-ogr.bat`
`modules/phpsdk-config_make.bat`
*  fix Configuration + nostd
`modules/verpatch.bat`
*  tiffxx + pdb > lib_unused
`modules/libtiff.bat`
*  3.47.0
`modules/sqlite.patch`
*  +mod_evasive
`modules/httpd.bat`
`modules/httpd.patch`
`utils/bininfo.bat`
*  1.6.32
`modules/memcached.patch`


## 1.10.4 _(2024-10-19)_

*  1.10.4
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`config/.vsconfig`
`config/cyg64.packagelist`
`config/python.pip`
`utils/srccreate.bat`
*  1.5.0
`modules/dav1d.bat`
*  3.10
`modules/gdal.bat`
`modules/gdal.patch`
*  1.11.1
`modules/libssh2.patch`
*  WKITVER: 10.0.22621.0 > 10.0.26100.0
`env_sample.bat`
`modules/sqlite.bat`
*  https://www.apachelounge.com/viewtopic.php?p=43136#43136
`modules/apr2.bat`
`modules/apr2.patch`
*  fix path deduplicate
`go.bat`


## 1.10.3 _(2024-10-10)_

*  1.10.3
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  unset dirty fix for LIB & INCLUDE as they are now deduplicated
`modules/php.bat`
*  +apr-2
`modules/apr2.bat`
`modules/apr2.patch`
`utils/sub/version.php`
*  php callback for deduplicate entries in ENV var
`utils/sub/deduplicate.php`
*  del aom_static.lib
`modules/aom.bat`
*  1.34.1
`modules/cares.patch`
*  fix php8.lib copy
`modules/phpsdk-config_make.bat`
*  use relative %PATH_INSTALL%\lib\php8.lib
`modules/php-ogr.bat`
*  clen fix for duplicate entries in ENV var
`go.bat`
`x64.bat`
*  disable warn C4477
`modules/icu.bat`
*  8.4.0rc2
`modules/php-src_8.4.patch`
*  fix nostd
`modules/dependencies.bat`
*  subversion 1.14.4
`modules/apr-util.bat`
`modules/httpd.bat`
`modules/pcre2.bat`
`modules/subversion.bat`
`modules/subversion.patch`
`modules/subversionanddeps.bat`
*  remove specific for mod_md build
`modules/curl.bat`
`usage.txt`
*  move C_STD_VER from env_sample to vs1x (disable /std for vs16)
`env_sample.bat`
`modules/common/init.bat`
`vs16.bat`
`vs17.bat`
*  reset env var EXTERNAL_INCLUDE, INCLUDE & LIB to avoid "environment is too large"
`x64.bat`
*  +cmd to force refresh deps
`modules/mapsforgesrv.bat`
*  look for "environment is too large"
`utils/sub/logcheck.php`
*  fixed WIN64
`modules/serf.bat`
`x64.bat`
*  https://github.com/xdebug/xdebug/pull/977#issuecomment-2394493320
`modules/xdebug.patch`


## 1.10.2 _(2024-10-04)_

*  1.10.2
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  add args for build type (memcache, xdebug) full without args  * fix specific post build actions for each scenario fix link openssl3 sources to module (applink.c) for php < 8.4
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  3.4.0b1 https://github.com/xdebug/xdebug/pull/977#issuecomment-2394037465
`modules/xdebug.patch`
*  php 8.0, 8.1, 8.2 (discontinued)
`modules/php-src_8.0.patch`
`modules/php-src_8.1.patch`
`modules/php-src_8.2.patch`
*  fix avx path for php_memcache on github fix copy php8.lib only on full build disable (tmp) xdebug build
`modules/phpsdk-config_make.bat`
*  cl: +/Ob3 fix "remove default std" for C
`modules/common/ninja.sh`
*  php 8.4
`modules/php-src_8.4.patch`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  https://github.com/nono303/mod_md archived
`modules/mod_md.bat`
*  fix >= 5.6.3 lib renamed lzma, revert to liblzma
`modules/liblzma.bat`
*  fix >= 3.10 : link aom_av1_rc failed with /GL
`modules/aom.bat`
*  1.33.1
`modules/cares.patch`
*  bump gradle 8.10.2
`env_sample.bat`
*  8.10.1
`modules/curl.patch`
`modules/curl_ca-win.patch`
*  3.0.90
`modules/libjpeg-turbo.bat`
*  4.7.0
`modules/libtiff.bat`
*  bump gradle 8.10
`modules/mobac.patch`
*  2.9.8
`modules/mod_security.bat`
`modules/mod_security.patch`
*  fix nocxx warning
`modules/nghttp2.bat`
*  main/network.c fixed in 8.3.12
`modules/php-src_8.3.patch`
*  fix branch null warning
`utils/sub/srcstatus.php`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  del legacy heif-convert https://github.com/strukturag/libheif/commit/bf3d5fafd82e8688171f3e643840107248faf41e
`modules/libheif.bat`
`utils/bininfo.bat`
*  fixed in 1.1.1
`modules/libavif.patch`
*  fixed in 8.3.10
`modules/php-src_8.3.patch`
*  THREADCOUNT_LIST: +16, 20
`modules/mobac.patch`
*  1.32
`modules/cares.bat`
`modules/cares.patch`
*  2.4
`modules/geographiclib.bat`
*  1.0.4
`modules/libavif.bat`
*  https://github.com/apache/apr-util/commit/85df5aeea0ab1a3b8b2ba7b66267c7530fa3c396
`modules/apr-util.patch`
*  fix LNK1181: cannot open input file 'dav1d.lib'
`modules/libgd.bat`
*  8.9.0
`modules/curl.patch`
*  gradle: 8.8 > 8.9
`env_sample.bat`
*  https://github.com/AOMediaCodec/libavif/commit/03acd65314fe29e6627cf4eab752819f6ee15d74
`modules/libavif.patch`
*  2781
`modules/mobac.patch`
*  1.18.1
`modules/libheif.bat`
*  3.9.1
`modules/aom.bat`
*  https://github.com/AiMiDi/libiconv_cmake/pull/7
`modules/libiconv.patch`


## 1.10.1 _(2024-06-14)_

*  1.10.1
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  https://github.com/OSGeo/libgeotiff/pull/123
`modules/libgeotiff.bat`
`modules/libgeotiff.patch`
*  https://github.com/OSGeo/libgeotiff/commit/e00dcd652cd99e1ee81bd24a14b998cadab52c60
`modules/libgeotiff.patch`
*  https://github.com/OSGeo/libgeotiff/commit/cee338fac53d5f6702b605d7ae70e02bee272a22
`modules/libgeotiff.bat`
`modules/libgeotiff.patch`
*  +libgeotiff https://github.com/OSGeo/libgeotiff/pull/120 fix libiconv for cmake build
`utils/sub/version.php`
*  add extra level folder
`utils/sub/srcstatus.php`
*  1.4.3
`modules/dav1d.bat`
*  1.10.0
`modules/libmaxminddb.bat`
*  cmake build (change scm) https://github.com/AiMiDi/libiconv_cmake/issues/5
`modules/libiconv.bat`
`modules/libiconv.patch`
*  fix for libxml 2.13.0 https://github.com/php/php-src/issues/14563
`modules/php-src_8.3.patch`
*  2.13 +enable ICU
`modules/libxml2.bat`
`modules/libxml2.patch`
*  1.30
`modules/cares.bat`
`modules/cares.patch`
*  10.44
`modules/pcre2.bat`
`modules/pcre2.patch`
*  not exist anymore
`.gradle-wrapper.properties/mapsforgesrv-mapsforgesrv_gradle-wrapper.properties.properties`
*  gradle 8.8
`env_sample.bat`
`modules/mobac.patch`
*  disable quic by default
`quic.bat`
*  https://github.com/telemaxx/mapsforgesrv/pull/65
`modules/mapsforgesrv.bat`
*  +Option-amd64asm=no (nonstandard extension for MSVC)
`modules/libsodium.bat`
*  fix NBBIN for QUIC 0
`utils/bininfo.bat`
*  bump gradle
`env_sample.bat`
*  fix quote for avx 0
`modules/memcached.bat`


## 1.10.0 _(2024-05-28)_

*  1.10.0
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  improve & factorize cmake find*
`modules/aom.bat`
`modules/apr-util.bat`
`modules/apr.bat`
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/cares.bat`
`modules/common/init.bat`
`modules/curl.bat`
`modules/freeglut.bat`
`modules/freetype2.bat`
`modules/gdal.bat`
`modules/geographiclib.bat`
`modules/geos.bat`
`modules/giflib.bat`
`modules/httpd.bat`
`modules/jansson.bat`
`modules/lerc.bat`
`modules/libavif.bat`
`modules/libdeflate.bat`
`modules/libev.bat`
`modules/libevent.bat`
`modules/libexpat.bat`
`modules/libgav1.bat`
`modules/libgd.bat`
`modules/libgeotiff.bat`
`modules/libheif.bat`
`modules/libjpeg-turbo.bat`
`modules/liblzma.bat`
`modules/libpng.bat`
`modules/libssh2.bat`
`modules/libtiff.bat`
`modules/libwebp.bat`
`modules/libxdiff.bat`
`modules/libxml2.bat`
`modules/libxslt.bat`
`modules/libyuv.bat`
`modules/libzip.bat`
`modules/mod_fcgid.bat`
`modules/mod_md.bat`
`modules/nghttp2.bat`
`modules/nghttp3.bat`
`modules/ngtcp2.bat`
`modules/pcre2.bat`
`modules/proj.bat`
`modules/qhull.bat`
`modules/serf.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
`modules/wineditline.bat`
`modules/yajl.bat`
`modules/zlib.bat`
`modules/zstd.bat`
*  fix FIND_PACKAGE(PROJ REQUIRED)
`modules/libgeotiff.patch`
*  fix null
`utils/sub/libcheck.php`
*  https://github.com/php/php-sdk-binary-tools/pull/15
`modules/php-sdk.patch`
`modules/php.bat`
*  fix padding
`utils/sub/srcstatus.php`
*  clean
`modules/php-ogr.bat`
*  1.7.3 - https://github.com/OSGeo/libgeotiff/pull/115
`modules/libgeotiff.bat`
`modules/libgeotiff.patch`
*  1.7.2
`modules/libgeotiff.patch`
*  8.8.0
`modules/curl.patch`
*  apr cmake build
`SRC_VERSION.md`
`modules/apr-util.bat`
`modules/apr-util.patch`
`modules/apr.bat`
`modules/apr.sh`
`modules/apr_once.sh`
`modules/full.bat`
`usage.txt`
`utils/bininfo.bat`
`utils/srccreate.bat`
*  fix AVX_MPIR=core2-penryn & ext MPIRVCVER
`avx.bat`
`modules/mpir.bat`
*  -useless comment
`go.bat`
*  fixed in nghttp2 1.62.0 / nghttp3 1.3.0 / ngtcp2 1.5.0
`modules/nghttp2.patch`
`modules/nghttp3.patch`
`modules/ngtcp2.patch`
*  update tools & src
`SRC_VERSION.md`
`config/cyg64.packagelist`
`config/python.pip`
`utils/srccreate.bat`
*  remove deprecated vc15 & x86 build options
`README.md`
`config/.vsconfig`
`config/cyg32.packagelist`
`env_sample.bat`
`go.bat`
`modules/geographiclib.bat`
`modules/jemalloc.bat`
`modules/mod_md.bat`
`modules/openssl.bat`
`modules/subversion-deps.bat`
`usage.txt`
`utils/configexport.bat`
`utils/sub/bininfo.php`
`vc15.bat`
`x64.bat`
`x86.bat`
*  vcvarsall.bat > VsDevCmd.bat (https://learn.microsoft.com/en-us/visualstudio/ide/reference/command-prompt-powershell?view=vs-2022#developer-command-prompt)
`avx.bat`
`modules/php-sdk.patch`
`modules/php.bat`
*  Fix GCC version
`utils/sub/version.php`
*  remove deprecated x86 build options add debug params for make with verbose option
`modules/memcached.bat`
*  Fix 'MSB8003: The VCToolsInstallDir property is not defined' with 14.40
`modules/mpir.bat`
*  Gradle 8.8
`modules/mobac.patch`
*  remove deprecated x86 build options add debug params for make with verbose option
`modules/libconfig.sh`
`modules/libsodium.bat`
`modules/memcached.sh`
`modules/sslh.bat`
`modules/sslh.sh`
*  +curl: mk-ca-bundle.pl
`utils/bininfo.bat`
*  +run-hidden.bat
`modules/run-hidden.bat`
`usage.txt`
*  fix description for cygin builds
`modules/memcached.bat`
`modules/sslh.bat`
`utils/sub/version.php`
*  8.8.0
`modules/curl.bat`
`modules/curl.patch`
`modules/curl_ca-win.patch`


## 1.9.0 _(2024-04-24)_

*  1.9.0
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  +C_STD_VER -CMAKE_TGT_VS (unused)
`env_sample.bat`
*  clean duplicate cflags
`modules/phpsdk-config_make.bat`
*  builder: msbuild > ninja (fixing /GL issue)
`modules/libmaxminddb.bat`
*  remove default /std
`modules/common/ninja.sh`
*  +nocxx for init cmake
`modules/jansson.bat`
*  fix & clean cflags
`modules/apr.sh`
`modules/mod_security-sdbm-util.bat`
`modules/mod_security.bat`
`modules/openssl.bat`
`modules/php-cgi-spawner.bat`
*  fix error C2059: syntax error: '#' for /std:clatest
`modules/mod_security.patch`
*  cd: +/nologo /std:clatest
`modules/lua.bat`
*  fix prerequisite lib test
`modules/mod_md.bat`
*  +nostd for vcxproj.sh
`modules/common/vcxproj.sh`
`modules/jemalloc.bat`
`modules/nssm.bat`
*  fix error C2xxx fo /std:c++latest
`modules/gdal.bat`
`modules/libheif.bat`
*  +nocxx for init cmake
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/cares.bat`
`modules/common/init.bat`
`modules/curl.bat`
`modules/freeglut.bat`
`modules/freetype2.bat`
`modules/httpd.bat`
`modules/libavif.bat`
`modules/libdeflate.bat`
`modules/libevent.bat`
`modules/libexpat.bat`
`modules/libjpeg-turbo.bat`
`modules/liblzma.bat`
`modules/libpng.bat`
`modules/libssh2.bat`
`modules/libwebp.bat`
`modules/libxml2.bat`
`modules/libxslt.bat`
`modules/libzip.bat`
`modules/mod_fcgid.bat`
`modules/pcre2.bat`
`modules/serf.bat`
`modules/sqlite.bat`
`modules/yajl.bat`
`modules/zlib.bat`
*  fix fatal error C1017: invalid integer constant expression
`modules/wineditline.patch`
*  3.9.0
`modules/gdal.patch`
*  75.1
`modules/icu.bat`
`modules/icu.patch`
*  Dirty fix: bad usage of IMPORTED_LOCATION_RELWITHDEBINFO instead of IMPORTED_IMPLIB_RELWITHDEBINFO in C:\sdk\release\vs17_x64-avx2\lib\cmake\libxml2-2.12.5\libxml2-export-relwithdebinfo.cmake"(12,55)
`modules/libxslt.bat`
*  disable copy static
`modules/libyuv.bat`
*  fix ext\intl\common\common_date.cpp: /include/unicode/localpointer.h(561): 'auto' in non-type template parameters requires at least '/std:c++17'
`modules/phpsdk-config_make.bat`
*  sslh from file
`utils/sub/version.php`
*  fix avx order params (sse2 issue)
`modules/memcached.bat`
`modules/memcached.patch`
*  1.6.24 > 1.6.26
`modules/memcached.sh`
*  mod_suffix: .dll > .so
`modules/httpd.bat`
`modules/httpd.patch`
`modules/mod_security.bat`
`modules/mod_security.patch`
*  v1.61.0
`modules/nghttp2.patch`
*  1.4.0
`modules/libwebp.bat`
*  2.4.59
`modules/httpd.patch`
*  mod_suffix: .so > .dll
`modules/httpd.bat`
`modules/httpd.patch`
`modules/mod_security.bat`
`modules/mod_security.patch`
*  https://unicode-org.atlassian.net/browse/ICU-22715
`modules/icu.patch`
*  1.5.6 https://github.com/facebook/zstd/issues/3999
`modules/zstd.bat`
`modules/zstd.patch`
*  https://unicode-org.atlassian.net/browse/ICU-22715
`modules/icu.bat`
`modules/icu.patch`
*  gradle: 8.6 > 8.7
`modules/mobac.patch`
*  disable patch for windows 7 EOL https://github.com/php/php-src/issues/12762
`modules/php-src_8.3.patch`
*  vcvars_ver: 14.39 > 14.40
`vs17.bat`
*  8.6.0 > 8.7.1
`modules/curl_ca-win.patch`
*  GRADLEVER: 8.6 > 8.7
`env_sample.bat`
*  refactor arch AVXB +avx2
`avx.bat`
`usage.txt`
*  build only with current avx setting
`modules/libconfig.sh`
`modules/memcached.bat`
`modules/memcached.sh`
`modules/sslh.bat`
`modules/sslh.sh`
*  SSE42AVX > AVX_ON +AVX2_ON
`modules/aom.bat`
*  AVXMPIR > AVX_MPIR
`modules/mpir.bat`
`modules/phpsdk-local.bat`
*  AVXVCX > AVX_MSBUILD
`modules/verpatch.bat`
*  LOCAL_COPY_AVXECHO > LOCAL_COPY_AVX_ECHO: avx > avx2
`env_sample.bat`
`modules/geographiclib.bat`
*  AVXVCX > AVX_MSBUILD
`modules/dependencies.bat`
`modules/icu.bat`
`modules/jemalloc.bat`
`modules/libiconv.bat`
`modules/libmaxminddb.bat`
`modules/libsodium.bat`
`modules/libxpm.bat`
`modules/nssm.bat`
`modules/subversion.bat`
*  AVXSED > AVX_SED in avx.bat
`modules/mod_security-sdbm-util.bat`
`modules/mod_security.bat`
*  https://github.com/yrutschle/sslh/commit/b94060ad7616b1820a48c471e42ca1e8eaed8fc4
`modules/sslh.patch`
*  execnono(): trim stderr fix git fetch: 2>&1
`utils/sub/_functions.php`
`utils/sub/srcstatus.php`
*  1.4.0
`modules/ngtcp2.patch`
*  mapsforge: 0.20 > 0.21
`modules/mobac.patch`


## 1.8.5 _(2024-03-15)_

*  1.8.5
`changelog.md`
*  update tools -Go
`README.md`
*  update src Dependencies: lucasg > nono303 -libffi
`SRC_VERSION.md`
`utils/srccreate.bat`
*  rewrite execnono to have stderr
`utils/sub/_functions.php`
*  AVX count: use dumpbin if objdump failed
`utils/sub/bininfo.php`
*  +DEBUG disable rpdb for cygwin build force AVX for sslh, libconfig
`utils/sub/version.php`
*  fix configure for sslh AVX build (sandybridge)
`modules/libconfig.sh`
`modules/sslh.sh`
*  https://github.com/yrutschle/sslh/issues/427#issuecomment-1999074422
`modules/sslh.patch`
*  vs2019 > vs2022
`modules/libsodium.bat`
*  +lzmadec.exe lzmainfo.exe
`modules/liblzma.bat`
`utils/bininfo.bat`
*  typo
`modules/common/ninja.sh`
*  fix cl & link flags
`modules/aom.bat`
*  upgrade deps
`modules/sdlna.bat`
*  +dependencies
`utils/sub/version.php`
*  update cygwin & python
`config/cyg64.packagelist`
`config/python.pip`
*  1.60.0
`modules/nghttp2.bat`
`modules/nghttp2.patch`
*  2770
`modules/mobac.patch`
*  5.6.0
`modules/liblzma.bat`
*  1.6.43
`modules/libpng.bat`
*  MSBuild > CMake
`modules/liblzma.bat`
`modules/liblzma.patch`
*  fix cmake test & deps issue version 1.2.0
`modules/nghttp3.bat`
`modules/nghttp3.patch`
*  fix cmake test issue version 1.3.0
`modules/ngtcp2.bat`
`modules/ngtcp2.patch`
*  remove libffi
`modules/full.bat`
`modules/libffi.bat`
`modules/phpsdk-config_make.bat`
`usage.txt`
`utils/bininfo.bat`
`utils/sub/version.php`
*  add xxd
`config/cyg64.packagelist`
*  upgrade pip
`config/python.pip`
*  fix VCTools (latest) to 14.39 in VS17.40
`config/.vsconfig`
*  gradle: 8.5 > 8.6
`env_sample.bat`
`modules/mobac.patch`
*  c65a7c05
`modules/libxslt.bat`
*  8.6.0
`modules/curl.bat`
`modules/curl_ca-win.patch`
*  GDAL_USE_MYSQL: OFF > ON
`modules/gdal.bat`
*  1.3.1
`modules/zlib.bat`
*  1.6.41
`modules/libpng.bat`
*  remove cmake useless option for 'NOT ENABLE_LIB_ONLY'
`modules/nghttp2.bat`
*  create apr_dbd_mysql https://www.apachelounge.com/viewtopic.php?p=42414#42414
`env_sample.bat`
`modules/apr-util.patch`
`modules/apr.bat`
`utils/bininfo.bat`
*  create apr_dbd_mysql https://www.apachelounge.com/viewtopic.php?p=42414#42414
`env_sample.bat`
`modules/apr-util.patch`
`modules/apr.bat`
*  update config for python.pip add config for cyg.required
`config/cyg.required`
`config/python.pip`
*  add pecl-datetime-timezonedb & pecl-system-sync
`SRC_VERSION.md`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`utils/bininfo.bat`
`utils/srccreate.bat`
`utils/sub/version.php`
*  cmake find_package curl as module (previously fixed)
`modules/gdal.bat`
*  1.9.1
`modules/libmaxminddb.bat`
*  comment for cygwin packages with version
`utils/configexport.bat`
*  clean unused packages
`config/cyg64.packagelist`
*  add go
`README.md`
`env_sample.bat`
*  cmake find curl with module (fixed)
`modules/httpd.bat`
*  +curl-config
`utils/bininfo.bat`
*  check and build prereq
`modules/mod_md.bat`
*  fix cmake find +mod_md param for a light build
`modules/curl.bat`
`modules/curl.patch`
*  pcre2 10.43 : winediline required
`modules/full.bat`
`modules/pcre2.bat`
*  Refactor httpd build: - remove mt.exe -manifest %PATH_MODULES%\httpd.exe.manifest - factorize CMAKE_HTTPD_COMMON - cmake  - define diag_bits (mod_whatkilledus)  - transform dirty cflags sed to cmake extra_defines (mod_h264_streaming, mod_whatkilledus, mod_backtrace, mod_qos)  - CMAKE_MINIMUM_REQUIRED: 2.8 > 3.5   - CMAKE_MINIMUM_REQUIRED in first   - GET_MOD_ENABLE_RANK: fix quotes   - GEN_TEST_CHAR_EXE: https://lists.apache.org/thread/w4k1gmcynjw3l5z88mq1mfgd7g097s0f   - remove useless extra_sources for external modules
`modules/httpd.bat`
`modules/httpd.exe.manifest`
`modules/httpd.patch`


## 1.8.4 _(2023-12-18)_

*  1.8.4
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  remove useless sed patch & LIBXML2_INCLUDE_DIR +%PATH_INSTALL%\include
`modules/libxslt.bat`
*  fix LIBXML2_INCLUDE_DIR (was on %PATH_SOFTS%/c/include/libxml/xmlversion.h)
`modules/nghttp2.bat`
*  move to CMake build
`modules/libxml2.bat`
`modules/libxml2.patch`
`utils/bininfo.bat`
*  typo
`utils/libcheck.bat`
*  https://github.com/apache/httpd/pull/393
`modules/httpd.patch`
*  remove unused LOCAL_PATH_PYTHON
`env_sample.bat`
*  fix hardcoded path
`modules/httpd.bat`
`modules/icu.bat`
`upgrade_pip.bat`
`utils/version.bat`


## 1.8.3 _(2023-12-14)_

*  1.8.3
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  https://gitlab.kitware.com/cmake/cmake/-/issues/25485#note_1458341
`modules/libgeotiff.patch`
*  fix  - sqlite: build with shared lib  - python 3.12 regexp  - force quic 0  - serf lib naming for tests improve  - typo  - test launch command  - nowarn  - clean folder release
`modules/subversion.bat`
`modules/subversion.patch`
*  add 'svn' param to build specific and light release for subversion  - sqlite3: -ICU deps, -SHELL  - httpd: -MODULES, only zlib & openssl
`modules/httpd.bat`
`modules/sqlite.bat`
*  add USE_SEH
`modules/sqlite.patch`
*  add subversion-deps.bat (cf. https://github.com/nono303/win-build-scripts/issues/2#issuecomment-1855537078)
`modules/subversion-deps.bat`
`usage.txt`
*  fix: mod_maxminddb_extra_libsonly if MAXMIND_LIBRARIES passed in args all extras modules: i > O (optional)
`modules/httpd.patch`
*  fix on KEEPSRC: disable vcxproj.sh & sed
`modules/icu.bat`
*  gradle: 8.4 > 8.5
`modules/mobac.patch`
*  remove false 'showWarning' on ICU
`utils/sub/logcheck.php`
*  fix associtaed modules for php & httpd.bat return product version on stdout if only one arg (nothing patched)
`utils/sub/version.php`
*  SVN paths: vs16 > vs17
`env_sample.bat`
*  rename patch
`modules/php-src_8.0.patch`
`modules/php-src_8.1.patch`
`modules/php-src_8.2.patch`
`modules/php-src_8.3.patch`
`modules/php.bat`
*  gradle: 8.4 > 8.5
`env_sample.bat`
*  v3.8.0
`modules/aom.patch`
*  typo
`modules/mod_md.bat`
*  8.5.0
`modules/curl_ca-win.patch`


## 1.8.2 _(2023-11-29)_

*  1.8.2
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  https://github.com/libgd/libgd/pull/787 merged https://github.com/libgd/libgd/commit/d500229d7a4016f054cc689dfab0ab1177709731
`modules/libgd.bat`
`modules/libgd_pr787.patch`
*  php: 8.2 > 8.3
`modules/php.bat`
*  typo version
`modules/phpsdk-config_make.bat`
*  fix use of win32/php_stdint.h if MSC_VER < 1910
`modules/pecl-memcache.patch`
*  add debug shell cmd
`utils/sub/bininfo.php`
*  fix $argv[3] (cygwin)
`utils/sub/version.php`
*  74.1: update nowarn
`modules/icu.bat`
*  https://github.com/php/php-src/issues/12762
`modules/php8.3_php-src.patch`
*  enable check for only build with 'full'
`utils/bininfo.bat`
*  -php8.3 patch (unused)
`modules/php8.3_php-src.patch`
*  fix libxml2 version file
`utils/sub/version.php`
*  fetch upstream & merge to github.com/nono303 repos
`SRC_VERSION.md`
*  update configexport
`config/.vsconfig`
`config/cyg64.packagelist`
`config/python.pip`
*  as not released in /bin, remove from full: - subversion (and force serf build in subversion.bat) - geographiclib - dependencies update and fix usage.txt
`modules/full.bat`
`modules/subversion.bat`
`usage.txt`
*  gdal 3.8
`utils/bininfo.bat`
*  vcvars_ver: 14.38 > 14.39
`README.md`
`vs17.bat`


## 1.8.1 _(2023-11-15)_

*  1.8.1
`changelog.md`
*  add sslh to usage & srccreate.bat
`usage.txt`
`utils/srccreate.bat`
*  fix build libconfig in comment
`modules/sslh.bat`


## 1.8.0 _(2023-11-14)_

*  1.8.0
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  improve cygwin description
`utils/sub/version.php`
*  add sslh - Thx to @lerenardo https://github.com/yrutschle/sslh/issues/196#issuecomment-1692805639
`env_sample.bat`
`modules/libconfig.patch`
`modules/libconfig.sh`
`modules/sslh.bat`
`modules/sslh.sh`
*  rewrite & simplify
`modules/memcached.bat`
`modules/memcached.patch`
`modules/memcached.sh`
`modules/memcached_event-2.0.sh`
*  https://github.com/maxmind/mod_maxminddb/pull/112
`modules/mod_maxminddb.patch`
*  tag 1.2.0 > main
`modules/mod_maxminddb.patch`
`utils/sub/version.php`
*  3.7.3
`modules/gdal.bat`
*  useless build (https://github.com/adang1345/PythonWindows/)
`modules/python.bat`
*  rm useless
`utils/info.md`
*  update config
`config/.vsconfig`
`config/cyg64.packagelist`
`config/python.pip`
*  fix opcode_update-list.sh update opcode.list
`utils/sub/opcode.list`
`utils/sub/opcode_update-list.sh`
*  exclude all javahl warnings
`utils/sub/logcheck.php`
*  fix nasm error on x86 bump to 3.0.1
`modules/libjpeg-turbo.bat`
*  clean unused pcre for qos bump to 2.4.58
`modules/httpd.patch`


## 1.7.6 _(2023-10-16)_

*  1.7.6
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  1.17 WITH_EXAMPLES: OFF > ON (heif-thumbnailer.exe heif-enc.exe heif-convert.exe heif-info.exe) + DISABLE_FIND_PACKAGE_Doxygen + XXX_PLUGIN=OFF + WITH_LIBSHARPYUV=ON + WITH_JPEG_DECODER=ON & WITH_JPEG_ENCODER=ON
`modules/libheif.bat`
`utils/bininfo.bat`
*  typo
`modules/ngtcp2.bat`
*  prepare for 8.3
`modules/php8.3_php-src.patch`
`modules/phpsdk-config_make.bat`
*  LOCAL_COPY for fit2gpx gradle: 8.3 > 8.4
`env_sample.bat`
`modules/fit2gpx.bat`
*  8.4.0: CURL_USE_OPENLDAP removed
`modules/curl.bat`
*  fix include version for subversion that require 3 digits
`modules/zlib.bat`
*  compile from trunk set compiler 2017 > 2022
`modules/subversion.bat`
`modules/subversion.patch`
`utils/sub/version.php`
*  patch with PR 514 787 851
`modules/libgd.bat`
`modules/libgd_pr514.patch`
`modules/libgd_pr787.patch`
`modules/libgd_pr851.patch`
*  disable tools
`modules/dav1d.bat`
*  r2759
`modules/mobac.patch`
*  nowarn C4101
`modules/icu.bat`
*  8.2.11: fix offset for /ext/iconv/iconv.c
`modules/php8.2_php-src.patch`
*  comment for x86 deprecated
`modules/memcached_event-2.0.sh`


## 1.7.5 _(2023-09-21)_

*  1.7.5
`changelog.md`
*  update tools & src
`README.md`
`SRC_VERSION.md`
`utils/srccreate.bat`
*  remove unused target disable C4113 warn (test)
`modules/icu.bat`
*  fixed in 1875 - 3aae5c7f
`modules/libyuv.patch`
*  +CMAKE_DISABLE_FIND_PACKAGE_SDL=ON
`modules/libwebp.bat`
*  +tiff-tools-unsupported=OFF +CMAKE_DISABLE_FIND_PACKAGE_JBIG=ON -CMAKE_DISABLE_FIND_PACKAGE_PkgConfig=ON -tiff-opengl=ON
`modules/libtiff.bat`
*  allow libgd > 0.8.2
`modules/libgd.patch`
*  AVIF_BUILD_APPS: ON > OFF +AVIF_ENABLE_EXPERIMENTAL_YCGCO_R=ON +AVIF_LOCAL_AVM=OFF remove duplicate copy of pdb
`modules/libavif.bat`
*  update src for mod_h2 2.0.24
`modules/httpd.patch`
*  don't build x86 only update x64 version & bininfo
`modules/memcached.bat`
*  +BUILD_EXAMPLES=OFF
`modules/proj.bat`
*  disable build of avifenc.exe & avifdec.exe
`utils/bininfo.bat`
*  cmake options - 3.7.2 - skip findind unused lib - fix CMAKE_PREFIX_PATH (expat, geotiff, geos, zstd)
`modules/gdal.bat`
*  install \lib\pkgconfig\dav1d.pc for gdal
`modules/dav1d.bat`
*  vcvars_ver: 14.37 > 14.38
`vs17.bat`
*  fix symlink for gradle-wrapper
`.gradle-wrapper.properties/mapsforgesrv-mapsforgesrv_gradle-wrapper.properties.properties`
`.gradle-wrapper.properties/mapsforgesrv_gradle-wrapper.properties`
*  8.3.0
`modules/curl.bat`
`modules/curl_ca-win.patch`
*  1.1.0
`modules/brotli.bat`
*  3.7.0 msbuild > ninja fix https://aomedia-review.googlesource.com/q/I36a4db36fb67237e94f1db3b0042ce219446e559 fix ninja: error: build.ninja:288: multiple rules generate aom.lib [-w dupbuild=err]
`modules/aom.bat`
`modules/aom.patch`
*  bump to gradle 8.3
`env_sample.bat`
`modules/mobac.patch`
*  bump to gradle 8.3
`env_sample.bat`


## 1.7.4 _(2023-08-02)_

*  1.7.4
`changelog.md`
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


## 1.0.0 _(2020-05-15)_

*  clean old ref
`.gitignore`
*  Update README.md
*  Update README.md
*  correct version
`modules/lua.bat`
*  add version
`modules/serf.bat`
*  correct version between apr & apr-util
`modules/apr.bat`
*  correct cscript option & pdb
`modules/libxml2.bat`
*  update version & bininfo
`modules/memcached.bat`
*  patch libxpm & curl in configure.js
`modules/phpsdk-local.bat`
*  simplify curl linkage
`modules/httpd.bat`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
*  curl with CMakeList (for brotli linkage)
`modules/curl-sub.bat`
`modules/curl.bat`
`modules/curl.patch`
*  change scm
`modules/libpng.bat`
`modules/libpng.sln`
`modules/libpng.vcxproj`
`modules/libxpm.bat`
`modules/libxpm.zip`
*  update version
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/cares.bat`
`modules/jansson.bat`
`modules/jemalloc.bat`
`modules/jpeg.bat`
`modules/libev.bat`
`modules/libevent.bat`
`modules/libexpat.bat`
`modules/libxdiff.bat`
`modules/openssl.bat`
`modules/pcre.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
`modules/wineditline.bat`
*  patch revision
`modules/mobac.bat`
`modules/mobac.patch`
*  factorize php function
`utils/sub/_functions.php`
*  finalize srcstatus
`utils/sub/srcstatus.php`
*  finalize srccreate
`utils/srccreate.bat`
`utils/sub/srccreate.bat.in`
*  finalize configexport
`utils/configexport.bat`
*  finalize bininfo
`utils/bininfo.bat`
`utils/sub/bininfo.php`
*  finalize logcheck
`utils/logcheck.bat`
`utils/sub/logcheck.php`
*  finalize curlperf
`utils/curlperf.bat`
`utils/sub/curlperf.php`
`utils/sub/curlperf.txt`
*  add usage for go help
`usage.txt`
*  finalize README.md
`SRC_VERSION.md`
*  rename
`modules/verpatch.bat`
`modules/verpatch.patch`
*  add HELP for usage
`go.bat`
*  remove use of version.rc
`modules/common/version.bat`
`modules/common/version.rc`
*  exclude git config
`.gitignore`
*  add BIN_VSINSTALLER & CYGPATH_UTILS
`env_sample.bat`
*  add cygwin & msvs config
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  disable unused ext
`utils/sub/php.ini`
*  finalize version
`utils/sub/version.php`
`utils/version.bat`
*  correct cl /c arg
`modules/php-cgi-spawner.bat`
*  always create csv
`utils/sub/bininfo.php`
*  remove System.out.println(conn.getRequestProperties()) in BeanShellHttpMapSource.java
`modules/mobac.patch`
*  out phpmaster of src
`modules/php.bat`
*  /NODEFAULTLIB:libcmt.lib
`modules/freetype2.bat`
`modules/phpsdk-config_make.bat`
*  remove /Ob1 to keep /ob2, default with /o2
`modules/common/flags.sh`
*  build > go
`modules/all.bat`
*  rename build > go change param debug to verbose, avoiding confusion
`go.bat`
`modules/httpdanddeps.bat`
`modules/phpanddeps.bat`
`modules/subversionanddeps.bat`
*  remove unused
`modules/.unused/apr.dirty.bat`
`modules/.unused/apr.patch`
`modules/.unused/apr.sh`
`modules/.unused/apr.sln.bat`
`modules/.unused/boost.bat`
`modules/.unused/libzmq.bat`
`modules/.unused/libzmq.sh`
`modules/.unused/pecl-database-mysql_xdevapi-protobuf.txt`
`modules/.unused/pecl-database-mysql_xdevapi.patch`
`modules/.unused/php-sdk-binary-tools_issues_62.patch`
`modules/.unused/protobuf.bat`
`modules/.unused/vcxproj_rename.sh`
*  clean & simplify flags change (to be continued)
`build.bat`
`modules/apr.sh`
`modules/bzip2.bat`
`modules/common/flags.sh`
`modules/curl.bat`
`modules/httpd.bat`
`modules/httpd_flags.sh`
`modules/libxml2.patch`
`modules/openssl.bat`
`modules/php-cgi-spawner.bat`
`modules/phpsdk-config_make.bat`
`modules/zlib.bat`
`modules/zlib.patch`
*  add usefull info
`utils/info.md`
*  patch configure for jpeg lib name & freetype required lib remove init and enable verbose
`modules/phpsdk-local.bat`
*  change order for freetype2 requiring png
`modules/phpanddeps.bat`
*  ref. for EnableEnhancedInstructionSet NotSet
`avx.bat`
*  final review
`modules/freetype2.bat`
`modules/libxdiff.bat`
`modules/lua.bat`
`modules/tidy.bat`
`modules/wineditline.bat`
*  add recurse option and file as input (not only dir)
`utils/sub/bininfo.php`
*  add word to check
`utils/sub/logcheck.php`
*  final review
`modules/jpeg.bat`
*  final review
`modules/libpng.bat`
*  final review
`modules/libxpm.bat`
`modules/libxpm.sh`
*  correct AVXVCX for AVX 0
`avx.bat`
*  add WindowsTargetPlatformVersion and PlatformToolset to msbuild option instead of vcxproj.sh
`env_sample.bat`
`modules/common/vcxproj.sh`
*  https://github.com/jemalloc/jemalloc/issues/1099 in bat
`modules/jemalloc.bat`
`modules/jemalloc.sh`
*  remove unused -W3 cflag
`modules/sqlite.bat`
*  echo current module and conf before checked lines
`utils/sub/logcheck.php`
*  disable warn C4028
`modules/jemalloc.bat`
*  disable C4018
`modules/libiconv.bat`
*  disable rename of libjpeg and patch configure.js in php
`modules/.unused/vcxproj_rename.sh`
`modules/jpeg.bat`
`modules/jpeg.sh`
*  change git source for nmake build (vcxproj was bugged)
`modules/freetype.bat`
`modules/freetype.sh`
`modules/freetype2.bat`
*  init src: sdk, php, pecl
`modules/php.bat`
*  add cls before list message
`utils/logcheck.bat`
*  remove unsed var CFLAGS
`avx.bat`
*  patch for use with vc15
`modules/php-sdk.patch`
*  final review
`modules/php-cgi-spawner.bat`
*  final review for standalone bin
`modules/memcached.bat`
`modules/memcached.patch`
`modules/nssm.bat`
`modules/nssm.patch`
`modules/sdlna.bat`
*  prettify and readable
`modules/mobac.bat`
*  final review
`modules/ddverpatch.bat`
*  * final check, clean, correct, prettify & readable for svn and dep
`modules/serf.bat`
`modules/subversion.bat`
*  correct unwanted space
`env_sample.bat`
*  prettify
`modules/libiconv.bat`
*  prettify
`modules/jemalloc.bat`
*  trim svn url
`utils/sub/srcstatus.php`
*  add warning:
`utils/sub/logcheck.php`
*  patch managed in init
`modules/mobac.bat`
*  manage debug & patch in init
`modules/common/init.bat`
*  add init for log
`modules/clean.bat`
*  final check, clean, correct, prettify & readable for httpd and all deps
`modules/apr.bat`
`modules/apr_post.patch`
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/cares.bat`
`modules/curl-sub.bat`
`modules/curl.bat`
`modules/httpd.bat`
`modules/httpd.patch`
`modules/httpd_flags.sh`
`modules/jansson.bat`
`modules/jemalloc.bat`
`modules/libev.bat`
`modules/libevent.bat`
`modules/libexpat.bat`
`modules/libiconv.bat`
`modules/libmaxminddb.bat`
`modules/libssh2.bat`
`modules/libxml2.bat`
`modules/lua.bat`
`modules/mod_h264_streaming.patch`
`modules/nghttp2.bat`
`modules/openssl.bat`
`modules/pcre.bat`
`modules/sqlite.bat`
`modules/zlib.bat`
*  add space for if...
`modules/phpsdk-config_make.bat`
*  rename
`utils/configexport.bat`
*  nolog for logcheck tools
`build.bat`
*  reafactor MSBUILD_OPTS
`env_sample.bat`
*  get exe name with binenv function
`utils/sub/bininfo.php`
*  logcheck
`utils/logcheck.bat`
`utils/sub/logcheck.php`
*  clean curlperf
`utils/curlperf.bat`
`utils/sub/curlperf.php`
`utils/sub/curlperf.txt`
`utils/test_curl.bat`
*  add reference & detail on applink.c
`modules/httpd.patch`
*  finalize output ans csv file
`utils/sub/srcstatus.php`
*  ingore /config/* & /env.bat
`.gitignore`
`utils/config/.vsconfig`
`utils/config/cyg32.packagelist`
`utils/config/cyg64.packagelist`
*  env > env_sample
`env_sample.bat`
`x64.bat`
`x86.bat`
*  refactor and add svn support
`utils/src_status.bat`
`utils/srcstatus.bat`
`utils/sub/repostatus.php`
`utils/sub/srcstatus.php`
*  v1 for bininfo
`utils/bin_info.bat`
`utils/bininfo.bat`
`utils/sub/bininfo.php`
`utils/sub/opcode.php`
*  add %PATH_SOFTS% comment for verpatch (use self-made from %PATH_SRC%\ddverpatch)
`env.bat`
*  remind TODO for dirty version
`modules/jpeg.bat`
*  add dirty version to binary et correct xcopy
`modules/wineditline.bat`
*  mobac patch for personal convenience ;)
`modules/mobac.patch`
*  move and add version to engines (lib > bin)
`modules/openssl.bat`
*  corrext xcopy issue patch curl.rc & libcurl.rc for incompatible copyright symbol
`modules/curl-sub.bat`
`modules/curl.bat`
*  patch src after init
`modules/mobac.bat`
*  correct xcopy
`modules/lua.bat`
*  add version to binary
`modules/libevent.bat`
*  add: openssl/applink.c in server & ab ApacheMonitor.rc without manifest modules/proxy/mod_proxy_fcgi.c https://www.apachelounge.com/viewtopic.php?p=36336
`modules/httpd.patch`
*  remove copyright and set product to finename
`modules/common/version.bat`
*  add svn init
`modules/common/init.bat`
*  patch version for apr_dbd_odbc-1.dll (don't know why rc is empty...)
`modules/apr.bat`
*  add bininfo checkavx updaterc
`modules/all.bat`
*  build latest verpatch and patch it for apache uncompatible rc...
`modules/ddverpatch.bat`
`modules/ddverpatch.patch`
*  will be autogenerated from repostatus.php
`utils/src_generate.sh`
*  pass all params to batch in /module or /utils
`build.bat`
*  call utils from build.bat
`env.bat`
`util.bat`
*  single batch for all utils
`util.bat`
*  enable-debug-pack & copy pdb
`modules/phpsdk-config_make.bat`
*  tools => utils
`tools/bin_info.bat`
`tools/sub/opcode.php`
`utils/bin_info.bat`
`utils/config/.vsconfig`
`utils/config/cyg32.packagelist`
`utils/config/cyg64.packagelist`
`utils/config_sav.bat`
`utils/curl_perf.bat`
`utils/info.md`
`utils/src_generate.sh`
`utils/src_status.bat`
`utils/sub/opcode.list`
`utils/sub/opcode.php`
`utils/sub/opcode.sh`
`utils/sub/opcode_update-list.sh`
`utils/sub/php.ini`
`utils/sub/repostatus.php`
`utils/sub/test_curl.php`
`utils/sub/test_curl.txt`
`utils/test_curl.bat`
*  keep zlib static name for pdb patch php configure for zlib static
`modules/phpsdk-local.bat`
`modules/zlib.bat`
*  clean & var refactor
`avx.bat`
`build.bat`
`env.bat`
`modules/all.bat`
`modules/common/init.bat`
`modules/curl.bat`
`modules/httpd.bat`
`modules/httpdanddeps.bat`
`modules/memcached.bat`
`modules/php.bat`
`modules/phpanddeps.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
`modules/subversion.bat`
`modules/subversionanddeps.bat`
*  wineditline self made
`modules/php-getdeps.php`
`modules/phpsdk-local.bat`
`modules/wineditline.bat`
*  correct %CURL_VER%
`modules/php.bat`
*  patch for VS preview release and specific beta toolkit version
`modules/.unused/php-sdk-binary-tools_issues_62.patch`
*  patch LUA51 > LUA (for lua 5.3.x)
`modules/httpd.patch`
*  add some tools & info
`tools/info.md`
`tools/src_generate.sh`
`tools/test_curl.bat`
*  lower case... add call to version.bat
`README.md`
`build.bat`
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/cares.bat`
`modules/common/init.bat`
`modules/common/ymdhis.bat`
`modules/freetype.bat`
`modules/jansson.bat`
`modules/jemalloc.bat`
`modules/jpeg.bat`
`modules/libev.bat`
`modules/libexpat.bat`
`modules/libpng.bat`
`modules/libxdiff.bat`
`modules/libxpm.bat`
`modules/nssm.bat`
`modules/pcre.bat`
`modules/tidy.bat`
*  add AVXECHO for build.bat
`avx.bat`
*  add * to xcopy disabling prompt file or folder...
`modules/httpd.bat`
*  disable mklink and add path for include : - /sqlite3 for PHP & APR - /libxml2 for PHP
`modules/apr.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
`modules/sqlite.bat`
*  define CURL var
`modules/php.bat`
*  add BIN_PATH for Dependencies.exe & sigcheck.exe for bin_info.bat
`env.bat`
*  prettify & readable correct few syntax
`modules/lua.bat`
*  add param to build for disable duplicate logs
`build.bat`
`modules/httpdanddeps.bat`
`modules/phpanddeps.bat`
`modules/subversionanddeps.bat`
*  rename
`tools/config_sav.bat`
`tools/curl_perf.bat`
`tools/src_status.bat`
*  clean /build & /release
`modules/clean.bat`
*  tool for checking bin released (version, date, pdb, avx, compiler...)
`tools/bin_info.bat`
`tools/sub/opcode.list`
`tools/sub/opcode.php`
`tools/sub/opcode.sh`
`tools/sub/opcode_update-list.sh`
*  tool testing curl perf between openssl & winssl
`tools/sub/php.ini`
`tools/sub/test_curl.php`
`tools/sub/test_curl.txt`
`tools/test_curl.bat`
*  disable echo on
`modules/common/init.bat`
*  refresh available compiled deps list for php
`modules/php-getdeps.php`
*  copy include for PHP
`modules/jpeg.bat`
`modules/libxpm.bat`
*  modules/git.* > tools/repostatus.*
`modules/git.bat`
`tools/repostatus.bat`
`tools/sub/repostatus.php`
*  copy curl.exe to %PATH_INSTALL%\bin for static curl use
`modules/httpd.bat`
*  prettify & xcopy for release
`modules/subversion.bat`
*  remove unwanted char ^^
`modules/jemalloc.bat`
`modules/libexpat.bat`
*  fix %PATH_MODULES_COMMON%\version.bat
`modules/lua.bat`
*  echo on before building
`modules/common/init.bat`
*  prettiffy & readable curllib bugfix
`modules/httpd.bat`
*  patch libcrypto.lib path hardcoded in Makefile.win copy arch\win32 h files to %PATH_INSTALL%\include patch include/apu.hw hard copied to apu.h according to current configuration
`modules/apr.bat`
`modules/apr.patch`
*  suppress all echo
`modules/subversion.bat`
*  add echo for BEGIN and END module build
`build.bat`
*  _
`modules/.unused/apr.dirty.bat`
*  suppress echo on
`modules/common/init.bat`
*  echo off
`modules/common/version.bat`
*  echo off
`modules/common/ymdhis.bat`
*  correct move problem by xcopy from build to release limit version build to httpd & php ones
`modules/curl-sub.bat`
`modules/curl.bat`
*  prettify
`modules/jemalloc.bat`
*  mklink include sqlite from phpsdk-local.bat to sqlite.bat (req for PHP & APR)
`modules/phpsdk-local.bat`
`modules/sqlite.bat`
*  disable txt copy at root...
`modules/apr.patch`
*  change git repo v2.24.103 > v2.24.103
`modules/nssm.bat`
`modules/nssm.patch`
*  add BIN_CHKMATCH
`env.bat`
*  correct replace for vcxproj on SSE2 build
`avx.bat`
*  manage version with modules/common/version.bat
`modules/brotli.bat`
`modules/cares.bat`
`modules/common/version.bat`
`modules/jansson.bat`
`modules/jemalloc.bat`
`modules/libexpat.bat`
`modules/libpng.bat`
`modules/libxdiff.bat`
`modules/lua.bat`
`modules/pcre.bat`
`modules/sqlite.bat`
`modules/tidy.bat`
*  patch for install target : no exit on missing pdb file & verbose
`modules/apr.patch`
*  add devenv BIN_PATH remove unused var (PHP boost mysql-xdevapi)
`env.bat`
*  add VAR for libbz2 target name
`modules/bzip2.bat`
*  set init sequence in main curl batch instead of curl-sub build all version
`modules/curl.bat`
*  move init sequence to main curl batch change copy & delete order to avoid copy problem (hard drive latency...)
`modules/curl-sub.bat`
*  change SRC var
`modules/git.bat`
*  change hardcoded SRC var by ENV var
`modules/git.php`
*  cares name change
`modules/httpdanddeps.bat`
*  prettify & readable move mklink for php in php batch
`modules/libxml2.bat`
*  prettify & readable
`modules/nghttp2.bat`
*  libev for official repo with herited (4.22) windows build patch
`modules/libev.bat`
`modules/libev.patch`
`modules/libev.sh`
*  php and req deps for build.bat
`modules/phpanddeps.bat`
*  refactor php build
`modules/php-getdeps.php`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
*  prettify & readable
`modules/subversion.bat`
*  rename from libjpeg and change for build.bat
`modules/jpeg.bat`
`modules/jpeg.sh`
*  moved to .unused
`modules/pecl-database-mysql_xdevapi.patch`
*  nssm for build.bat
`modules/nssm.bat`
*  add unused lib batch
`modules/.unused/apr.dirty.bat`
`modules/.unused/apr.patch`
`modules/.unused/apr.sh`
`modules/.unused/apr.sln.bat`
`modules/.unused/boost.bat`
`modules/.unused/libzmq.bat`
`modules/.unused/libzmq.sh`
`modules/.unused/pecl-database-mysql_xdevapi-protobuf.txt`
`modules/.unused/pecl-database-mysql_xdevapi.patch`
`modules/.unused/protobuf.bat`
*  change in *.win.mk & *.mak for use with makefile.win
`modules/apr.sh`
`tools/generate_config.bat`
*  use Makefile.win for apr / apr-util & apr-iconv
`modules/apr.bat`
*  shell to rename lib dll exe pdb in vcxproj
`modules/common/vcxproj_rename.sh`
*  correct call .\env.bat
`x86.bat`
*  rename
`modules/libjpeg-php.bat`
`modules/libxdiff-php.bat`
`modules/libxdiff.bat`
`modules/tidy-php.bat`
`modules/tidy.bat`
*  rename
`modules/cares.bat`
*  var-path > env @root
`env.bat`
`x64.bat`
`x86.bat`
*  add version for missing one (exe dll) various little fix & improve prettify & readable
`avx.bat`
`modules/apr.bat`
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/c-ares.bat`
`modules/common/var-path.bat`
`modules/curl.bat`
`modules/jansson.bat`
`modules/jemalloc.bat`
`modules/libev.bat`
`modules/libexpat.bat`
`modules/libpng.bat`
`modules/lua.bat`
`modules/pcre.bat`
`modules/php.bat`
`modules/phpsdk-local.bat`
`modules/sqlite.bat`
*  ready for build.bat
`modules/freetype-php.bat`
`modules/freetype.bat`
`modules/freetype.sh`
`modules/libpng-php.bat`
`modules/libpng.bat`
`modules/libxpm-php.bat`
`modules/libxpm.bat`
`modules/libxpm.sh`
`modules/libxpm_version.h`
*  unused
`modules/protobuf-php.bat`
*  add version.rc for versionning dll & exe
`modules/common/version.rc`
*  add LINK EnableCOMDATFolding & OptimizeReferences force CL MAxSpeed
`modules/common/vcxproj.sh`
*  create /build dir for each release type (for parallel build)
`avx.bat`
`modules/common/var-path.bat`
*  simplify copy file patch LNK4197
`modules/apr.bat`
*  remove d4133
`modules/apr.sh`
*  echo on for build process
`modules/common/init.bat`
*  refactor PATH var-path update Windows kit version
`modules/common/var-path.bat`
*  PATH_HTTPD_SDK > PATH_BATCH
`build.bat`
*  disable all builds loop for only httpd & php needed
`modules/curl.bat`
*  correct hardcoded path
`modules/httpd.bat`
*  prettify & readable loop for include copy
`modules/apr.bat`
*  prettify & readable
`modules/libexpat.bat`
*  correct hardcoded path
`avx.bat`
*  correct hardcoded path
`modules/jemalloc.bat`
*  PATH_HTTPD_SDK > PATH_BATCH
`modules/httpdanddeps.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
`modules/subversionanddeps.bat`
*  correct hardcoded path
`modules/libevent.bat`
*  correct hardcoded path
`modules/memcached.bat`
`modules/mobac.bat`
*  correct hardcoded path
`modules/nghttp2.bat`
*  unset rmdir unused
`modules/subversion.bat`
*  MSVC_DEPS=vc%MSVC_VER%
`vc15.bat`
`vs16.bat`
*  correct call to var-path.bat > relative
`x64.bat`
`x86.bat`
*  pretty & readable
`modules/common/var-path.bat`
*  supress unused echo
`modules/common/init.bat`
*  add wd4311
`modules/common/flags.sh`
*  loop for build ALL
`build.bat`
*  disable /install mklink %PATH_INSTALL% > /release/__VER__
`avx.bat`
*  supress hardcoded path
`modules/apr.bat`
*  supress hard coded path
`modules/httpd_flags.sh`
*  curl > winssl_dll_deps-static pretty & readable
`modules/dummy.bat`
`modules/httpd.bat`
*  update & add autogen
`config/cyg32.packagelist`
`config/cyg64.packagelist`
*  patch bug 1099 x86
`modules/jemalloc.bat`
`modules/jemalloc.sh`
*  unused
`modules/sqlite-svn.sh`
*  pretty & readable
`modules/libssh2.bat`
*  unused
`modules/libzmq-php.bat`
`modules/libzmq-php.sh`
*  pretty & readable
`modules/nghttp2.bat`
`modules/openssl.bat`
`modules/zlib.bat`
*  mod_h264 & httpd patch instead of local git branch
`modules/httpd.bat`
`modules/httpd.patch`
`modules/httpdanddeps.bat`
`modules/mod_h264_streaming.patch`
*  remove sqlite as it build on httpd
`modules/phpsdk-local.bat`
*  git apply with param %1
`modules/curl.bat`
`modules/libxml2.bat`
`modules/zlib.bat`
*  httpd for build.bat
`modules/httpd.bat`
`modules/httpd_flags.sh`
`modules/httpd_flags_RelWithDebInfo.sh`
`modules/httpd_flags_Release.sh`
`modules/httpdanddeps.bat`
*  apr for build.bat
`modules/apr.bat`
`modules/apr.sh`
*  add wd XXXX add RC nologo remove W3
`modules/common/flags.sh`
*  lua for build.bat
`modules/lua.bat`
`modules/lua.sh`
*  subversion for build.bat
`modules/subversion-svn.bat`
`modules/subversion.bat`
`modules/subversionanddeps.bat`
*  serf for build.bat
`modules/serf-svn.bat`
`modules/serf-svn.sh`
`modules/serf.bat`
*  included in httpd.bat
`modules/mod_h264_streaming.bat`
*  remove link libexpat > expat for APR
`modules/libexpat.bat`
*  remove link libbz2 => bzip2 for pcre
`modules/bzip2.bat`
*  add PATH_JDK
`modules/common/var-path.bat`
*  refactor apr for build.bat use & native source (without hand made sln...)
`modules/apr.bat`
*  use %1 param instead of hard-coded
`modules/libexpat.bat`
`modules/libmaxminddb.bat`
*  add static build
`modules/sqlite.bat`
*  use %1 parma instead of curl
`modules/apr.sh`
`modules/curl.bat`
*  correct build.bat call
`modules/httpdanddeps.bat`
`modules/subversionanddeps.bat`
*  unused
`modules/boost.bat.unused`
`modules/libexpat.sh`
`modules/libmaxminddb.sh`
*  sdlna for buil.bat
`modules/sdlna.bat`
*  mobac for build.bat
`modules/common/var-path.bat`
`modules/mobac.bat`
*  add zlib1 in deps
`modules/subversion-svn.bat`
*  memcached for build.bat
`modules/memcached.bat`
`modules/memcached.sh`
*  extstore OK without patch >= 1.6.4
`modules/memcached.patch`
*  git apply patch > verbose
`modules/curl.bat`
`modules/httpd.bat`
`modules/libxml2.bat`
`modules/zlib.bat`
*  correct git clean bug in loop
`modules/curl-sub.bat`
`modules/curl.bat`
*  correct rmdir options
`modules/common/var-path.bat`
*  curl for build.bat
`modules/c-ares.bat`
*  curl for build.bat
`modules/common/var-path.bat`
`modules/curl-sub.bat`
`modules/curl.bat`
`modules/curl.patch`
*  change flags add for static libs
`modules/common/flags.sh`
*  change for use in build.bat
`modules/libssh2.bat`
`modules/libssh2.sh`
`modules/nghttp2.bat`
`modules/nghttp2.sh`
*  nghttp2 for build.bat
`modules/common/var-path.bat`
`modules/nghttp2.bat`
*  / > \ init.bat
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/c-ares.bat`
`modules/httpd.bat`
`modules/jansson.bat`
`modules/jemalloc.bat`
`modules/libev.bat`
`modules/libevent.bat`
`modules/libiconv.bat`
`modules/libxml2.bat`
`modules/pcre.bat`
`modules/zlib.bat`
*  change order of deps buils
`modules/httpdanddeps.bat`
*  correct %CYGPATH_MODULES_COMMON%/
`modules/brotli.bat`
`modules/c-ares.bat`
`modules/jansson.bat`
`modules/libevent.bat`
`modules/pcre.bat`
*  add issue reference of patch
`modules/httpd.bat`
`modules/memcached.sh`
*  chnage for build.bat use
`modules/libev.bat`
`modules/libev.sh`
*  libevent for build.bat use
`modules/libevent.bat`
`modules/libevent.sh`
*  enable pcre16 & pcre32
`modules/pcre.bat`
*  use with build.bat
`modules/openssl.bat`
*  pcre use with build.bat
`modules/pcre.bat`
`modules/pcre.sh`
*  libxml2 for use with build.bat
`modules/libxml2.bat`
`modules/libxml2.patch`
*  echo off internal IF
`modules/common/init.bat`
*  use vcxproj.sh in libiconv.bat
`modules/libiconv.sh`
*  patch mod_maxminddb in httpd.bat
`modules/httpd.bat`
`modules/mod_maxminddb.bat`
*  correct flags.sh folder
`modules/c-ares.bat`
*  remove "v" char for toolset version
`modules/common/vcxproj.sh`
*  add cmake parameter to only create PATH_BUILD structure for cmake build
`modules/common/init.bat`
*  improve sed in loop
`modules/common/flags.sh`
*  correct flags.sh folder
`modules/jansson.bat`
*  revert to src build path
`modules/jemalloc.bat`
*  build.bat use
`modules/libiconv.bat`
*  build.bat use
`modules/libxml2.bat`
*  make patch for master branch on makefile
`modules/bzip2.bat`
*  correct flags.sh folder
`modules/brotli.bat`
*  zlib with build.bat
`modules/zlib.bat`
`modules/zlib.patch`
*  unused
`modules/jansson.sh`
*  v1.0.8
`modules/bzip2.bat`
*  change vcxproj.sh exec path & params
`modules/apr.bat`
`modules/libiconv.bat`
`modules/libmaxminddb.bat`
`modules/subversion-svn.bat`
*  combine all vcxproj change for all src
`modules/common/vcxproj.sh`
*  v4 > v5 use vcxproj.sh
`modules/jemalloc.bat`
*  refactor to use with build.bat
`modules/zlib.bat`
*  rename and use ENV var PATH_LOGS
`modules/git.bat`
*  rename
`modules/git.php`
*  merged to module/common/vcxproj.sh
`modules/vcxproj2vc15.sh`
*  add PATH_LOGS
`modules/common/var-path.bat`
*  echo off big if
`build.bat`
*  create install structure if not exist
`avx.bat`
*  add PTFTS (plateformtoolset) version
`vc15.bat`
`vs16.bat`
*  xcommon > var-path
`x64.bat`
`x86.bat`
*  correct fixed core by %NUMBER_OF_PROCESSORS%
`avx.bat`
`silent-httpd-build.bat`
`silent-subversion-build.bat`
*  modules_bat > modules
`_all.bat`
`build.bat`
`config/.vsconfig`
`config/cyg32.packagelist`
`config/cyg64.packagelist`
`httpd-build.bat`
`modules/apr.bat`
`modules/boost.bat.unused`
`modules/brotli.bat`
`modules/bzip2.bat`
`modules/c-ares.bat`
`modules/common/flags.sh`
`modules/common/init.bat`
`modules/common/var-path.bat`
`modules/common/vcxproj.sh`
`modules/common/ymdhis.bat`
`modules/curl.bat`
`modules/freetype-php.bat`
`modules/git-fetch.php`
`modules/git.bat`
`modules/httpd.bat`
`modules/httpd.exe.manifest`
`modules/httpd_flags.sh`
`modules/httpd_flags_RelWithDebInfo.sh`
`modules/httpd_flags_Release.sh`
`modules/httpdanddeps.bat`
`modules/jansson.bat`
`modules/jansson.sh`
`modules/jemalloc.bat`
`modules/libev.bat`
`modules/libev.sh`
`modules/libevent.bat`
`modules/libevent.sh`
`modules/libexpat.bat`
`modules/libexpat.sh`
`modules/libiconv.bat`
`modules/libiconv.sh`
`modules/libjpeg-php.bat`
`modules/libmaxminddb.bat`
`modules/libmaxminddb.sh`
`modules/libpng-php.bat`
`modules/libssh2.bat`
`modules/libssh2.sh`
`modules/libxdiff-php.bat`
`modules/libxml2.bat`
`modules/libxpm-php.bat`
`modules/libzmq-php.bat`
`modules/libzmq-php.sh`
`modules/lua.bat`
`modules/lua.sh`
`modules/memcached.patch`
`modules/memcached.sh`
`modules/mod_h264_streaming.bat`
`modules/mod_maxminddb.bat`
`modules/mod_maxminddb.patch`
`modules/nghttp2.bat`
`modules/nghttp2.sh`
`modules/openssl.bat`
`modules/pcre.bat`
`modules/pcre.sh`
`modules/pecl-database-mysql_xdevapi.patch`
`modules/php-getdeps.php`
`modules/php.bat`
`modules/phpsdk-config_make.bat`
`modules/phpsdk-local.bat`
`modules/protobuf-php.bat`
`modules/serf-svn.bat`
`modules/serf-svn.sh`
`modules/sqlite-svn.sh`
`modules/sqlite.bat`
`modules/subversion-svn.bat`
`modules/subversion-svn.sh`
`modules/subversionanddeps.bat`
`modules/tidy-php.bat`
`modules/vcxproj2vc15.sh`
`modules/zlib.bat`
`modules_bat/brotli.bat`
`modules_bat/brotli.sh`
`modules_bat/c-ares.bat`
`modules_bat/c-ares.sh`
`modules_bat/jemalloc.bat`
`silent-git-fetch.bat`
`silent-php-build.bat`
`subversion-build.bat`
*  generate config export for VS & cygwin
`config/generate_config.bat`
*  correct LF
`modules_bat/libiconv.sh`
`modules_bat/vcxproj2vc15.sh`
*  ready to merge
`README.md`
`xCommon.bat`
*  correct cmake flags sed DIAG_BITS
`modules_bat/httpd_flags.sh`
*  v7
`README.md`
`modules_bat/apr.bat`
`modules_bat/brotli.bat`
`modules_bat/c-ares.bat`
`modules_bat/freetype-php.bat`
`modules_bat/httpd.bat`
`modules_bat/jansson.bat`
`modules_bat/jemalloc.bat`
`modules_bat/libev.bat`
`modules_bat/libevent.bat`
`modules_bat/libexpat.bat`
`modules_bat/libiconv.bat`
`modules_bat/libjpeg-php.bat`
`modules_bat/libmaxminddb.bat`
`modules_bat/libpng-php.bat`
`modules_bat/libssh2.bat`
`modules_bat/libzmq-php.bat`
`modules_bat/lua.bat`
`modules_bat/nghttp2.bat`
`modules_bat/pcre.bat`
`modules_bat/serf-svn.bat`
`modules_bat/sqlite.bat`
`modules_bat/subversion-svn.bat`
*  v6
`avx.bat`
`xCommon.bat`
*  v5
`modules_bat/libiconv.sh`
`modules_bat/libmaxminddb.sh`
`modules_bat/subversion-svn.sh`
`modules_bat/vcxproj2vc15.sh`
*  v4
`xCommon.bat`
*  v3
`xCommon.bat`
*  v2
`x64.bat`
`x86.bat`
`xCommon.bat`
*  v1
`_all.bat`
`avx.bat`
`httpd-build.bat`
`modules_bat/apr.bat`
`modules_bat/brotli.bat`
`modules_bat/bzip2.bat`
`modules_bat/c-ares.bat`
`modules_bat/curl.bat`
`modules_bat/freetype-php.bat`
`modules_bat/httpd.bat`
`modules_bat/jansson.bat`
`modules_bat/jemalloc.bat`
`modules_bat/libev.bat`
`modules_bat/libevent.bat`
`modules_bat/libexpat.bat`
`modules_bat/libiconv.bat`
`modules_bat/libjpeg-php.bat`
`modules_bat/libmaxminddb.bat`
`modules_bat/libpng-php.bat`
`modules_bat/libssh2.bat`
`modules_bat/libxdiff-php.bat`
`modules_bat/libxml2.bat`
`modules_bat/libxpm-php.bat`
`modules_bat/libzmq-php.bat`
`modules_bat/lua.bat`
`modules_bat/mod_h264_streaming.bat`
`modules_bat/mod_maxminddb.bat`
`modules_bat/nghttp2.bat`
`modules_bat/openssl.bat`
`modules_bat/pcre.bat`
`modules_bat/protobuf-php.bat`
`modules_bat/serf-svn.bat`
`modules_bat/sqlite.bat`
`modules_bat/subversion-svn.bat`
`modules_bat/tidy-php.bat`
`modules_bat/zlib.bat`
`phpsdk-config_make.bat`
`phpsdk-local.bat`
`silent-git-fetch.bat`
`silent-httpd-build.bat`
`silent-php-build.bat`
`silent-subversion-build.bat`
`x64.bat`
`x86.bat`
`xCommon.bat`
*  https://gist.github.com/erikvip/63b236078d4ff4163fd3
`cyg32.packagelist`
`cyg64.packagelist`
*  vs16 >master LF
`README.md`
`modules_bat/subversion-svn.bat`
`modules_bat/tidy-php.bat`
`modules_bat/zlib.bat`
`php-getdeps.php`
`phpsdk-config_make.bat`
`phpsdk-local.bat`
`silent-httpd-build.bat`
`silent-php-build.bat`
`silent-subversion-build.bat`
`vc15.bat`
`vs16.bat`
`x64.bat`
`x86.bat`
`xCommon.bat`
`ymdhis.bat`
*  remove exit... memcached
`modules_bat/memcached.sh`
*  finalize memcached install shell with - patch for external storage - patch for not build debug
`modules_bat/memcached.patch`
`modules_bat/memcached.sh`
*  add avx & tls global refactor
`modules_bat/memcached.sh`
*  14.24 > 14.25
`vs16.bat`
*  bug correction for !vs16 list.txt are not named master but PHP_VER
`php-getdeps.php`
*  use ASM disable doc install upgrade option for 1.1.1e
`modules_bat/openssl.bat`
*  move memcached from src
`modules_bat/memcached.sh`
*  libxml2 update MP8 => MP%MTPROC%
`modules_bat/bzip2.bat`
`modules_bat/curl.bat`
`modules_bat/libxml2.bat`
`modules_bat/openssl.bat`
`modules_bat/zlib.bat`
*  patch msvs16 for mod_maxminddb
`modules_bat/httpd.bat`
`modules_bat/mod_maxminddb.bat`
`modules_bat/mod_maxminddb.patch`
*  refactor PHP batc for AVX inversion du ton var value in if
`phpsdk-config_make.bat`
`phpsdk-local.bat`
*  remove boost & protobuf options in configure
`phpsdk-config_make.bat`
*  copy winssl libcurl to mod_md github
`_all.bat`
`modules_bat/httpd.bat`
`xCommon.bat`
*  update vsconfig PHPVER according to git tag
`.vsconfig`
`phpsdk-local.bat`
*  php < 7.4 for memcache only
`phpsdk-config_make.bat`
*  disable protobuf & zmq
`phpsdk-local.bat`
*  libexpat
`modules_bat/subversion-svn.bat`
*  MTPROC
`xCommon.bat`
*  14.23 > 14.24
`vs16.bat`
*  AVXSED disable for 7.4 + formatting
`phpsdk-config_make.bat`
*  php 7.4 with sqlite
`phpsdk-config_make.bat`
`phpsdk-local.bat`
*  sqlite rename
`subversion-build.bat`
*  sqlite self build
`php-getdeps.php`
*  sqlit rename for PHP
`modules_bat/sqlite-svn.bat`
`modules_bat/sqlite.bat`
*  copy /lib pdb
`modules_bat/nghttp2.bat`
*  use sqlite3 from deps
`php-getdeps.php`
*  sed for natve tag build
`modules_bat/nghttp2.bat`
*  change src path
`modules_bat/apr.bat`
*  svn 1.13.0 expat 2.2.9 : expat => libexpat
`modules_bat/libexpat.bat`
`modules_bat/subversion-svn.bat`
*  20191015
`modules_bat/pecl-database-mysql_xdevapi.patch`
`phpsdk-config_make.bat`
*  add projectnamepdb export
`modules_bat/libmaxminddb.bat`
`modules_bat/libmaxminddb.sh`
*  add gen_char flags correct rc flags
`modules_bat/httpd_flags.sh`
*  correct release with pdb value
`modules_bat/httpd_flags_Release.sh`
*  add GIT_GC
`git-fetch.php`
*  2.2.9
`modules_bat/libexpat.bat`
*  conform option to 2.2.8
`modules_bat/libexpat.bat`
*  correct protobuf path
`phpsdk-config_make.bat`
*  outdir => outdirphp
`phpsdk-config_make.bat`
*  outdir => outdirphp
`phpsdk-local.bat`
*  VS16.3 : 14.23
`vs16.bat`
*  same name as sln outdir since VS16.3 ^^
`avx.bat`
*  add AVX flage for php build != 7.3
`phpsdk-config_make.bat`
*  refactor and correct if batch bug for AVX
`phpsdk-config_make.bat`
`phpsdk-local.bat`
*  disable mod_ssl copy for mod_md (unpatched since 2.4.40)
`modules_bat/httpd.bat`
*  add php vars
`avx.bat`
*  use curl from php-sdk deps
`php-getdeps.php`
*  VS 16.2.0 : 14.21 > 14.22
`vs16.bat`
*  disable ssh2 / ssl : does'nt work on mod_md & may crash php curl
`modules_bat/curl.bat`
*  add php 7.1
`phpsdk-config_make.bat`
*  BUILDTS & raz nonodeps
`phpsdk-local.bat`
*  remove space...
`silent-git-fetch.bat`
*  refactor for specified module
`_all.bat`
*  display serie
`php-getdeps.php`
*  static mklink 4_3_1 => 4_3_2
`modules_bat/libzmq-php.bat`
*  silent echo off
`avx.bat`
`vc15.bat`
`vs16.bat`
*  set PATH after xCommon with PATHORI
`x64.bat`
`x86.bat`
*  bug fix PATH & INCLUDE variables for _all
`xCommon.bat`
*  bug fix copye dll & pdb
`modules_bat/libssh2.bat`
*  libiconv common for httpd & php without local branch
`modules_bat/libiconv-php.bat`
`modules_bat/libiconv.bat`
`modules_bat/libiconv.sh`
`phpsdk-local.bat`
*  change link and var set location according to AVX
`avx.bat`
`xCommon.bat`
*  echo off + log essential factorize AVX
`avx.bat`
`phpsdk-local.bat`
`vc15.bat`
`vs16.bat`
`x64.bat`
`x86.bat`
`xCommon.bat`
*  add !AVX
`_all.bat`
*  git reset & clean order
`modules_bat/apr.bat`
`modules_bat/bzip2.bat`
`modules_bat/freetype-php.bat`
`modules_bat/jemalloc.bat`
`modules_bat/libiconv-php.bat`
`modules_bat/libiconv.bat`
`modules_bat/libjpeg-php.bat`
`modules_bat/libmaxminddb.bat`
`modules_bat/libpng-php.bat`
`modules_bat/libxml2.bat`
`modules_bat/subversion-svn.bat`
`modules_bat/zlib.bat`
*  flags optim
`modules_bat/sqlite-svn.bat`
*  updatedeps = 1
`phpsdk-local.bat`
*  pdb & ltcg for static
`modules_bat/serf-svn.bat`
`modules_bat/serf-svn.sh`
*  vc15 patch zlib pdb name
`_all.bat`
`modules_bat/sqlite-svn.sh`
`modules_bat/subversion-svn.bat`
*  libssh2 for httpd (curl) instead of php
`httpd-build.bat`
`modules_bat/libssh2-php.bat`
`modules_bat/libssh2.bat`
`modules_bat/libssh2.sh`
*  curl shared
`phpsdk-config_make.bat`
*  clean curl build
`modules_bat/curl.bat`
*  clean build of static & shared libs for curl
`modules_bat/nghttp2.bat`
`modules_bat/nghttp2.sh`
*  refactor finish al php version
`phpsdk-config_make.bat`
*  phpsdk_deps => php-getdeps.php 2/2
`phpsdk-local.bat`
*  phpsdk_deps => php-getdeps.php 1/2
`phpsdk-local.bat`
*  git clean -fdx
`modules_bat/apr.bat`
`modules_bat/bzip2.bat`
`modules_bat/curl.bat`
`modules_bat/freetype-php.bat`
`modules_bat/jemalloc.bat`
`modules_bat/libiconv-php.bat`
`modules_bat/libiconv.bat`
`modules_bat/libjpeg-php.bat`
`modules_bat/libmaxminddb.bat`
`modules_bat/libpng-php.bat`
`modules_bat/libxml2.bat`
`modules_bat/zlib.bat`
`php-getdeps.php`
*  clean static with static & dll with dll
`modules_bat/curl.bat`
`modules_bat/zlib.bat`
*  mklink for pcre & php (different name...)
`modules_bat/bzip2.bat`
*  build static for curl static
`modules_bat/nghttp2.bat`
*  force MSVC16 for vc15 & vs16
`modules_bat/libiconv-php.bat`
*  mklink include pour PHP
`modules_bat/libxml2.bat`
*  static pour curl static
`modules_bat/c-ares.bat`
*  static pour curl static
`modules_bat/nghttp2.bat`
`modules_bat/nghttp2.sh`
*  php deps vc15
`modules_bat/freetype-php.bat`
`modules_bat/libiconv-php.bat`
`modules_bat/libjpeg-php.bat`
`modules_bat/libpng-php.bat`
`modules_bat/libzmq-php.bat`
`modules_bat/libzmq-php.sh`
*  zmq ltcg & co
`modules_bat/libzmq-php.sh`
*  refactor for better deps usage
`phpsdk-local.bat`
*  add msvc version to log
`silent-httpd-build.bat`
`silent-php-build.bat`
*  ltcg for Lib
`vcxproj.sh`
*  MSIL LTCG for Lib (ARFLAGS = -nologo -ltcg)
`modules_bat/libmaxminddb.bat`
`modules_bat/libssh2-php.sh`
`modules_bat/libxml2.bat`
`modules_bat/zlib.bat`
*  factorise php build depending version
`phpsdk-config_make-7.1.bat`
`phpsdk-config_make-7.2.bat`
`phpsdk-config_make.bat`
*  ext outdir name for ssh2 build test
`modules_bat/curl.bat`
*  ext prefix forr curl / httpd testing build
`modules_bat/libssh2-php.bat`
*  improved for vc15
`modules_bat/apr.bat`
`modules_bat/c-ares.sh`
`modules_bat/curl.bat`
`modules_bat/libev.sh`
`modules_bat/libevent.bat`
`modules_bat/libiconv-php.bat`
`modules_bat/libmaxminddb.bat`
`modules_bat/libssh2-php.bat`
`modules_bat/nghttp2.bat`
`modules_bat/openssl.bat`
`php-build.bat`
`phpsdk-config_make-7.3.bat`
`phpsdk-local.bat`
*  add MSVC_VER
`vc15.bat`
*  add LTCG sur Lib
`vcxproj.sh`
*  version 14.21
`vs16.bat`
*  cmake ltcg
`modules_bat/libevent.sh`
`modules_bat/libssh2-php.sh`
`modules_bat/nghttp2.sh`
*  add vs16
`.vsconfig`
*  add LTCG for static
`modules_bat/brotli.sh`
*  initial commit
`modules_bat/libzmq-php.bat`
*  vcxproj2vc15
`modules_bat/jemalloc.bat`
*  vcxproj2vc15
`modules_bat/vcxproj2vc15.sh`
*  back to root bat
`php-build.bat`
*  remove MSVC_DEPS
`xCommon.bat`
*  disable gloabal VAR
`MSVC_DEPS.bat`
`vc15.bat`
`vs16.bat`
*  rename for cmd line launch accordinf to ARCH & MSVC_NAME
`php-build.bat`
`silent-php-build.bat`
*  add path entries
`xCommon.bat`
*  add comment for sdk vs16 KO /NODEFAULTLIB:MSVCRTD.lib
`phpsdk-config_make-7.3.bat`
`phpsdk-local.bat`
*  avx bug : force reset --hard
`modules_bat/apr.bat`
`modules_bat/jemalloc.bat`
*  disable 4996 warning
`modules_bat/brotli.sh`
*  specific extflags for nghttp2
`modules_bat/nghttp2.bat`
`xCommon.bat`
*  remove old move of dll (unused)
`modules_bat/nghttp2.bat`
*  deps build without AVX
`phpsdk-local.bat`
*  remove GL from EXTCFLAGS
`xCommon.bat`
*  add brotli
`phpsdk-config_make-7.3.bat`
*  remove pause
`modules_bat/lua.bat`
`modules_bat/pcre.bat`
*  pcre : flags optimize + AVX contextuel
`modules_bat/pcre.bat`
`modules_bat/pcre.sh`
*  lua : flags optimize + AVX contextuel
`modules_bat/lua.bat`
`modules_bat/lua.sh`
*  libiconv & libxml2 : flag optimisation & AVX contextuel
`modules_bat/libiconv.bat`
`modules_bat/libxml2.bat`
*  libev : flag optim + AVX contextuel
`modules_bat/libev.bat`
`modules_bat/libev.sh`
*  correct flag sh path
`modules_bat/jemalloc.bat`
*  deprecated
`src-version.xlsx`
*  add $1 & $2
`vcxproj.sh`
*  vcxproj
`vcxproj.sh`
*  var AVX vcxproj
`modules_bat/apr.bat`
`modules_bat/jemalloc.bat`
`modules_bat/subversion-svn.bat`
`xCommon.bat`
*  rename subversion sh
`modules_bat/subversion-svn.sh`
*  jansson : flags optimize + AVX contextuel
`modules_bat/jansson.bat`
`modules_bat/jansson.sh`
*  curl bzip2 : flags optim + AVX contextuel
`modules_bat/bzip2.bat`
`modules_bat/curl.bat`
*  suppress warning
`modules_bat/c-ares.sh`
*  casse
`modules_bat/zlib.bat`
*  add AVX contextuel
`modules_bat/bzip2.bat`
*  zlib : optim flags + AVX contextuel
`modules_bat/zlib.bat`
`xCommon.bat`
*  c-ares : flags optim + avx contextuel
`modules_bat/c-ares.bat`
`modules_bat/c-ares.sh`
*  rmdir build at end of release
`phpsdk-config_make-7.1.bat`
`phpsdk-config_make-7.2.bat`
`phpsdk-config_make-7.3.bat`
*  copy deps after LIB & REQ
`phpsdk-local.bat`
*  serf : improve flags and add contextual AVX
`modules_bat/serf-svn.bat`
`modules_bat/serf-svn.sh`
*  improvbe flags & contextual AVX
`modules_bat/libexpat.bat`
`modules_bat/libexpat.sh`
*  add AVXSED
`xCommon.bat`
*  add compiler option & AVX contextual brotli
`modules_bat/brotli.bat`
`modules_bat/brotli.sh`
*  add compiler option and contextual AVX
`modules_bat/apr.bat`
*  sh refactor subversion
`modules_bat/subversion-svn.bat`
`modules_bat/subversion.sh`
*  refactor sh httpd
`modules_bat/httpd.bat`
`modules_bat/httpd.exe.manifest`
`modules_bat/httpd_flags.sh`
`modules_bat/httpd_flags_RelWithDebInfo.sh`
`modules_bat/httpd_flags_Release.sh`
*  relative path for deps & depsnono (include & lib) delete build folder at start better than at the end...
`phpsdk-config_make-7.1.bat`
`phpsdk-config_make-7.2.bat`
`phpsdk-config_make-7.3.bat`
*  add jpeg disable autodeps
`phpsdk-local.bat`
*  correct include copy (X11...)
`modules_bat/libxpm-php.bat`
*  initial
`modules_bat/libjpeg-php.bat`
*  supression espace
`modules_bat/bzip2.bat`
*  AVX
`xCommon.bat`
*  copy deps to github folder refactor lib build order for folder creation
`modules_bat/libpng-php.bat`
`phpsdk-local.bat`
`xCommon.bat`
*  mklink X11\xpm.h
`modules_bat/libxpm-php.bat`
*  disable deps copy github
`modules_bat/libxdiff-php.bat`
*  include\iconv.h
`modules_bat/libiconv-php.bat`
*  MSVC_VER => MSVC_DEPS
`modules_bat/httpd.bat`
*  unused
`modules_bat/boost.bat.unused`
*  MSVCDEPS
`phpsdk-config_make-7.1.bat`
`phpsdk-config_make-7.2.bat`
`phpsdk-config_make-7.3.bat`
*  MSVC_DEPS
`phpsdk-local.bat`
*  MSVC_DEPS factor
`MSVC_DEPS.bat`
`silent-php-build.bat`
`xCommon.bat`
*  update windows kit 17763 => 18362 replace toolkit 141 (vc15) => 142 (vs16)
`subversion_vcxproj.sh`
*  add msbuild path
`x64.bat`
`x86.bat`
*  set WKITVER 10.0.18362.0 set MSVC_DEPS according to MSVC_VER
`xCommon.bat`
*  msbuild in path remove all tests build
`modules_bat/subversion-svn.bat`
*  msbuild in path include h file @root
`modules_bat/libxpm-php.bat`
*  msbuild in path
`modules_bat/libpng-php.bat`
*  msbuild in path
`modules_bat/libmaxminddb.bat`
*  msbuild in path
`modules_bat/libiconv.bat`
*  msbuild in path
`modules_bat/libiconv-php.bat`
*  msbuild in path
`modules_bat/jemalloc.bat`
*  msbuild in path vc2017 => vc2019
`modules_bat/freetype-php.bat`
*  nmake VC=%MSVC_VER%
`modules_bat/curl.bat`
*  msbuild in path clean old REM
`modules_bat/apr.bat`
*  apr 1.7.0
`modules_bat/apr.bat`
*  sed -i 's/libeay32st/libcrypto/g' /cygdrive/c/src/php-src/ext/phar/config.w32 better than branch msvc15 7.2 & 7.1 : only memcached
`phpsdk-config_make-7.1.bat`
`phpsdk-config_make-7.2.bat`
`phpsdk-config_make-7.3.bat`
*  add SDKVER for 7.1 VC15 (sdk 7.2)
`phpsdk-local.bat`
*  use MSVC_VER
`modules_bat/apr.bat`
`modules_bat/curl.bat`
`modules_bat/freetype-php.bat`
`modules_bat/httpd.bat`
`modules_bat/jemalloc.bat`
`modules_bat/libiconv-php.bat`
`modules_bat/libiconv.bat`
`modules_bat/libmaxminddb.bat`
`modules_bat/libpng-php.bat`
`modules_bat/libxpm-php.bat`
`modules_bat/subversion-svn.bat`
`phpsdk-config_make-7.2.bat`
`phpsdk-config_make-7.3.bat`
`phpsdk-local.bat`
`silent-php-build.bat`
`xCommon.bat`
*  disable copy patched openssl for svn
`modules_bat/apr.bat`
*  add dll build
`modules_bat/freetype-php.bat`
`modules_bat/libxpm-php.bat`
*  option to build only deps
`phpsdk-local.bat`
*  don't copy apr-util patched openssl
`modules_bat/libssh2-php.bat`
`modules_bat/libssh2.bat`
*  copy dll to github deps directory
`modules_bat/libxdiff-php.bat`
*  revert apr compile & install split according to common patch for httpd & subversion
`httpd-build.bat`
`modules_bat/apr.bat`
`modules_bat/apr_compile.bat`
`modules_bat/subversion-svn.bat`
*  add avx on log filename
`silent-httpd-build.bat`
`silent-subversion-build.bat`
*  cut apr in compile & install for subversion pathed version build
`httpd-build.bat`
`modules_bat/apr_compile.bat`
`modules_bat/apr_install.bat`
*  build & copie patched apr_crypto_openssl-1.dll build all tests
`modules_bat/subversion-svn.bat`
*  add zlib & openssl support
`modules_bat/libssh2.bat`
*  module name incorrect
`phpsdk-local.bat`
*  php_xdiff
`modules_bat/libxdiff-php.bat`
`phpsdk-config_make-7.2.bat`
`phpsdk-config_make-7.3.bat`
`phpsdk-local.bat`
*  Windows Kit 17134 => 17763
`subversion_vcxproj.sh`
`xCommon.bat`
*  copy build to d: github directory
`modules_bat/subversion-svn.bat`
*  -DBUILD_MT_RELEASE=ON doesn't exist anymore in 3.26
`modules_bat/sqlite-svn.bat`
*  GSSAPI BROTLI not implemented
`modules_bat/serf-svn.bat`
*  fix jemalloc cyg version 32 / 64
`modules_bat/jemalloc.bat`
*  php 7.3
`phpsdk-local.bat`
*  disable static & asio
`modules_bat/nghttp2.bat`
*  dont copy deps to mod_md github
`modules_bat/httpd.bat`
*  add static lib build
`modules_bat/nghttp2.bat`
*  deps mode static|| dll in var
`modules_bat/boost.bat`
`modules_bat/curl.bat`
*  correct bug zlib dynamic
`modules_bat/openssl.bat`
*  variabilisation pour 7.2 & 7.3
`phpsdk-config_make-7.2.bat`
`phpsdk-config_make-7.3.bat`
`phpsdk-local.bat`
*  rename ssh2 => https &! php
`modules_bat/libssh2.bat`
*  copy mod_md in submodule httpd
`httpd-build.bat`
`modules_bat/httpd.bat`
*  reconfigure correctly for VC-WIN64A (avoid issue https://github.com/nono303/mod_md/issues/3)
`modules_bat/openssl.bat`
*  correct bug x64 => %ARCH%
`modules_bat/curl.bat`
*  copy mod_md
`httpd-build.bat`
*  VC-WIN64A-masm => souci nommage dll sans -x64 https://www.apachelounge.com/viewtopic.php?p=37593#37593 https://github.com/nono303/mod_md/issues/3
`x64.bat`
*  SEDAVX => enable-native-intrinsics correct bug x64 lib & include depsnono
`phpsdk-config_make.bat`
*  7.2 => 7.3
`phpsdk-local.bat`
*  parse_context doesn't exist anymore
`modules_bat/protobuf-php.bat`
*  %PHPDEPS% + copy include
`modules_bat/bzip2.bat`
`modules_bat/curl.bat`
`modules_bat/freetype-php.bat`
`modules_bat/libiconv-php.bat`
`modules_bat/libpng-php.bat`
`phpsdk-config_make.bat`
`phpsdk-local.bat`
`xCommon.bat`
*  %PHPDEPS%
`modules_bat/libxpm-php.bat`
*  %PHPDEPS%
`modules_bat/protobuf-php.bat`
*  force copy
`modules_bat/subversion-svn.bat`
*  CRLF
`modules_bat/libssh2-php.bat`
`modules_bat/tidy-php.bat`
*  clean output add tag ls-remote
`git-fetch.php`
*  echo on one build dir cleaned on common
`httpd-build.bat`
`xCommon.bat`
*  echo on one build dir cleaned on common
`xCommon.bat`
*  keep autogen for includes
`modules_bat/jemalloc.bat`
*  keep echo on
`silent-git-fetch.bat`
`silent-httpd-build.bat`
`silent-php-build.bat`
`silent-subversion-build.bat`
*  add copy git to memcache dll
`phpsdk-local.bat`
*  correct bugs for buildall
`phpsdk-config_make.bat`
`phpsdk-local.bat`
*  correct sed x86 / x64
`modules_bat/openssl.bat`
*  silent tee log
`silent-git-fetch.bat`
`silent-httpd-build.bat`
`silent-subversion-build.bat`
*  NMAKE_OPTS disable /B
`xCommon.bat`
*  change log path don't clean php72sdk
`git-fetch.php`
*  copy required include not in build
`modules_bat/protobuf-php.bat`
*  correct build dir for x86
`modules_bat/jemalloc.bat`
`silent-php-build.bat`
*  build all var + protobuf deps
`modules_bat/protobuf-php.bat`
`phpsdk-local.bat`
*  mysqlx api
`phpsdk-config_make.bat`
*  fetch before status & tag log
`git-fetch.php`
*  create bin lib include in c:\httpd-sdk\install\ (jemalloc bug)
`httpd-build.bat`
*  delete and don't move exp file
`modules_bat/jemalloc.bat`
*  remove pause for silent build
`modules_bat/subversion-svn.bat`
*  add sqlite (ommited)
`subversion-build.bat`
*  global NMAKE_OPTS
`modules_bat/brotli.bat`
`modules_bat/bzip2.bat`
`modules_bat/c-ares.bat`
`modules_bat/curl.bat`
`modules_bat/httpd.bat`
`modules_bat/jansson.bat`
`modules_bat/libev.bat`
`modules_bat/libevent.bat`
`modules_bat/libexpat.bat`
`modules_bat/libxml2.bat`
`modules_bat/lua.bat`
`modules_bat/nghttp2.bat`
`modules_bat/pcre.bat`
`modules_bat/serf-svn.bat`
`modules_bat/sqlite-svn.bat`
`modules_bat/zlib.bat`
`phpsdk-config_make.bat`
`xCommon.bat`
*  optimisation build: x64 masm & CFLAGS + LDFLAGS
`modules_bat/openssl.bat`
`x64.bat`
*  php => do_php
`silent-git-fetch.bat`
*  add c-ares & libev for nghttp2
`httpd-build.bat`
`modules_bat/c-ares.bat`
`modules_bat/libev.bat`
*  add extra performance CFLags & sed for LTCG
`modules_bat/nghttp2.bat`
*  add openssl src dir to extra include
`modules_bat/httpd.bat`
*  add php to path
`xCommon.bat`
*  active autogen (since git clean...)
`modules_bat/jemalloc.bat`
*  refactor svn & deps build
`modules_bat/serf-svn.bat`
`modules_bat/sqlite-svn.bat`
`modules_bat/subversion-svn.bat`
`subversion-build.bat`
*  bat2php
`git-fetch.bat`
`git-fetch.php`
*  ydmhis.bat
`silent-git-fetch.bat`
`silent-httpd-build.bat`
`silent-subversion-build.bat`
`ymdhis.bat`
*  httpd 2.4.36 mod_h2 1.11.3 php 7.2.11
`src-version.xlsx`
*  add avx build & install dir for httpd
`xCommon.bat`
*  subversion => module php => build all type for arch
`phpsdk-local.bat`
`subversion-build.bat`
*  mod_h2 1.11.1
`modules_bat/serf-svn.bat`
`modules_bat/sqlite-svn.bat`
`modules_bat/subversion-svn.bat`
`phpsdk-config_make.bat`
`src-version.xlsx`
*  zlib with ASM support https://stackoverflow.com/questions/29505121/cmake-zlib-build-on-windows
`modules_bat/zlib.bat`
`x64.bat`
`x86.bat`
*  nghhtp2 1.34 svn 1.10.3
`src-version.xlsx`
*  20180930
`src-version.xlsx`
*  outdir name for avx few enhancement
`phpsdk-local.bat`
*  openssl 1.1.1
`src-version.xlsx`
*  zlib on msvc15
`src-version.xlsx`
*  2018-09-11
`modules_bat/apr.bat`
`modules_bat/brotli.bat`
`modules_bat/bzip2.bat`
`modules_bat/curl.bat`
`modules_bat/freetype-php.bat`
`modules_bat/httpd.bat`
`modules_bat/jansson.bat`
`modules_bat/jemalloc.bat`
`modules_bat/libevent.bat`
`modules_bat/libexpat.bat`
`modules_bat/libiconv-php.bat`
`modules_bat/libiconv.bat`
`modules_bat/libmaxminddb.bat`
`modules_bat/libpng-php.bat`
`modules_bat/libxml2.bat`
`modules_bat/libxpm-php.bat`
`modules_bat/lua.bat`
`modules_bat/mod_h264_streaming.bat`
`modules_bat/nghttp2.bat`
`modules_bat/openssl.bat`
`modules_bat/pcre.bat`
`modules_bat/zlib.bat`
`src-version.xlsx`
`x64.bat`
`x86.bat`
`xCommon.bat`
*  Add README.md
*  update pcre git repo fix old stuff for jemalloc
`modules_bat/jemalloc.bat`
`src-version.xlsx`
*  few corrections: - xCommon full PATH - path in DOS8.3 - AVX bugfix
`x64.bat`
`x86.bat`
`xCommon.bat`
*  correct bug avx
`modules_bat/httpd.bat`
*  php builds deps => modules
`modules_bat/freetype-php.bat`
`modules_bat/libiconv-php.bat`
`modules_bat/libpng-php.bat`
`modules_bat/libxpm-php.bat`
`php_deps-build.bat`
`phpsdk-local.bat`
*  decoupage httpd-build en sous modules
`httpd-build.bat`
`modules_bat/apr.bat`
`modules_bat/brotli.bat`
`modules_bat/bzip2.bat`
`modules_bat/curl.bat`
`modules_bat/httpd.bat`
`modules_bat/jansson.bat`
`modules_bat/jemalloc.bat`
`modules_bat/libevent.bat`
`modules_bat/libexpat.bat`
`modules_bat/libiconv.bat`
`modules_bat/libmaxminddb.bat`
`modules_bat/libxml2.bat`
`modules_bat/lua.bat`
`modules_bat/mod_h264_streaming.bat`
`modules_bat/nghttp2.bat`
`modules_bat/openssl.bat`
`modules_bat/pcre.bat`
`modules_bat/zlib.bat`
*  add modules_bat
`xCommon.bat`
*  fact x86 & x64 commons to xCommon.bat ext AVX on xCommon (php & httpd)
`httpd-build.bat`
`phpsdk-local.bat`
`x64.bat`
`x86.bat`
`xCommon.bat`
*  php-sdk-2.1.8
`src-version.xlsx`
*  enable intl
`phpsdk-local.bat`
*  remove no-tests option for opensssl 1.1.0i (unsupported)
`httpd-build.bat`
`php_deps-build.bat`
*  php 7.2.9 openssl 1.1.0i memcached 1.5.10 libexpat 2.2.6
`src-version.xlsx`
*  mod_md 1.1.16
`src-version.xlsx`
*  move extracompile flags from sh to cmake opt add /arch:AVX for httpd xdebug 2.6.1
`httpd-build.bat`
`httpd_flags_RelWithDebInfo.sh`
`src-version.xlsx`
*  clean & fix for 1.10.2
`subversion-build.bat`
`subversion_vcxproj.sh`
*  0724
`src-version.xlsx`
*  set with default parameters
`php_deps-build.bat`
`phpsdk-local.bat`
*  add "C:\src\mod_wku_bt"
`git-fetch.bat`
*  externalize AVX
`phpsdk-local.bat`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2655 f19f5125-b473-6040-a4d2-80918b615817
`httpd-build.bat`
`php_deps-build.bat`
*  add freetype libpng libxpm change libiconv
`src-version.xlsx`
*  change python path order
`x64.bat`
`x86.bat`
*  add freetype libpng libxpm
`git-fetch.bat`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2650 f19f5125-b473-6040-a4d2-80918b615817
`php_deps-build.bat`
`phpsdk-local.bat`
*  correction bug libiconv path et arch
`httpd-build.bat`
*  silent LOGNAME var TS var LTCG
`phpsdk-local.bat`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2647 f19f5125-b473-6040-a4d2-80918b615817
`src-version.xlsx`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2629 f19f5125-b473-6040-a4d2-80918b615817
`src-version.xlsx`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2628 f19f5125-b473-6040-a4d2-80918b615817
`phpsdk-local.bat`
*  libiconv -MT => std
`httpd-build.bat`
*  curl 7.60
`src-version.xlsx`
*  libiconv 1.14 => 1.15
`src-version.xlsx`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2619 f19f5125-b473-6040-a4d2-80918b615817
`subversion_vcxproj.sh`
*  result to local insatll dir
`subversion-build.bat`
*  libiconv 1.14 => 1.15
`httpd-build.bat`
*  windows kit 10.0.16299.0 10.0.17134.0
`phpsdk-local.bat`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2558 f19f5125-b473-6040-a4d2-80918b615817
`git-fetch.bat`
*  refactor
`httpd-build.bat`
`phpsdk-local.bat`
`silent-build.bat`
`silent-git-fetch.bat`
`silent-httpd-build.bat`
`silent-subversion-build.bat`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2555 f19f5125-b473-6040-a4d2-80918b615817
`apr_vcx/apr.vcxproj`
`apr_vcx/apr_crypto_nss.vcxproj`
`apr_vcx/apr_crypto_openssl.vcxproj`
`apr_vcx/apr_dbd_mysql.vcxproj`
`apr_vcx/apr_dbd_odbc.vcxproj`
`apr_vcx/apr_dbd_oracle.vcxproj`
`apr_vcx/apr_dbd_pgsql.vcxproj`
`apr_vcx/apr_dbd_sqlite2.vcxproj`
`apr_vcx/apr_dbd_sqlite3.vcxproj`
`apr_vcx/apr_dbm_db.vcxproj`
`apr_vcx/apr_dbm_gdbm.vcxproj`
`apr_vcx/apr_ldap.vcxproj`
`apr_vcx/aprapp.vcxproj`
`apr_vcx/apriconv.vcxproj`
`apr_vcx/aprutil.vcxproj`
`apr_vcx/libapr.vcxproj`
`apr_vcx/libaprapp.vcxproj`
`apr_vcx/libapriconv.vcxproj`
`apr_vcx/libapriconv_ccs_modules.vcxproj`
`apr_vcx/libapriconv_ces_modules.vcxproj`
`apr_vcx/libaprutil.vcxproj`
`apr_vcx/preaprapp.vcxproj`
`apr_vcx/preapriconv.vcxproj`
`apr_vcx/preaprutil.vcxproj`
`apr_vcx/prelibaprapp.vcxproj`
`build.bat`
`git-fetch.bat`
`patch/apr-iconv.patch`
`patch/bzip2.patch`
`patch/httpd.patch`
`patch/jemalloc.patch`
`patch/libxml2.patch`
`patch/lua.patch`
`patch/mod_h264.patch`
`patch/mod_maxminddb.patch`
`patch/nghttp2.patch`
`patch/openssl.patch`
`silent-build.bat`
`src-version.xlsx`
`svn-build.bat`
`x64.bat`
`x86.bat`
*  x86 & x64 OK
`apr_vcx/apr_crypto_nss.vcxproj`
`apr_vcx/apr_crypto_openssl.vcxproj`
`apr_vcx/apr_dbd_mysql.vcxproj`
`apr_vcx/apr_dbd_odbc.vcxproj`
`apr_vcx/apr_dbd_oracle.vcxproj`
`apr_vcx/apr_dbd_pgsql.vcxproj`
`apr_vcx/apr_dbd_sqlite2.vcxproj`
`apr_vcx/apr_dbd_sqlite3.vcxproj`
`apr_vcx/apr_dbm_db.vcxproj`
`apr_vcx/apr_dbm_gdbm.vcxproj`
`apr_vcx/apr_ldap.vcxproj`
`apr_vcx/libapr.vcxproj`
`apr_vcx/libapriconv.vcxproj`
`apr_vcx/libaprutil.vcxproj`
*  x86 OK
`apr_vcx/apr.vcxproj`
`apr_vcx/apr_crypto_nss.vcxproj`
`apr_vcx/apr_crypto_openssl.vcxproj`
`apr_vcx/apr_dbd_mysql.vcxproj`
`apr_vcx/apr_dbd_odbc.vcxproj`
`apr_vcx/apr_dbd_oracle.vcxproj`
`apr_vcx/apr_dbd_pgsql.vcxproj`
`apr_vcx/apr_dbd_sqlite2.vcxproj`
`apr_vcx/apr_dbd_sqlite3.vcxproj`
`apr_vcx/apr_dbm_db.vcxproj`
`apr_vcx/apr_dbm_gdbm.vcxproj`
`apr_vcx/apr_ldap.vcxproj`
`apr_vcx/aprapp.vcxproj`
`apr_vcx/apriconv.vcxproj`
`apr_vcx/aprutil.vcxproj`
`apr_vcx/libapr.vcxproj`
`apr_vcx/libaprapp.vcxproj`
`apr_vcx/libapriconv.vcxproj`
`apr_vcx/libaprutil.vcxproj`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2529 f19f5125-b473-6040-a4d2-80918b615817
`apr_vcx/apr.vcxproj`
`apr_vcx/aprapp.vcxproj`
`apr_vcx/libapr.vcxproj`
`apr_vcx/libaprapp.vcxproj`
`apr_vcx/preaprapp.vcxproj`
`apr_vcx/prelibaprapp.vcxproj`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2528 f19f5125-b473-6040-a4d2-80918b615817
`apr_vcx/apriconv.vcxproj`
`apr_vcx/libapriconv.vcxproj`
`apr_vcx/libapriconv_ccs_modules.vcxproj`
`apr_vcx/libapriconv_ces_modules.vcxproj`
`apr_vcx/preapriconv.vcxproj`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2527 f19f5125-b473-6040-a4d2-80918b615817
`apr_vcx/apr_crypto_nss.vcxproj`
`apr_vcx/apr_crypto_openssl.vcxproj`
`apr_vcx/apr_dbd_mysql.vcxproj`
`apr_vcx/apr_dbd_odbc.vcxproj`
`apr_vcx/apr_dbd_oracle.vcxproj`
`apr_vcx/apr_dbd_pgsql.vcxproj`
`apr_vcx/apr_dbd_sqlite2.vcxproj`
`apr_vcx/apr_dbd_sqlite3.vcxproj`
`apr_vcx/apr_dbm_db.vcxproj`
`apr_vcx/apr_dbm_gdbm.vcxproj`
`apr_vcx/apr_ldap.vcxproj`
`apr_vcx/aprutil.vcxproj`
`apr_vcx/libaprutil.vcxproj`
`apr_vcx/preaprutil.vcxproj`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2522 f19f5125-b473-6040-a4d2-80918b615817
`git-fetch.bat`
`svn-build.bat`
*  add subversion build
`git-fetch.bat`
`subversion_vcxproj.sh`
`svn-build.bat`
`x64.bat`
`x86.bat`
*  openssl 1.1.0h
`patch/openssl.patch`
*  add maxming & subversion
`git-fetch.bat`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2485 f19f5125-b473-6040-a4d2-80918b615817
`build.bat`
`httpd_flags.sh`
`httpd_flags_RelWithDebInfo.sh`
`httpd_flags_Release.sh`
`patch/apr-iconv.patch`
`patch/httpd.patch`
`patch/libxml2.patch`
`patch/mod_maxminddb.patch`
`tmp.bat`
*  patch myopen for utf-8
`patch/mod_h264.patch`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2475 f19f5125-b473-6040-a4d2-80918b615817
`build.bat`
`fixBaseAddrs.pl`
`patch/httpd.patch`
`patch/mod_h264.patch`
`tmp.bat`
*  refactor
`build.bat`
`git-fetch.2018-02-19-15-36-13.log`
`git-fetch.bat`
`patch/apr-iconv.patch`
`patch/bzip2.patch`
`patch/httpd.patch`
`patch/jemalloc.patch`
`patch/libxml2.patch`
`patch/lua.patch`
`patch/nghttp2.patch`
`patch/openssl.patch`
`tmp.bat`
`version.csv`
*  remove link /base (32bits)
`2.4.x-mod_md.patch/apr-iconv.patch`
*  add git to path
`x64.bat`
`x86.bat`
*  apr refactor cmakefile => sln
`build.bat`
*  diff with git --diff
`2.4.x-mod_md.patch/bzip2.patch`
`2.4.x-mod_md.patch/httpd.ApacheMonitor.rc.patch`
`2.4.x-mod_md.patch/httpd.main.c.patch`
`2.4.x-mod_md.patch/httpd.mod_proxy_fcgi.c.patch`
`2.4.x-mod_md.patch/httpd.patch`
`2.4.x-mod_md.patch/httpd.ssl_engine_init.c.patch`
`2.4.x-mod_md.patch/jemalloc.patch`
`2.4.x-mod_md.patch/libxml2.patch`
`2.4.x-mod_md.patch/lua.patch`
`2.4.x-mod_md.patch/nghttp2.patch`
`2.4.x-mod_md.patch/openssl.patch`
*  2.4.30
`2.4.x-mod_md.patch/httpd.ApacheMonitor.rc.patch`
`2.4.x-mod_md.patch/httpd.CMakelists.txt.patch`
`2.4.x-mod_md.patch/httpd.main.c.patch`
`2.4.x-mod_md.patch/httpd.mod_proxy_fcgi.c.patch`
`git-fetch.2018-02-19-15-36-13.log`
`git-fetch.bat`
`silent-git-fetch.bat`
`version.csv`
*  curl with winssl
`build.bat`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2329 f19f5125-b473-6040-a4d2-80918b615817
`2.4.x-mod_md.patch/bzip2-1.0.6.makefile.msc.patch`
`2.4.x-mod_md.patch/httpd.ApacheMonitor.rc.patch`
`2.4.x-mod_md.patch/httpd.CMakelists.txt.patch`
`2.4.x-mod_md.patch/httpd.main.c.patch`
`2.4.x-mod_md.patch/jemalloc-cmake.msvc.projects.patch`
`2.4.x-mod_md.patch/libxml2.win32_Makefile.msvc.patch`
`2.4.x-mod_md.patch/lua.CMakeLists.txt`
`2.4.x-mod_md.patch/nghttp2.FindLibevent.cmake.patch`
`2.4.x-mod_md.patch/openssl.windows-makefile.tmpl.patch`
`build.bat`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2328 f19f5125-b473-6040-a4d2-80918b615817
`2.4.x-mod_md.patch/bzip2-1.0.6.makefile.msc.patch`
`2.4.x-mod_md.patch/libxml2.win32_Makefile.msvc.patch`
`build.bat`
`build_silent.bat`
`git-fetch.bat`
`silent-build.bat`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2327 f19f5125-b473-6040-a4d2-80918b615817
`2.4.x-mod_md.patch/mod_proxy_fcgi.c.patch`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2314 f19f5125-b473-6040-a4d2-80918b615817
`CMakelists.txt.patch`
`build.bat`
`httpd_flags.sh`
`main.c.patch`
`x64.bat`
`x86.bat`
*  20180109
`git-fetch.bat`
`version.csv`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2304 f19f5125-b473-6040-a4d2-80918b615817
`build.bat`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2284 f19f5125-b473-6040-a4d2-80918b615817
`2.4.x-mod_md.patch/httpd.ApacheMonitor.rc.patch`
`2.4.x-mod_md.patch/httpd.CMakelists.txt.patch`
`2.4.x-mod_md.patch/httpd.main.c.patch`
`2.4.x-mod_md.patch/httpd.ssl_engine_init.c.patch`
`2.4.x-mod_md.patch/nghttp2.FindLibevent.cmake.patch`
`2.4.x-mod_md.patch/openssl.windows-makefile.tmpl.patch`
`build.bat`
`build_silent.bat`
`httpd_flags_RelWithDebInfo.sh`
`httpd_flags_Release.sh`
`version.csv`
`x64.bat`
`x86.bat`
*  mod_md 1.1.8 + httpd-md
`2.4.x-mod_md.patch/CMakelists.txt.patch`
`2.4.x-mod_md.patch/main.c.patch`
`build.bat`
`version.csv`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2246 f19f5125-b473-6040-a4d2-80918b615817
`2.4.x-mod_md.patch/ApacheMonitor.rc.patch`
`2.4.x-mod_md.patch/CMakelists.txt.patch`
`2.4.x-mod_md.patch/main.c.patch`
`build.bat`
`fixBaseAddrs.pl`
*  factorisation commandes x86 & x64
`x64.bat`
`x86.bat`
*  git-svn-id: https://svn.nono303.net/build/msvc/httpd@2220 f19f5125-b473-6040-a4d2-80918b615817
*  initial
`CMakelists.txt.patch`
`build.bat`
`httpd.exe.manifest`
`httpd_flags.sh`
`main.c.patch`
`version.csv`
`x64.bat`
`x86.bat`




