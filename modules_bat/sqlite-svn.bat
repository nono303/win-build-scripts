cd ..
rmdir /S /Q C:\httpd-sdk\build\sqlite-amalgamation
mkdir C:\httpd-sdk\build\sqlite-amalgamation
cd /D C:\httpd-sdk\build\sqlite-amalgamation
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_MT_RELEASE=ON -DBUILD_ENABLE_FTS3=ON -DBUILD_ENABLE_DBSTAT_VTAB=ON -DBUILD_SHARED_LIBS=OFF -DBUILD_SHELL=ON -DBUILD_ENABLE_RBU=ON -DBUILD_ENABLE_RTREE=ON -DBUILD_ENABLE_JSON1=ON -DBUILD_ENABLE_ICU=OFF -DBUILD_ENABLE_FTS5=ON ..\..\src\sqlite-amalgamation 
nmake /B /NOLOGO clean install
cd /D C:\httpd-sdk\modules_bat