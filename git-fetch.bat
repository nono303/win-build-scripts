for %%i in (
"C:\src\apr"
"C:\src\apr-util"
"C:\src\brotli"
"C:\src\bzip2-1.0.6"
"C:\src\curl"
"C:\src\httpd"
"C:\src\jansson"
"C:\src\jemalloc-cmake"
"C:\src\libevent"
"C:\src\libexpat"
"C:\src\libiconv"
"C:\src\libxml2"
"C:\src\lua"
"C:\src\mod_fcgid"
"C:\src\mod_h2"
"C:\src\mod_md"
"C:\src\nghttp2"
"C:\src\openssl"
"C:\src\pcre"
"C:\src\zlib"
"C:\src\php-src"
"C:\src\pecl-memcache"
"C:\src\xdebug"
"C:\php72-sdk"
"C:\httpd-sdk\src\php-cgi-spawner"
) do (
    cd %%i
    git fetch
    git fetch --tag
    git config --get remote.origin.url
    git status
)
cd c:\httpd-sdk