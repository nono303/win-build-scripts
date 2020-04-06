call ymdhis.bat
SET LOGNAME=%PATH_HTTPD_SDK%\_logs\httpd-build_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.log
call httpd-build.bat 2>&1 | tee %LOGNAME%