cd ..
cd /D C:\httpd-sdk\src\sqlite-amalgamation 
git reset --hard
git clean -fdx
REM patch PHP7.4
sed -i 's/SQLITE_OMIT_DECLTYPE/SQLITE_ENABLE_COLUMN_METADATA/g' /cygdrive/c/src/sqlite-amalgamation/CMakeLists.txt
rmdir /S /Q C:\httpd-sdk\build\sqlite-amalgamation
mkdir C:\httpd-sdk\build\sqlite-amalgamation
cd /D C:\httpd-sdk\build\sqlite-amalgamation
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_ENABLE_FTS3=ON -DBUILD_ENABLE_DBSTAT_VTAB=ON -DBUILD_SHARED_LIBS=OFF -DBUILD_SHELL=ON -DBUILD_ENABLE_RBU=ON -DBUILD_ENABLE_RTREE=ON -DBUILD_ENABLE_JSON1=ON -DBUILD_ENABLE_ICU=OFF -DBUILD_ENABLE_FTS5=ON ..\..\src\sqlite-amalgamation 
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/sqlite-svn.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
	REM PHP 7.4
	copy /Y C:\httpd-sdk\src\sqlite-amalgamation\sqlite3ext.h C:\httpd-sdk\install\include\sqlite3\sqlite3ext.h
	mklink /H C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\include\sqlite3ext.h C:\httpd-sdk\install\include\sqlite3\sqlite3ext.h
	mklink /H C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\include\sqlite3.h C:\httpd-sdk\install\include\sqlite3\sqlite3.h
	mklink /H C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\lib\libsqlite3.lib C:\httpd-sdk\install\lib\sqlite3.lib
	mklink /H C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\bin\sqlite3.exe C:\httpd-sdk\install\bin\sqlite3.exe
cd /D C:\httpd-sdk\modules_bat