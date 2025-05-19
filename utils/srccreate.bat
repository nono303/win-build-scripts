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
git clone https://aomedia.googlesource.com/aom aom
cd /D aom
git checkout tags/v3.12.1-rc1
cd /D ..
git clone https://github.com/apache/apr.git apr
cd /D apr
git checkout 1.8.x
cd /D ..
git clone https://github.com/apache/apr-util.git apr-util
cd /D apr-util
git checkout 1.7.x
cd /D ..
git clone https://github.com/google/brotli.git brotli
cd /D brotli
git checkout tags/v1.1.0
cd /D ..
git clone https://gitlab.com/bzip2/bzip2.git bzip2
cd /D bzip2
git checkout master
cd /D ..
git clone https://github.com/c-ares/c-ares.git cares
cd /D cares
git checkout tags/v1.34.5
cd /D ..
git clone https://github.com/curl/curl.git curl
cd /D curl
git checkout tags/rc-8_14_0-2
cd /D ..
git clone https://code.videolan.org/videolan/dav1d.git dav1d
cd /D dav1d
git checkout tags/1.5.1
cd /D ..
git clone https://github.com/himeshsameera/Dependencies dependencies
cd /D dependencies
git checkout master
cd /D ..
git clone https://github.com/nono303/fit2gpx.git fit2gpx
cd /D fit2gpx
git checkout master
cd /D ..
git clone https://github.com/dcnieho/FreeGLUT.git freeglut
cd /D freeglut
git checkout tags/v3.6.0
cd /D ..
git clone git://git.sv.nongnu.org/freetype/freetype2.git freetype2
cd /D freetype2
git checkout tags/VER-2-13-3
cd /D ..
git clone https://github.com/OSGeo/gdal gdal
cd /D gdal
git checkout tags/v3.11.0RC2
cd /D ..
git clone https://github.com/geographiclib/geographiclib.git geographiclib
cd /D geographiclib
git checkout tags/r2.5
cd /D ..
git clone https://github.com/libgeos/geos geos
cd /D geos
git checkout tags/3.13.1
cd /D ..
git clone https://github.com/gongjianbo/GifLib giflib
cd /D giflib
git checkout master
cd /D ..
git clone https://github.com/apache/httpd.git httpd
cd /D httpd
git checkout tags/2.4.63
cd /D ..
git clone https://github.com/unicode-org/icu.git icu
cd /D icu
git checkout icu4x/2025-05-01/77.x
cd /D ..
git clone https://github.com/akheron/jansson.git jansson
cd /D jansson
git checkout tags/v2.14.1
cd /D ..
git clone https://github.com/jemalloc/jemalloc.git jemalloc
cd /D jemalloc
git checkout tags/5.3.0
cd /D ..
git clone https://github.com/Esri/lerc.git lerc
cd /D lerc
git checkout tags/js_v4.0.4
cd /D ..
git clone https://github.com/AOMediaCodec/libavif.git libavif
cd /D libavif
git checkout tags/v1.3.0
cd /D ..
git clone https://github.com/hyperrealm/libconfig.git libconfig
cd /D libconfig
git checkout tags/v1.8
cd /D ..
git clone https://github.com/ebiggers/libdeflate.git libdeflate
cd /D libdeflate
git checkout tags/v1.24
cd /D ..
git clone https://git.lighttpd.net/mirrors/libev.git libev
cd /D libev
git checkout master
cd /D ..
git clone https://github.com/libevent/libevent.git libevent
cd /D libevent
git checkout tags/release-2.2.1-alpha
cd /D ..
git clone https://github.com/libexpat/libexpat.git libexpat
cd /D libexpat
git checkout tags/R_2_7_1
cd /D ..
git clone https://chromium.googlesource.com/codecs/libgav1 libgav1
cd /D libgav1
git checkout tags/v0.20.0
cd /D ..
git clone https://github.com/libgd/libgd.git libgd
cd /D libgd
git checkout master
cd /D ..
git clone https://github.com/nono303/libgeotiff.git libgeotiff
cd /D libgeotiff
git checkout master
cd /D ..
git clone https://github.com/strukturag/libheif.git libheif
cd /D libheif
git checkout tags/v1.19.8
cd /D ..
git clone https://github.com/AiMiDi/libiconv_cmake.git libiconv
cd /D libiconv
git checkout master
cd /D ..
git clone https://github.com/AiMiDi/libiconv.git libiconv\libiconv
cd /D libiconv\libiconv
git checkout fix-C2016
cd /D ..
git clone https://github.com/libjpeg-turbo/libjpeg-turbo libjpeg-turbo
cd /D libjpeg-turbo
git checkout tags/3.1.0
cd /D ..
git clone https://git.tukaani.org/xz.git liblzma
cd /D liblzma
git checkout tags/v5.8.1
cd /D ..
git clone https://github.com/maxmind/libmaxminddb.git libmaxminddb
cd /D libmaxminddb
git checkout tags/1.12.2
cd /D ..
git clone git://git.code.sf.net/p/libpng/code libpng
cd /D libpng
git checkout tags/v1.6.48
cd /D ..
git clone https://github.com/jedisct1/libsodium.git libsodium
cd /D libsodium
git checkout master
cd /D ..
git clone https://github.com/libssh2/libssh2.git libssh2
cd /D libssh2
git checkout tags/libssh2-1.11.1
cd /D ..
git clone https://gitlab.com/libtiff/libtiff.git/ libtiff
cd /D libtiff
git checkout tags/v4.7.0rc2
cd /D ..
git clone https://chromium.googlesource.com/webm/libwebp libwebp
cd /D libwebp
git checkout tags/v1.5.0
cd /D ..
git clone https://github.com/opencor/libxdiff libxdiff
cd /D libxdiff
git checkout tags/v0.23
cd /D ..
git clone https://gitlab.gnome.org/GNOME/libxml2.git libxml2
cd /D libxml2
git checkout tags/v2.14.3
cd /D ..
git clone https://github.com/nono303/libxpm.git libxpm
cd /D libxpm
git checkout master
cd /D ..
git clone https://gitlab.gnome.org/GNOME/libxslt.git/ libxslt
cd /D libxslt
git checkout tags/v1.1.43
cd /D ..
git clone https://chromium.googlesource.com/libyuv/libyuv libyuv
cd /D libyuv
git checkout main
cd /D ..
git clone https://github.com/nih-at/libzip libzip
cd /D libzip
git checkout tags/v1.11.3
cd /D ..
git clone https://github.com/lua/lua lua
cd /D lua
git checkout tags/v5.4.7
cd /D ..
git clone https://github.com/nono303/mapsforgesrv.git mapsforgesrv
cd /D mapsforgesrv
git checkout tasks
cd /D ..
git clone https://github.com/memcached/memcached memcached
cd /D memcached
git checkout tags/1.6.38
cd /D ..
svn co https://svn.code.sf.net/p/mobac/code/trunk/MOBAC mobac
cd /D mobac
svn update -r 2792
cd /D ..
git clone https://github.com/JBlond/mod_bikeshed.git mod_bikeshed
cd /D mod_bikeshed
git checkout tags/1.0.0
cd /D ..
git clone https://github.com/jvdmr/mod_evasive mod_evasive
cd /D mod_evasive
git checkout tags/2.4.0
cd /D ..
git clone https://github.com/nono303/mod_fcgid.git mod_fcgid
cd /D mod_fcgid
git checkout master
cd /D ..
git clone https://github.com/icing/mod_h2.git mod_h2
cd /D mod_h2
git checkout tags/v2.0.31
cd /D ..
git clone https://github.com/traceypooh/mod_h264_streaming--intra-keyframes.git mod_h264_streaming
cd /D mod_h264_streaming
git checkout master
cd /D ..
git clone https://github.com/maxmind/mod_maxminddb.git mod_maxminddb
cd /D mod_maxminddb
git checkout main
cd /D ..
git clone https://github.com/icing/mod_md mod_md
cd /D mod_md
git checkout tags/v2.5.2
cd /D ..
svn co https://svn.code.sf.net/p/mod-qos/source/trunk/httpd_src/modules/qos mod_qos
cd /D mod_qos
svn update -r 2730
cd /D ..
git clone https://github.com/SpiderLabs/ModSecurity mod_security
cd /D mod_security
git checkout tags/v2.9.8
cd /D ..
git clone https://github.com/nono303/modsec-sdbm-util mod_security-sdbm-util
cd /D mod_security-sdbm-util
git checkout tags/1.1.0
cd /D ..
git clone https://github.com/nono303/mod_whatkilledus mod_wku_bt
cd /D mod_wku_bt
git checkout tags/2.0.2
cd /D ..
git clone https://github.com/nono303/mod_zstd.git mod_zstd
cd /D mod_zstd
git checkout main
cd /D ..
git clone https://github.com/nono303/mpir.git mpir
cd /D mpir
git checkout master
cd /D ..
git clone https://github.com/nghttp2/nghttp2.git nghttp2
cd /D nghttp2
git checkout tags/v1.65.0
cd /D ..
git clone https://github.com/ngtcp2/nghttp3.git nghttp3
cd /D nghttp3
git checkout tags/v1.9.0
cd /D ..
git clone https://github.com/ngtcp2/ngtcp2.git ngtcp2
cd /D ngtcp2
git checkout tags/v1.12.0
cd /D ..
git clone https://github.com/puppetlabs/nssm.git nssm
cd /D nssm
git checkout master
cd /D ..
git clone https://github.com/openssl/openssl openssl
cd /D openssl
git checkout tags/openssl-3.5.0
cd /D ..
git clone https://github.com/PCRE2Project/pcre2.git pcre2
cd /D pcre2
git checkout master
cd /D ..
git clone https://github.com/php/pecl-datetime-timezonedb.git pecl-datetime-timezonedb
cd /D pecl-datetime-timezonedb
git checkout tags/2025.2
cd /D ..
git clone https://github.com/igbinary/igbinary pecl-igbinary
cd /D pecl-igbinary
git checkout master
cd /D ..
git clone https://github.com/websupport-sk/pecl-memcache.git pecl-memcache
cd /D pecl-memcache
git checkout main
cd /D ..
git clone https://github.com/krakjoe/parallel.git pecl-parallel
cd /D pecl-parallel
git checkout tags/v1.2.6
cd /D ..
git clone https://github.com/php/pecl-system-sync pecl-system-sync
cd /D pecl-system-sync
git checkout master
cd /D ..
git clone https://github.com/php/pecl-text-xdiff pecl-text-xdiff
cd /D pecl-text-xdiff
git checkout tags/2.1.1
cd /D ..
git clone https://github.com/kjdev/php-ext-brotli.git php-ext-brotli
cd /D php-ext-brotli
git checkout tags/0.17.0
cd /D ..
git clone https://github.com/kjdev/php-ext-zstd.git php-ext-zstd
cd /D php-ext-zstd
git checkout tags/0.14.0+pie
cd /D ..
git clone https://github.com/nono303/php-geos.git php-geos
cd /D php-geos
git checkout master
cd /D ..
git clone https://github.com/nono303/php-ogr php-ogr
cd /D php-ogr
git checkout master
cd /D ..
git clone https://github.com/swen100/phpng-proj.git php-proj
cd /D php-proj
git checkout tags/v3.0.3
cd /D ..
git clone https://github.com/php/php-sdk-binary-tools.git php-sdk
cd /D php-sdk
git checkout master
cd /D ..
git clone https://github.com/php/php-src.git php-src
cd /D php-src
git checkout tags/php-8.4.7
cd /D ..
git clone https://github.com/OSGeo/PROJ.git proj
cd /D proj
git checkout tags/9.6.0
cd /D ..
git clone https://github.com/proxytunnel/proxytunnel.git proxytunnel
cd /D proxytunnel
git checkout tags/v1.12.3
cd /D ..
git clone https://github.com/jwinarske/pthreads4w.git pthreads4w
cd /D pthreads4w
git checkout cmake
cd /D ..
git clone https://github.com/qhull/qhull qhull
cd /D qhull
git checkout tags/v8.1.alpha4
cd /D ..
git clone https://github.com/nono303/simpleDLNA.git sdlna
cd /D sdlna
git checkout master
cd /D ..
git clone https://github.com/apache/serf.git serf
cd /D serf
git checkout trunk
cd /D ..
git clone https://github.com/rhuijben/sqlite-amalgamation sqlite
cd /D sqlite
git checkout tags/3.49.2
cd /D ..
git clone https://github.com/yrutschle/sslh.git sslh
cd /D sslh
git checkout tags/v2.2.3
cd /D ..
git clone https://github.com/apache/subversion.git subversion
cd /D subversion
git checkout tags/1.14.5
cd /D ..
git clone https://github.com/htacg/tidy-html5 tidy
cd /D tidy
git checkout next
cd /D ..
git clone https://github.com/nono303/tzdataservice.git tzdataservice
cd /D tzdataservice
git checkout master
cd /D ..
git clone https://github.com/pavel-a/ddverpatch verpatch
cd /D verpatch
git checkout master
cd /D ..
git clone https://github.com/ptosco/wineditline wineditline
cd /D wineditline
git checkout tags/wineditline-2.208
cd /D ..
git clone https://github.com/xdebug/xdebug.git xdebug
cd /D xdebug
git checkout tags/3.4.3
cd /D ..
git clone https://github.com/lloyd/yajl.git yajl
cd /D yajl
git checkout master
cd /D ..
git clone https://github.com/madler/zlib.git zlib
cd /D zlib
git checkout tags/v1.3.1
cd /D ..
git clone https://github.com/facebook/zstd.git zstd
cd /D zstd
git checkout tags/v1.5.7
cd /D ..
