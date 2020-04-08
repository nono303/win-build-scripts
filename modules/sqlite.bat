cd ..
cd /D %PATH_SRC%\sqlite-amalgamation 
git reset --hard
git clean -fdx
REM patch PHP7.4
sed -i 's/SQLITE_OMIT_DECLTYPE/SQLITE_ENABLE_COLUMN_METADATA/g' %CYGPATH_SRC%/sqlite-amalgamation/CMakeLists.txt
rmdir /S /Q %PATH_BUILD%\sqlite-amalgamation
mkdir %PATH_BUILD%\sqlite-amalgamation
cd /D %PATH_BUILD%\sqlite-amalgamation
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_ENABLE_FTS3=ON -DBUILD_ENABLE_DBSTAT_VTAB=ON -DBUILD_SHARED_LIBS=OFF -DBUILD_SHELL=ON -DBUILD_ENABLE_RBU=ON -DBUILD_ENABLE_RTREE=ON -DBUILD_ENABLE_JSON1=ON -DBUILD_ENABLE_ICU=OFF -DBUILD_ENABLE_FTS5=ON %PATH_SRC%\sqlite-amalgamation 
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/sqlite-svn.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
	REM PHP 7.4
	copy /Y %PATH_SRC%\sqlite-amalgamation\sqlite3ext.h %PATH_INSTALL%\include\sqlite3\sqlite3ext.h
	mklink /H %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\include\sqlite3ext.h %PATH_INSTALL%\include\sqlite3\sqlite3ext.h
	mklink /H %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\include\sqlite3.h %PATH_INSTALL%\include\sqlite3\sqlite3.h
	mklink /H %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\lib\libsqlite3.lib %PATH_INSTALL%\lib\sqlite3.lib
	mklink /H %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\bin\sqlite3.exe %PATH_INSTALL%\bin\sqlite3.exe
cd /D %PATH_MODULES%