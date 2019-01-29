cd ..
rmdir /S /Q C:\httpd-sdk\build\libssh2
mkdir C:\httpd-sdk\build\libssh2
cd /D C:\httpd-sdk\build\libssh2
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DCRYPTO_BACKEND=OpenSSL -DENABLE_ZLIB_COMPRESSION=ON ..\..\src\libssh2
nmake %NMAKE_OPTS% clean install
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DCRYPTO_BACKEND=OpenSSL -DENABLE_ZLIB_COMPRESSION=ON ..\..\src\libssh2
nmake %NMAKE_OPTS% clean install
cd /D C:\httpd-sdk\modules_bat
