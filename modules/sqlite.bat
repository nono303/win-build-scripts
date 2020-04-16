call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM patch PHP7.4
sed -i 's/SQLITE_OMIT_DECLTYPE/SQLITE_ENABLE_COLUMN_METADATA/g' %CYGPATH_SRC%/%1/CMakeLists.txt

	REM ## DLL ##
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_ENABLE_FTS3=ON -DBUILD_ENABLE_DBSTAT_VTAB=ON -DBUILD_SHARED_LIBS=ON -DBUILD_SHELL=OFF -DBUILD_ENABLE_RBU=ON -DBUILD_ENABLE_RTREE=ON -DBUILD_ENABLE_JSON1=ON -DBUILD_ENABLE_ICU=OFF -DBUILD_ENABLE_FTS5=ON %PATH_SRC%\%1 
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install
copy /Y %PATH_BUILD%\%1\sqlite3.dll %PATH_INSTALL%\bin\sqlite3.dll
copy /Y %PATH_BUILD%\%1\sqlite3.pdb %PATH_INSTALL%\bin\sqlite3.pdb

	REM ## EXE ##
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_ENABLE_FTS3=ON -DBUILD_ENABLE_DBSTAT_VTAB=ON -DBUILD_SHARED_LIBS=OFF -DBUILD_SHELL=ON -DBUILD_ENABLE_RBU=ON -DBUILD_ENABLE_RTREE=ON -DBUILD_ENABLE_JSON1=ON -DBUILD_ENABLE_ICU=OFF -DBUILD_ENABLE_FTS5=ON %PATH_SRC%\%1 
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

	REM PHP 7.4
copy /Y %PATH_SRC%\%1\sqlite3ext.h %PATH_INSTALL%\include\sqlite3\sqlite3ext.h
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\include\sqlite3ext.h mklink /H %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\include\sqlite3ext.h %PATH_INSTALL%\include\sqlite3\sqlite3ext.h
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\include\sqlite3.h mklink /H %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\include\sqlite3.h %PATH_INSTALL%\include\sqlite3\sqlite3.h
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\lib\libsqlite3.lib mklink /H %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\lib\libsqlite3.lib %PATH_INSTALL%\lib\sqlite3.lib
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\bin\sqlite3.exe mklink /H %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\bin\sqlite3.exe %PATH_INSTALL%\bin\sqlite3.exe