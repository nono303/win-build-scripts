echo off
call C:\httpd-sdk\ymdhis.bat
SET LOGNAME=C:\httpd-sdk\_logs\php-build_%1_%ymdhis%.log
call C:\php72-sdk\phpsdk-vc15-%1.bat 2>&1 | tee %LOGNAME%