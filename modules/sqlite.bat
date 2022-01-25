@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM patch PHP7.4
	REM sqlite_statement.obj : error LNK2001: unresolved external symbol sqlite3_column_table_name
	REM sqlite_statement.obj : error LNK2001: unresolved external symbol sqlite3_column_decltype
sed -i 's/SQLITE_OMIT_DECLTYPE/SQLITE_ENABLE_COLUMN_METADATA/g' %CYGPATH_SRC%/%1/CMakeLists.txt
for %%C in ("-DBUILD_SHARED_LIBS=OFF -DBUILD_SHELL=ON" "-DBUILD_SHARED_LIBS=ON -DBUILD_SHELL=OFF") do (
		REM dirty !! https://stackoverflow.com/questions/9556676/batch-file-how-to-replace-equal-signs-and-a-string-variable
	set CUR=%%C
	setlocal enabledelayedexpansion
	set new=!CUR:"=!

	if %%C =="-DBUILD_SHARED_LIBS=ON -DBUILD_SHELL=OFF" (
		sed -i 's/STATIC sqlite3.c/SHARED sqlite3.c/g' %CYGPATH_SRC%/%1/CMakeLists.txt
		sed -i 's/OUTPUT_NAME   sqlite3/OUTPUT_NAME   libsqlite3/g' %CYGPATH_SRC%/%1/CMakeLists.txt
	)

	cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DSQLITE_ENABLE_FTS3=ON ^
	-DSQLITE_ENABLE_DBSTAT_VTAB=ON ^
	-DSQLITE_ENABLE_RBU=ON ^
	-DSQLITE_ENABLE_RTREE=ON ^
	-DSQLITE_ENABLE_JSON1=ON ^
	-DSQLITE_ENABLE_ICU=OFF ^
	-DSQLITE_ENABLE_FTS5=ON ^
	-DSQLITE_RECOMMENDED_OPTIONS=ON ^
	!new! ^
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	%NINJA% install

	if %%C =="-DBUILD_SHARED_LIBS=OFF -DBUILD_SHELL=ON" (
		xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\SQLite3.dir\SQLite3.pdb %PATH_INSTALL%\lib\sqlite3.pdb*
		xcopy /C /F /Y %PATH_BUILD%\%1\sqlite3.pdb %PATH_INSTALL%\bin\*
	) else (
		for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\libsqlite3.%%X %PATH_INSTALL%\bin\*)
	)
)
xcopy /C /F /Y %PATH_SRC%\%1\sqlite3ext.h %PATH_INSTALL%\include\sqlite3\*
for %%X in (libsqlite3.dll sqlite3.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)