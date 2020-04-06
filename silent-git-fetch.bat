call ymdhis.bat
SET LOGNAME=%PATH_HTTPD_SDK%\_logs\git-fetch_%ymdhis%.log
call do_php git-fetch.php 2>&1 | tee %LOGNAME%
