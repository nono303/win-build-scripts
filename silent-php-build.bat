call %PATH_HTTPD_SDK%\ymdhis.bat
SET LOGNAME=%PATH_HTTPD_SDK%\_logs\php-build_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.log
call %PATH_PHP_SDK%\phpsdk-%MSVC_DEPS%-%ARCH%.bat 2>&1 | tee %LOGNAME%