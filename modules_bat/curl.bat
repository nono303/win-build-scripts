cd ..
rmdir /S /Q C:\httpd-sdk\build\curl
mkdir C:\httpd-sdk\build\curl
cd /D C:\httpd-sdk\build\curl
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DCMAKE_USE_WINSSL=ON -DBUILD_SHARED_LIBS=ON -DENABLE_IPV6=OFF -DCMAKE_USE_LIBSSH2=OFF -DENABLE_UNIX_SOCKETS=OFF -DBUILD_CURL_EXE=OFF ..\..\src\curl
nmake %NMAKE_OPTS% clean install
copy /Y C:\httpd-sdk\build\curl\lib\libcurl.pdb C:\httpd-sdk\install\bin\libcurl.pdb
rm -f C:\httpd-sdk\install\bin\curl-config
cd /D C:\httpd-sdk\modules_bat