@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

REM -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_OMIT_DECLTYPE=0 
	REM https://github.com/storesafe/cordova-sqlite-storage/issues/906
	REM PHP: sqlite_statement.obj : error LNK2001: unresolved external symbol sqlite3_column_table_name / sqlite3_column_decltype
REM -DICU_ROOT=%PATH_INSTALL% ^
REM	without KO	"C:\Windows Kits\10\Lib\10.0.22621.0\um\x64\icuuc.lib"  "C:\Windows Kits\10\Lib\10.0.22621.0\um\x64\icuin.Lib"
REM	with OK		C:\sdk\release\vs17_x64-avx\lib\icuuc.lib  C:\sdk\release\vs17_x64-avx\lib\icuin.lib
REM		warn	Policy CMP0074 is not set

REM SQLITE_THREADSAFE=1 > gdal
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DICU_ROOT=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=1 ^
-DBUILD_SHELL=1 ^
-DBUILD_SHELL_STATIC=0 ^
-DSQLITE_RECOMMENDED_OPTIONS=1 ^
-DSQLITE_ENABLE_COLUMN_METADATA=1 ^
-DSQLITE_ENABLE_DBSTAT_VTAB=1 ^
-DSQLITE_ENABLE_FTS3=1 ^
-DSQLITE_ENABLE_FTS4=1 ^
-DSQLITE_ENABLE_FTS5=1 ^
-DSQLITE_ENABLE_GEOPOLY=1 ^
-DSQLITE_ENABLE_ICU=1 ^
-DSQLITE_ENABLE_MATH_FUNCTIONS=1 ^
-DSQLITE_ENABLE_RBU=1 ^
-DSQLITE_ENABLE_RTREE=1 ^
-DSQLITE_ENABLE_STAT4=1 ^
-DSQLITE_HAVE_ZLIB=1 ^
-DSQLITE_OMIT_JSON=0 ^
-DSQLITE_OMIT_DECLTYPE=0 ^
-DSQLITE_OMIT_AUTOINIT=0 ^
-DSQLITE_USE_URI=0 ^
-DSQLITE_THREADSAFE=1 ^
-DSQLITE_WIN32_MALLOC=1 ^
-DSQLITE_WIN32_HEAP_CREATE=1 ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for %%Y in (sqlite3.exe libsqlite3.dll) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%Y)