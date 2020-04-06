call ymdhis.bat
SET LOGNAME=%PATH_HTTPD_SDK%\_logs\subversion-build_%ARCH%%AVXB%_%ymdhis%.log
call subversion-build.bat 2>&1 | tee %LOGNAME%