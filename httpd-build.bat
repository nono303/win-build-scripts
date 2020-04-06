cd /D %PATH_INSTALL%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
mkdir %PATH_INSTALL%\bin\
mkdir %PATH_INSTALL%\lib\
mkdir %PATH_INSTALL%\include\

call %PATH_MODULE_BAT%\jemalloc.bat
call %PATH_MODULE_BAT%\zlib.bat
call %PATH_MODULE_BAT%\brotli.bat
call %PATH_MODULE_BAT%\jansson.bat
call %PATH_MODULE_BAT%\bzip2.bat
call %PATH_MODULE_BAT%\libiconv.bat
call %PATH_MODULE_BAT%\libxml2.bat
call %PATH_MODULE_BAT%\pcre.bat
call %PATH_MODULE_BAT%\openssl.bat
call %PATH_MODULE_BAT%\libevent.bat
call %PATH_MODULE_BAT%\libev.bat
call %PATH_MODULE_BAT%\c-ares.bat
call %PATH_MODULE_BAT%\nghttp2.bat
call %PATH_MODULE_BAT%\libssh2.bat
call %PATH_MODULE_BAT%\curl.bat
call %PATH_MODULE_BAT%\libexpat.bat
call %PATH_MODULE_BAT%\libmaxminddb.bat
call %PATH_MODULE_BAT%\apr.bat
call %PATH_MODULE_BAT%\lua.bat
call %PATH_MODULE_BAT%\httpd.bat
call %PATH_MODULE_BAT%\mod_h264_streaming.bat

cd /D %PATH_HTTPD_SDK%\