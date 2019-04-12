cd ..
rmdir /S /Q C:\httpd-sdk\build\libxdiff
mkdir C:\httpd-sdk\build\libxdiff
cd /D C:\httpd-sdk\build\libxdiff
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PHPDEPS% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DENABLE_TESTS=OFF -DENABLE_TOOLS=OFF ..\..\src\libxdiff
nmake %NMAKE_OPTS% clean install
cd /D C:\httpd-sdk\modules_bat