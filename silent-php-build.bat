call C:\httpd-sdk\ymdhis.bat
SET LOGNAME=C:\httpd-sdk\_logs\php-build_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.log
call C:\php72-sdk\phpsdk-%MSVC_DEPS%-%ARCH%.bat 2>&1 | tee %LOGNAME%