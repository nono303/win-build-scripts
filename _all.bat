REM AVX
call vc15
call x86
call silent-httpd-build.bat
REM call silent-php-build.bat
call silent-subversion-build.bat
call x64
call silent-httpd-build.bat
REM call silent-php-build.bat
call silent-subversion-build.bat
call vs16
call x86
call silent-httpd-build.bat
REM call silent-php-build.bat
call silent-subversion-build.bat
call x64
call silent-httpd-build.bat
REM call silent-php-build.bat
call silent-subversion-build.bat
REM !AVX
call vc15
call x86
call avx 0
call silent-httpd-build.bat
call silent-subversion-build.bat
call x64
call avx 0
call silent-httpd-build.bat
call silent-subversion-build.bat
call vs16
call x86
call avx 0
call silent-httpd-build.bat
call silent-subversion-build.bat
call x64
call avx 0
call silent-httpd-build.bat
call silent-subversion-build.bat