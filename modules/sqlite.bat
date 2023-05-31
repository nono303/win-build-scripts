@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

REM -DSQLITE_ENABLE_COLUMN_METADATA=ON -DSQLITE_OMIT_DECLTYPE=OFF 
	REM https://github.com/storesafe/cordova-sqlite-storage/issues/906
	REM PHP: sqlite_statement.obj : error LNK2001: unresolved external symbol sqlite3_column_table_name / sqlite3_column_decltype
REM -DICU_ROOT=%PATH_INSTALL% ^
REM	without KO	"C:\Windows Kits\10\Lib\10.0.22621.0\um\x64\icuuc.lib"  "C:\Windows Kits\10\Lib\10.0.22621.0\um\x64\icuin.Lib"
REM	with OK		C:\sdk\release\vs17_x64-avx\lib\icuuc.lib  C:\sdk\release\vs17_x64-avx\lib\icuin.lib
REM		warn	Policy CMP0074 is not set

REM SQLITE_THREADSAFE=ON > gdal
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DENABLE_SHARED=ON ^
-DSHAREDLIB_PREFIX=lib ^
-DENABLE_STATIC=OFF ^
-DBUILD_SHELL=ON ^
-DENABLE_STATIC_SHELL=OFF ^
-DENABLE_EDITLINE=OFF ^
-DENABLE_READLINE=OFF ^
-DENABLE_THREADSAFE=ON ^
-DENABLE_DYNAMIC_EXTENSIONS=ON ^
-DENABLE_MATH=ON ^
-DENABLE_FTS4=ON ^
-DENABLE_FTS3=OFF ^
-DENABLE_FTS5=ON ^
-DENABLE_RTREE=ON ^
-DENABLE_SESSION=OFF ^
-DENABLE_DEBUG=OFF ^
-DRECOMMENDED_OPTIONS=ON ^
-DENABLE_COLUMN_METADATA=ON ^
-DENABLE_DBSTAT_VTAB=ON ^
-DENABLE_ICU=ON ^
-DICU_ROOT=%PATH_INSTALL% ^
-DENABLE_RBU=ON ^
-DENABLE_STAT4=ON ^
-DOMIT_JSON=OFF ^
-DOMIT_DECLTYPE=OFF ^
-DOMIT_AUTOINIT=OFF ^
-DUSE_URI=OFF ^
-DWIN32_MALLOC=ON ^
-DWIN32_HEAP_CREATE=ON ^
-DBUILD_WITH_XPSDK=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for %%Y in (sqlite3.exe libsqlite3.dll) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%Y)
	REM for GDAL / php must have sqlite3ext.h in /sqlite3
if not exist %PATH_INSTALL%\include\sqlite3ext.h mklink /h %PATH_INSTALL%\include\sqlite3ext.h %PATH_INSTALL%\include\sqlite3\sqlite3ext.h