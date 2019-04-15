cd C:\src\c-ares\
call C:\src\c-ares\buildconf.bat
rmdir /S /Q C:\httpd-sdk\build\c-ares
mkdir C:\httpd-sdk\build\c-ares
cd /D C:\httpd-sdk\build\c-ares
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DCARES_STATIC=ON -DCARES_SHARED=ON -DCARES_INSTALL=ON -DCARES_STATIC_PIC=OFF -DCARES_BUILD_TESTS=OFF -DCARES_MSVC_STATIC_RUNTIME=OFF ..\..\src\c-ares 
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/c-ares.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
copy /Y C:\httpd-sdk\build\c-ares\bin\cares.pdb C:\httpd-sdk\install\bin\cares.pdb
copy /Y C:\httpd-sdk\build\c-ares\bin\acountry.pdb C:\httpd-sdk\install\bin\acountry.pdb
copy /Y C:\httpd-sdk\build\c-ares\bin\adig.pdb C:\httpd-sdk\install\bin\adig.pdb
copy /Y C:\httpd-sdk\build\c-ares\bin\ahost.pdb C:\httpd-sdk\install\bin\ahost.pdb
cd /D C:\httpd-sdk\modules_bat