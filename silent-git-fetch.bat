call ymdhis.bat
SET LOGNAME=C:\httpd-sdk\_logs\git-fetch_%ymdhis%.log
call do_php git-fetch.php  2>&1 | tee %LOGNAME%
