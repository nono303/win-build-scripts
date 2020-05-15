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
git clone https://github.com/apache/apr.git apr
cd /D apr
git checkout tags/1.7.0
cd /D ..
git clone https://github.com/apache/apr-iconv apr-iconv
cd /D apr-iconv
git checkout tags/1.2.2
cd /D ..
git clone https://github.com/apache/apr-util.git apr-util
cd /D apr-util
git checkout tags/1.6.1
cd /D ..
git clone https://github.com/google/brotli.git brotli
cd /D brotli
git checkout tags/v1.0.7
cd /D ..
git clone git://sourceware.org/git/bzip2.git bzip2
cd /D bzip2
git checkout tags/bzip2-1.0.8
cd /D ..
git clone https://github.com/c-ares/c-ares.git cares
cd /D cares
git checkout tags/cares-1_16_1
cd /D ..
git clone https://github.com/curl/curl.git curl
cd /D curl
git checkout tags/curl-7_70_0
cd /D ..
git clone git://git.sv.nongnu.org/freetype/freetype2.git freetype2
cd /D freetype2
git checkout tags/VER-2-10-2
cd /D ..
git clone https://github.com/apache/httpd.git httpd
cd /D httpd
git checkout tags/2.4.43
cd /D ..
git clone https://github.com/akheron/jansson.git jansson
cd /D jansson
git checkout tags/v2.13.1
cd /D ..
git clone https://github.com/jemalloc/jemalloc.git jemalloc
cd /D jemalloc
git checkout tags/5.2.1
cd /D ..
git clone https://github.com/mackyle/jpeg jpeg
cd /D jpeg
git checkout tags/v9d
cd /D ..
git clone https://git.lighttpd.net/libev.git libev
cd /D libev
git checkout tags/rel-4.33
cd /D ..
git clone https://github.com/libevent/libevent.git libevent
cd /D libevent
git checkout tags/release-2.1.11-stable
cd /D ..
git clone https://github.com/libexpat/libexpat.git libexpat
cd /D libexpat
git checkout tags/R_2_2_9
cd /D ..
git clone https://github.com/winlibs/libiconv.git libiconv
cd /D libiconv
git checkout tags/libiconv-1.16-1
cd /D ..
git clone https://github.com/maxmind/libmaxminddb.git libmaxminddb
cd /D libmaxminddb
git checkout tags/1.4.2
cd /D ..
git clone git://git.code.sf.net/p/libpng/code libpng
cd /D libpng
git checkout tags/v1.6.37
cd /D ..
git clone https://github.com/libssh2/libssh2.git libssh2
cd /D libssh2
git checkout tags/libssh2-1.9.0
cd /D ..
git clone https://github.com/opencor/libxdiff libxdiff
cd /D libxdiff
git checkout tags/v0.23
cd /D ..
git clone https://github.com/GNOME/libxml2.git libxml2
cd /D libxml2
git checkout tags/v2.9.10
cd /D ..
git clone https://gitlab.freedesktop.org/xorg/lib/libxpm libxpm
cd /D libxpm
git checkout tags/libXpm-3.5.13
cd /D ..
git clone https://github.com/xpol/lua lua
cd /D lua
git checkout origin/lua-5.3
cd /D ..
git clone https://github.com/memcached/memcached memcached
cd /D memcached
git checkout tags/1.6.6
cd /D ..
svn co https://svn.code.sf.net/p/mobac/code/trunk/MOBAC mobac
cd /D mobac
svn update -r 2471
cd /D ..
svn co http://svn.apache.org/repos/asf/httpd/mod_fcgid/trunk mod_fcgid
cd /D mod_fcgid
svn update -r 1877787
cd /D ..
git clone https://github.com/icing/mod_h2.git mod_h2
cd /D mod_h2
git checkout tags/v1.15.8
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
git checkout tags/v2.3.3
cd /D ..
git clone https://github.com/nono303/mod_whatkilledus mod_wku_bt
cd /D mod_wku_bt
git checkout tags/2.01.1
cd /D ..
git clone https://github.com/nghttp2/nghttp2.git nghttp2
cd /D nghttp2
git checkout tags/v1.40.0
cd /D ..
git clone https://github.com/puppetlabs/nssm.git nssm
cd /D nssm
git checkout master
cd /D ..
git clone https://github.com/openssl/openssl.git openssl
cd /D openssl
git checkout tags/OpenSSL_1_1_1g
cd /D ..
git clone https://github.com/jwilk-mirrors/pcre pcre
cd /D pcre
git checkout tags/pcre-8.44
cd /D ..
git clone https://github.com/websupport-sk/pecl-memcache.git pecl-memcache
cd /D pecl-memcache
git checkout NON_BLOCKING_IO_php7
cd /D ..
git clone https://github.com/php/pecl-text-xdiff pecl-text-xdiff
cd /D pecl-text-xdiff
git checkout tags/xdiff-2.0.1
cd /D ..
git clone https://github.com/deemru/php-cgi-spawner.git php-cgi-spawner
cd /D php-cgi-spawner
git checkout tags/1.1.23
cd /D ..
git clone https://github.com/kjdev/php-ext-brotli.git php-ext-brotli
cd /D php-ext-brotli
git checkout tags/0.7.0
cd /D ..
git clone https://github.com/microsoft/php-sdk-binary-tools.git php-sdk
cd /D php-sdk
git checkout master
cd /D ..
git clone https://github.com/php/php-src.git php-src
cd /D php-src
git checkout tags/php-7.4.6
cd /D ..
git clone https://github.com/nono303/simpleDLNA.git sdlna
cd /D sdlna
git checkout master
cd /D ..
git clone https://github.com/apache/serf.git serf
cd /D serf
git checkout trunk
cd /D ..
git clone https://github.com/azadkuh/sqlite-amalgamation sqlite
cd /D sqlite
git checkout tags/3.31.1
cd /D ..
git clone https://github.com/apache/subversion.git subversion
cd /D subversion
git checkout tags/1.13.0
cd /D ..
git clone https://github.com/htacg/tidy-html5 tidy
cd /D tidy
git checkout tags/5.7.28
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
git checkout tags/2.9.5
cd /D ..
git clone https://github.com/madler/zlib.git zlib
cd /D zlib
git checkout tags/v1.2.11
cd /D ..