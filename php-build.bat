call C:\httpd-sdk\ymdhis.bat
SET LOGNAME=C:\httpd-sdk\_logs\php-build_%1_%ymdhis%.log
call C:\php72-sdk\phpsdk-%MSVC_DEPS%-%ARCH%.bat 2>&1 | tee %LOGNAME%
cd /D C:\httpd-sdk\