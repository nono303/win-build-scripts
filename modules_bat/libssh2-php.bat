cd ..
rmdir /S /Q C:\httpd-sdk\build\libssh2
mkdir C:\httpd-sdk\build\libssh2
cd /D C:\httpd-sdk\build\libssh2
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PHPDEPS% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DOPENSSL_ROOT_DIR=c:\httpd-sdk\install -DZLIB_LIBRARY=c:/httpd-sdk/install/lib/zlib.lib -DZLIB_INCLUDE_DIR=c:\httpd-sdk\install\include -DCRYPTO_BACKEND=OpenSSL -DENABLE_ZLIB_COMPRESSION=ON ..\..\src\libssh2
nmake %NMAKE_OPTS% clean install
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PHPDEPS% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DOPENSSL_ROOT_DIR=c:\httpd-sdk\install -DZLIB_LIBRARY=c:/httpd-sdk/install/lib/zlib.lib -DZLIB_INCLUDE_DIR=c:\httpd-sdk\install\include -DCRYPTO_BACKEND=OpenSSL -DENABLE_ZLIB_COMPRESSION=ON ..\..\src\libssh2
nmake %NMAKE_OPTS% clean install
copy /Y C:\httpd-sdk\build\libssh2\src\CMakeFiles\libssh2.dir\libssh2.pdb %PHPDEPS%\bin\libssh2.pdb
cd /D C:\httpd-sdk\modules_bat