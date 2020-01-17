set module=httpd

REM AVX
call C:\httpd-sdk\vc15.bat
call C:\httpd-sdk\x86.bat
call C:\httpd-sdk\avx.bat 1
call C:\httpd-sdk\modules_bat\%module%.bat

call C:\httpd-sdk\vc15.bat
call C:\httpd-sdk\x64.bat
call C:\httpd-sdk\avx.bat 1
call C:\httpd-sdk\modules_bat\%module%.bat

call C:\httpd-sdk\vs16.bat
call C:\httpd-sdk\x86.bat
call C:\httpd-sdk\avx.bat 1
call C:\httpd-sdk\modules_bat\%module%.bat

call C:\httpd-sdk\vs16.bat
call C:\httpd-sdk\x64.bat
call C:\httpd-sdk\avx.bat 1
call C:\httpd-sdk\modules_bat\%module%.bat

REM !AVX
call C:\httpd-sdk\vc15.bat
call C:\httpd-sdk\x86.bat
call C:\httpd-sdk\avx.bat 0
call C:\httpd-sdk\modules_bat\%module%.bat

call C:\httpd-sdk\vc15.bat
call C:\httpd-sdk\x64.bat
call C:\httpd-sdk\avx.bat 0
call C:\httpd-sdk\modules_bat\%module%.bat

call C:\httpd-sdk\vs16.bat
call C:\httpd-sdk\x86.bat
call C:\httpd-sdk\avx.bat 0
call C:\httpd-sdk\modules_bat\%module%.bat

call C:\httpd-sdk\vs16.bat
call C:\httpd-sdk\x64.bat
call C:\httpd-sdk\avx.bat 0
call C:\httpd-sdk\modules_bat\%module%.bat

pause