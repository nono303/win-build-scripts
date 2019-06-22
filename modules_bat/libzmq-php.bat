rmdir /S /Q C:\httpd-sdk\build\libzmq
mkdir C:\httpd-sdk\build\libzmq
cd /D C:\httpd-sdk\build\libzmq
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PHPDEPS% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DWITH_DOC=OFF -DBUILD_SHARED=ON -DBUILD_STATIC=OFF -DBUILD_TESTS=OFF -DENABLE_CPACK=OFF ..\..\src\libzmq 
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/libzmq-php.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
mklink /h %PHPDEPS%\lib\libzmq.lib %PHPDEPS%\lib\libzmq-mt-4_3_1.lib
cd /D C:\httpd-sdk\modules_bat