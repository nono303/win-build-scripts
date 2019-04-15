cd ..
rmdir /S /Q C:\httpd-sdk\build\libexpat
mkdir C:\httpd-sdk\build\libexpat
cd /D C:\httpd-sdk\build\libexpat
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_doc=OFF -DBUILD_tests=OFF -DBUILD_examples=OFF -DBUILD_tools=OFF ..\..\src\libexpat\expat
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/libexpat.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
copy /Y C:\httpd-sdk\build\libexpat\expat.pdb C:\httpd-sdk\install\bin\expat.pdb
cd /D C:\httpd-sdk\modules_bat