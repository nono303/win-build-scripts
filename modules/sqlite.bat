@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM patch PHP7.4
	REM sqlite_statement.obj : error LNK2001: unresolved external symbol sqlite3_column_table_name
	REM sqlite_statement.obj : error LNK2001: unresolved external symbol sqlite3_column_decltype
sed -i 's/SQLITE_OMIT_DECLTYPE/SQLITE_ENABLE_COLUMN_METADATA/g' %CYGPATH_SRC%/%1/CMakeLists.txt

for %%C in ("-DBUILD_SHARED_LIBS=ON -DBUILD_SHELL=OFF" "-DBUILD_SHARED_LIBS=OFF -DBUILD_SHELL=ON") do (
		REM dirty !! https://stackoverflow.com/questions/9556676/batch-file-how-to-replace-equal-signs-and-a-string-variable
	set CUR=%%C
	SETLOCAL ENABLEDELAYEDEXPANSION
	set new=!CUR:"=!

	cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DBUILD_ENABLE_FTS3=ON ^
	-DBUILD_ENABLE_DBSTAT_VTAB=ON ^
	-DBUILD_ENABLE_RBU=ON ^
	-DBUILD_ENABLE_RTREE=ON ^
	-DBUILD_ENABLE_JSON1=ON ^
	-DBUILD_ENABLE_ICU=OFF ^
	-DBUILD_ENABLE_FTS5=ON ^
	!new! ^
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	sed -i 's/-W3//g' %CYGPATH_BUILD%/%1/CMakeFiles/sqlite3.dir/flags.make
	nmake %NMAKE_OPTS% clean install
)

for %%D in (dll pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\sqlite3.%%D %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_SRC%\%1\sqlite3ext.h %PATH_INSTALL%\include\sqlite3\*
for %%X in (dll exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\sqlite3.%%X)