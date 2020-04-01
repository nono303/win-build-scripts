call ymdhis.bat
SET LOGNAME=C:\httpd-sdk\_logs\subversion-build_%ARCH%%AVXB%_%ymdhis%.log
call subversion-build.bat 2>&1 | tee %LOGNAME%