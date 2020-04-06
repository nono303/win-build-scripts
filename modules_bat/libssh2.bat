cd ..
rmdir /S /Q %PATH_BUILD%\libssh2
mkdir %PATH_BUILD%\libssh2
cd /D %PATH_BUILD%\libssh2

	REM dll shared
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DOPENSSL_ROOT_DIR=%PATH_INSTALL% -DZLIB_LIBRARY=c:/httpd-sdk/install/lib/zlib.lib -DZLIB_INCLUDE_DIR=%PATH_INSTALL%\include -DCRYPTO_BACKEND=OpenSSL -DENABLE_ZLIB_COMPRESSION=ON %PATH_SRC%\libssh2
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULE_BAT%/libssh2.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean
nmake %NMAKE_OPTS% 
copy /Y %PATH_BUILD%\libssh2\src\libssh2.pdb %PATH_INSTALL%\bin\libssh2.pdb
copy /Y %PATH_BUILD%\libssh2\src\libssh2.dll %PATH_INSTALL%\bin\libssh2.dll

	REM lib static
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DOPENSSL_ROOT_DIR=%PATH_INSTALL% -DZLIB_LIBRARY=c:/httpd-sdk/install/lib/zlib.lib -DZLIB_INCLUDE_DIR=%PATH_INSTALL%\include -DCRYPTO_BACKEND=OpenSSL -DENABLE_ZLIB_COMPRESSION=ON %PATH_SRC%\libssh2
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULE_BAT%/libssh2.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean
nmake %NMAKE_OPTS% 
copy /Y %PATH_BUILD%\libssh2\src\libssh2.lib %PATH_INSTALL%\lib\libssh2.lib
copy /Y %PATH_BUILD%\libssh2\src\CMakeFiles\libssh2.dir\libssh2.pdb %PATH_INSTALL%\lib\libssh2.pdb

copy /Y %PATH_SRC%\libssh2\include\libssh2.h %PATH_INSTALL%\include\libssh2.h
copy /Y %PATH_SRC%\libssh2\include\libssh2_publickey.h %PATH_INSTALL%\include\libssh2_publickey.h
copy /Y %PATH_SRC%\libssh2\include\libssh2_sftp.h %PATH_INSTALL%\include\libssh2_sftp.h
cd /D %PATH_MODULE_BAT%