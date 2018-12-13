cd /D C:\httpd-sdk\install
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
mkdir c:\httpd-sdk\install\bin\
mkdir c:\httpd-sdk\install\lib\
mkdir c:\httpd-sdk\install\include\

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

Copy /Y C:\httpd-sdk\install\modules\mod_md.pdb D:\github\NONO_mod_md\vc15\%ARCH%%AVXB%\mod_md.pdb
Copy /Y C:\httpd-sdk\install\modules\mod_md.so D:\github\NONO_mod_md\vc15\%ARCH%%AVXB%\mod_md.so
Copy /Y C:\httpd-sdk\install\modules\mod_ssl.pdb D:\github\NONO_mod_md\vc15\%ARCH%%AVXB%\mod_ssl.pdb
Copy /Y C:\httpd-sdk\install\modules\mod_ssl.so D:\github\NONO_mod_md\vc15\%ARCH%%AVXB%\mod_ssl.so
Copy /Y C:\httpd-sdk\install\bin\libcurl.dll D:\github\NONO_mod_md\vc15\%ARCH%%AVXB%\deps\libcurl.dll
Copy /Y C:\httpd-sdk\install\bin\libcurl.pdb D:\github\NONO_mod_md\vc15\%ARCH%%AVXB%\deps\libcurl.pdb
Copy /Y C:\httpd-sdk\install\bin\jansson.dll D:\github\NONO_mod_md\vc15\%ARCH%%AVXB%\deps\jansson.dll
Copy /Y C:\httpd-sdk\install\bin\jansson.pdb D:\github\NONO_mod_md\vc15\%ARCH%%AVXB%\deps\jansson.pdb

cd /D C:\httpd-sdk\