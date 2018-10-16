cd ..
rmdir /S /Q C:\httpd-sdk\build\libev-win
mkdir C:\httpd-sdk\build\libev-win
cd /D C:\httpd-sdk\build\libev-win
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ..\..\src\libev-win 
nmake %NMAKE_OPTS%
copy /Y C:\httpd-sdk\build\libev-win\libev_static.lib C:\httpd-sdk\install\lib\libev_static.lib
copy /Y C:\httpd-sdk\build\libev-win\libev.dll C:\httpd-sdk\install\bin\libev.dll
copy /Y C:\httpd-sdk\build\libev-win\libev.pdb C:\httpd-sdk\install\bin\libev.pdb
copy /Y C:\httpd-sdk\src\libev-win\ev.h C:\httpd-sdk\install\include\ev.h
cd /D C:\httpd-sdk\modules_bat