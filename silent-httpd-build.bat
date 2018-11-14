call ymdhis.bat
SET LOGNAME=C:\httpd-sdk\_logs\httpd-build_%ARCH%_%ymdhis%.log
call httpd-build.bat 2>&1 | tee %LOGNAME%