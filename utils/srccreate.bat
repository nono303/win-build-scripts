@echo off
echo ***********************
echo * All src will be checkouted into dir "%PATH_SRC%" (see PATH_SRC in env.bat)
echo ***********************
:PROMPT
SET /P AREYOUSURE=Do you want to continue? (Y/[N])
IF /I "%AREYOUSURE%" NEQ "Y" exit /B
echo on
if not exist %PATH_SRC%\. mkdir %PATH_SRC%
cd /D %PATH_SRC%
git clone https://github.com/abseil/abseil-cpp.git abseil-cpp
cd /D abseil-cpp
git checkout tags/20211102.0
cd /D ..
git clone https://aomedia.googlesource.com/aom aom
cd /D aom
git checkout tags/v3.3.0-rc2
cd /D ..
git clone https://github.com/apache/apr.git apr
cd /D apr
git checkout 1.7.x
cd /D ..
git clone https://github.com/apache/apr-iconv apr-iconv
cd /D apr-iconv
git checkout tags/1.2.2
cd /D ..
git clone https://github.com/apache/apr-util.git apr-util
cd /D apr-util
git checkout 1.7.x
cd /D ..
git clone https://github.com/google/brotli.git brotli
cd /D brotli
git checkout tags/v1.0.9
cd /D ..
git clone https://gitlab.com/bzip2/bzip2.git bzip2
cd /D bzip2
git checkout master
cd /D ..
git clone https://github.com/c-ares/c-ares.git cares
cd /D cares
git checkout tags/cares-1_18_1
cd /D ..
git clone https://github.com/curl/curl.git curl
cd /D curl
git checkout tags/curl-7_82_0
cd /D ..
git clone https://code.videolan.org/videolan/dav1d.git dav1d
cd /D dav1d
git checkout tags/1.0.0
cd /D ..
git clone https://github.com/lucasg/Dependencies.git dependencies
cd /D dependencies
git checkout tags/v1.11.1
cd /D ..
git clone https://github.com/dcnieho/FreeGLUT.git freeglut
cd /D freeglut
git checkout tags/FG_3_2_2
cd /D ..
git clone git://git.sv.nongnu.org/freetype/freetype2.git freetype2
cd /D freetype2
git checkout tags/VER-2-12-0
cd /D ..
git clone https://git.code.sf.net/p/geographiclib/code geographiclib
cd /D geographiclib
git checkout tags/v1.52
cd /D ..
git clone https://github.com/libgeos/geos geos
cd /D geos
git checkout tags/3.10.2
cd /D ..
git clone https://github.com/gongjianbo/GifLib giflib
cd /D giflib
git checkout master
cd /D ..
git clone https://github.com/apache/httpd.git httpd
cd /D httpd
git checkout tags/2.4.53
cd /D ..
git clone https://github.com/unicode-org/icu.git icu
cd /D icu
git checkout cldr/2022-03-31
cd /D ..
git clone https://github.com/akheron/jansson.git jansson
cd /D jansson
git checkout tags/v2.14
cd /D ..
git clone https://github.com/jemalloc/jemalloc.git jemalloc
cd /D jemalloc
git checkout tags/5.2.1
cd /D ..
git clone https://github.com/Esri/lerc.git lerc
cd /D lerc
git checkout tags/v3.0
cd /D ..
git clone https://github.com/AOMediaCodec/libavif.git libavif
cd /D libavif
git checkout tags/v0.9.3
cd /D ..
git clone https://github.com/ebiggers/libdeflate.git libdeflate
cd /D libdeflate
git checkout tags/v1.10
cd /D ..
git clone https://git.lighttpd.net/libev.git libev
cd /D libev
git checkout tags/rel-4.33
cd /D ..
git clone https://github.com/libevent/libevent.git libevent
cd /D libevent
git checkout tags/release-2.1.12-stable
cd /D ..
git clone https://github.com/libexpat/libexpat.git libexpat
cd /D libexpat
git checkout tags/R_2_4_8
cd /D ..
git clone https://github.com/nono303/libffi.git libffi
cd /D libffi
git checkout tags/msvc-3.4.2
cd /D ..
git clone https://chromium.googlesource.com/codecs/libgav1 libgav1
cd /D libgav1
git checkout tags/v0.17.0
cd /D ..
git clone https://github.com/winlibs/libiconv libiconv
cd /D libiconv
git checkout tags/libiconv-1.16-1
cd /D ..
git clone https://github.com/libjpeg-turbo/libjpeg-turbo libjpeg-turbo
cd /D libjpeg-turbo
git checkout tags/2.1.3
cd /D ..
git clone https://git.tukaani.org/xz.git liblzma
cd /D liblzma
git checkout tags/v5.3.2alpha
cd /D ..
git clone https://github.com/maxmind/libmaxminddb.git libmaxminddb
cd /D libmaxminddb
git checkout tags/1.6.0
cd /D ..
git clone git://git.code.sf.net/p/libpng/code libpng
cd /D libpng
git checkout tags/v1.6.37
cd /D ..
git clone https://github.com/jedisct1/libsodium.git libsodium
cd /D libsodium
git checkout tags/1.0.18
cd /D ..
git clone https://github.com/libssh2/libssh2.git libssh2
cd /D libssh2
git checkout tags/libssh2-1.10.0
cd /D ..
git clone https://gitlab.com/libtiff/libtiff libtiff
cd /D libtiff
git checkout tags/v4.3.0rc1
cd /D ..
git clone https://chromium.googlesource.com/webm/libwebp libwebp
cd /D libwebp
git checkout tags/v1.2.2
cd /D ..
git clone https://github.com/opencor/libxdiff libxdiff
cd /D libxdiff
git checkout tags/v0.23
cd /D ..
git clone https://gitlab.gnome.org/GNOME/libxml2.git libxml2
cd /D libxml2
git checkout tags/v2.9.13
cd /D ..
git clone https://github.com/nono303/libxpm.git libxpm
cd /D libxpm
git checkout tags/libxpm-3.5.13
cd /D ..
git clone https://gitlab.gnome.org/GNOME/libxslt libxslt
cd /D libxslt
git checkout tags/v1.1.35
cd /D ..
git clone https://chromium.googlesource.com/libyuv/libyuv libyuv
cd /D libyuv
git checkout main
cd /D ..
git clone https://github.com/nih-at/libzip libzip
cd /D libzip
git checkout tags/v1.8.0
cd /D ..
git clone https://github.com/lua/lua lua
cd /D lua
git checkout tags/v5.4.4
cd /D ..
git clone https://github.com/nono303/mapsforgesrv.git mapsforgesrv
cd /D mapsforgesrv
git checkout master
cd /D ..
git clone https://github.com/memcached/memcached memcached
cd /D memcached
git checkout tags/1.6.15
cd /D ..
svn co https://svn.code.sf.net/p/mobac/code/trunk/MOBAC mobac
cd /D mobac
svn update -r 2664
cd /D ..
git clone https://github.com/JBlond/mod_bikeshed.git mod_bikeshed
cd /D mod_bikeshed
git checkout tags/1.0.0
cd /D ..
git clone https://github.com/nono303/mod_fcgid.git mod_fcgid
cd /D mod_fcgid
git checkout tags/2.3.10.1
cd /D ..
git clone https://github.com/icing/mod_h2.git mod_h2
cd /D mod_h2
git checkout tags/v2.0.2
cd /D ..
git clone https://github.com/traceypooh/mod_h264_streaming--intra-keyframes.git mod_h264_streaming
cd /D mod_h264_streaming
git checkout master
cd /D ..
git clone https://github.com/maxmind/mod_maxminddb.git mod_maxminddb
cd /D mod_maxminddb
git checkout tags/1.2.0
cd /D ..
git clone https://github.com/icing/mod_md mod_md
cd /D mod_md
git checkout tags/v2.4.11
cd /D ..
svn co https://svn.code.sf.net/p/mod-qos/source/trunk/httpd_src/modules/qos mod_qos
cd /D mod_qos
svn update -r 2648
cd /D ..
git clone https://github.com/nono303/mod_whatkilledus mod_wku_bt
cd /D mod_wku_bt
git checkout tags/2.0.2
cd /D ..
git clone https://github.com/nono303/mpir.git mpir
cd /D mpir
git checkout master
cd /D ..
git clone https://github.com/nghttp2/nghttp2.git nghttp2
cd /D nghttp2
git checkout tags/v1.47.0
cd /D ..
git clone https://github.com/ngtcp2/nghttp3.git nghttp3
cd /D nghttp3
git checkout tags/v0.3.0
cd /D ..
git clone https://github.com/ngtcp2/ngtcp2.git ngtcp2
cd /D ngtcp2
git checkout tags/v0.3.0
cd /D ..
git clone https://github.com/puppetlabs/nssm.git nssm
cd /D nssm
git checkout master
cd /D ..
git clone https://github.com/openssl/openssl openssl
cd /D openssl
git checkout tags/openssl-3.0.2
cd /D ..
git clone https://github.com/quictls/openssl openssl-quic
cd /D openssl-quic
git checkout openssl-3.0.2+quic
cd /D ..
git clone https://github.com/jwilk-mirrors/pcre.git pcre
cd /D pcre
git checkout tags/pcre-8.45
cd /D ..
git clone https://github.com/PhilipHazel/pcre2.git pcre2
cd /D pcre2
git checkout tags/pcre2-10.39
cd /D ..
git clone https://github.com/websupport-sk/pecl-memcache.git pecl-memcache
cd /D pecl-memcache
git checkout NON_BLOCKING_IO_php8
cd /D ..
git clone https://github.com/php/pecl-text-xdiff pecl-text-xdiff
cd /D pecl-text-xdiff
git checkout main
cd /D ..
git clone https://github.com/deemru/php-cgi-spawner.git php-cgi-spawner
cd /D php-cgi-spawner
git checkout master
cd /D ..
git clone https://github.com/kjdev/php-ext-brotli.git php-ext-brotli
cd /D php-ext-brotli
git checkout tags/0.13.1
cd /D ..
git clone https://github.com/kjdev/php-ext-zstd.git php-ext-zstd
cd /D php-ext-zstd
git checkout tags/0.11.0
cd /D ..
git clone https://github.com/ModelTech/php-geos php-geos
cd /D php-geos
git checkout master
cd /D ..
git clone https://github.com/php/php-sdk-binary-tools.git php-sdk
cd /D php-sdk
git checkout master
cd /D ..
git clone https://github.com/php/php-src.git php-src
cd /D php-src
git checkout tags/php-8.1.4
cd /D ..
git clone https://github.com/OSGeo/PROJ.git proj
cd /D proj
git checkout tags/9.0.0
cd /D ..
git clone https://github.com/nono303/simpleDLNA.git sdlna
cd /D sdlna
git checkout tags/v1.0.3
cd /D ..
git clone https://github.com/apache/serf.git serf
cd /D serf
git checkout trunk
cd /D ..
git clone https://github.com/azadkuh/sqlite-amalgamation sqlite
cd /D sqlite
git checkout tags/3.38.2
cd /D ..
git clone https://github.com/apache/subversion.git subversion
cd /D subversion
git checkout tags/1.14.2
cd /D ..
git clone https://github.com/htacg/tidy-html5 tidy
cd /D tidy
git checkout tags/5.9.14-next
cd /D ..
git clone https://github.com/pavel-a/ddverpatch verpatch
cd /D verpatch
git checkout master
cd /D ..
svn co https://svn.code.sf.net/p/mingweditline/code/mingweditline/trunk wineditline
cd /D wineditline
svn update -r 36
cd /D ..
git clone https://github.com/xdebug/xdebug.git xdebug
cd /D xdebug
git checkout tags/3.1.4
cd /D ..
git clone https://github.com/madler/zlib.git zlib
cd /D zlib
git checkout tags/v1.2.12
cd /D ..
git clone https://github.com/facebook/zstd.git zstd
cd /D zstd
git checkout tags/v1.5.2
cd /D ..
