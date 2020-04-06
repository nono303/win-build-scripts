set module=httpd

REM AVX
call %PATH_HTTPD_SDK%\vc15.bat
call %PATH_HTTPD_SDK%\x86.bat
call %PATH_HTTPD_SDK%\avx.bat 1
call %PATH_MODULE_BAT%\%module%.bat

call %PATH_HTTPD_SDK%\vc15.bat
call %PATH_HTTPD_SDK%\x64.bat
call %PATH_HTTPD_SDK%\avx.bat 1
call %PATH_MODULE_BAT%\%module%.bat

call %PATH_HTTPD_SDK%\vs16.bat
call %PATH_HTTPD_SDK%\x86.bat
call %PATH_HTTPD_SDK%\avx.bat 1
call %PATH_MODULE_BAT%\%module%.bat

call %PATH_HTTPD_SDK%\vs16.bat
call %PATH_HTTPD_SDK%\x64.bat
call %PATH_HTTPD_SDK%\avx.bat 1
call %PATH_MODULE_BAT%\%module%.bat

REM !AVX
call %PATH_HTTPD_SDK%\vc15.bat
call %PATH_HTTPD_SDK%\x86.bat
call %PATH_HTTPD_SDK%\avx.bat 0
call %PATH_MODULE_BAT%\%module%.bat

call %PATH_HTTPD_SDK%\vc15.bat
call %PATH_HTTPD_SDK%\x64.bat
call %PATH_HTTPD_SDK%\avx.bat 0
call %PATH_MODULE_BAT%\%module%.bat

call %PATH_HTTPD_SDK%\vs16.bat
call %PATH_HTTPD_SDK%\x86.bat
call %PATH_HTTPD_SDK%\avx.bat 0
call %PATH_MODULE_BAT%\%module%.bat

call %PATH_HTTPD_SDK%\vs16.bat
call %PATH_HTTPD_SDK%\x64.bat
call %PATH_HTTPD_SDK%\avx.bat 0
call %PATH_MODULE_BAT%\%module%.bat

pause