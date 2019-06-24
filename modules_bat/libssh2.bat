cd ..
rmdir /S /Q C:\httpd-sdk\build\libssh2
mkdir C:\httpd-sdk\build\libssh2
cd /D C:\httpd-sdk\build\libssh2

	REM dll shared
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=c:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DOPENSSL_ROOT_DIR=c:\httpd-sdk\install -DZLIB_LIBRARY=c:/httpd-sdk/install/lib/zlib.lib -DZLIB_INCLUDE_DIR=c:\httpd-sdk\install\include -DCRYPTO_BACKEND=OpenSSL -DENABLE_ZLIB_COMPRESSION=ON ..\..\src\libssh2
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/libssh2.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean
nmake %NMAKE_OPTS% 
copy /Y C:\httpd-sdk\build\libssh2\src\libssh2.pdb
copy /Y C:\httpd-sdk\build\libssh2\src\libssh2.dll

	REM lib static
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=c:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DOPENSSL_ROOT_DIR=c:\httpd-sdk\install -DZLIB_LIBRARY=c:/httpd-sdk/install/lib/zlib.lib -DZLIB_INCLUDE_DIR=c:\httpd-sdk\install\include -DCRYPTO_BACKEND=OpenSSL -DENABLE_ZLIB_COMPRESSION=ON ..\..\src\libssh2
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/libssh2.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean
nmake %NMAKE_OPTS% 
copy /Y C:\httpd-sdk\build\libssh2\src\libssh2.lib c:\httpd-sdk\install\lib\libssh2.lib
copy /Y C:\httpd-sdk\build\libssh2\src\CMakeFiles\libssh2.dir\libssh2.pdb c:\httpd-sdk\install\lib\libssh2.pdb

copy /Y C:\httpd-sdk\src\libssh2\include\libssh2.h C:\httpd-sdk\install\include\libssh2.h
copy /Y C:\httpd-sdk\src\libssh2\include\libssh2_publickey.h C:\httpd-sdk\install\include\libssh2_publickey.h
copy /Y C:\httpd-sdk\src\libssh2\include\libssh2_sftp.h C:\httpd-sdk\install\include\libssh2_sftp.h
cd /D C:\httpd-sdk\modules_bat