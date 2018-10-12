cd ..
rmdir /S /Q C:\httpd-sdk\build\serf
mkdir C:\httpd-sdk\build\serf
cd /D C:\httpd-sdk\build\serf
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DDEBUG=OFF -DSKIP_SHARED=OFF -DSKIP_STATIC=OFF -DLIBDIR=C:\httpd-sdk\install\lib\ -DGSSAPI=C:\httpd-sdk\install\ -DBROTLI=C:\httpd-sdk\install\ -DDISABLE_LOGGING=OFF -DSKIP_TESTS=ON -DENABLE_SLOW_TESTS=OFF -DAPR_STATIC=OFF -DEXPAT=C:\httpd-sdk\install\ -DAPR_ROOT=C:\httpd-sdk\install\ -DAPRUtil_ROOT=C:\httpd-sdk\install\ ..\..\src\serf 
nmake /B /NOLOGO clean install
cd /D C:\httpd-sdk\modules_bat