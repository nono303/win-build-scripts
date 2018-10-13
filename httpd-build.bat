cd /D C:\httpd-sdk\build
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
cd /D C:\httpd-sdk\install
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

call %MODULE_BAT_DIR%jemalloc.bat
call %MODULE_BAT_DIR%zlib.bat
call %MODULE_BAT_DIR%brotli.bat
call %MODULE_BAT_DIR%jansson.bat
call %MODULE_BAT_DIR%bzip2.bat
call %MODULE_BAT_DIR%libiconv.bat
call %MODULE_BAT_DIR%libxml2.bat
call %MODULE_BAT_DIR%pcre.bat
call %MODULE_BAT_DIR%openssl.bat
call %MODULE_BAT_DIR%libevent.bat
call %MODULE_BAT_DIR%libev.bat
call %MODULE_BAT_DIR%c-ares.bat
call %MODULE_BAT_DIR%nghttp2.bat
call %MODULE_BAT_DIR%curl.bat
call %MODULE_BAT_DIR%libexpat.bat
call %MODULE_BAT_DIR%libmaxminddb.bat
call %MODULE_BAT_DIR%apr.bat
call %MODULE_BAT_DIR%lua.bat
call %MODULE_BAT_DIR%httpd.bat
call %MODULE_BAT_DIR%mod_h264_streaming.bat

cd /D C:\httpd-sdk\