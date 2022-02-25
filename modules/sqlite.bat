@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

for %%C in ("-DBUILD_SHARED_LIBS=OFF -DBUILD_SHELL=ON" "-DBUILD_SHARED_LIBS=ON -DBUILD_SHELL=OFF") do (
	call %PATH_MODULES_COMMON%\init.bat %1 cmake
		REM patch PHP - https://github.com/storesafe/cordova-sqlite-storage/issues/906
		REM sqlite_statement.obj : error LNK2001: unresolved external symbol sqlite3_column_table_name / sqlite3_column_decltype
	sed -i 's/SQLITE_OMIT_DECLTYPE/SQLITE_ENABLE_COLUMN_METADATA/g' %CYGPATH_SRC%/%1/CMakeLists.txt
		REM ICU include
	sed -i 's/INSTALL_INTERFACE:include^>/INSTALL_INTERFACE:include^> %PATH_INSTALL:\=\\/%\/include/g' %CYGPATH_SRC%/%1/CMakeLists.txt
		REM dirty !! https://stackoverflow.com/questions/9556676/batch-file-how-to-replace-equal-signs-and-a-string-variable
	set CUR=%%C
	setlocal enabledelayedexpansion
	set new=!CUR:"=!

	if %%C =="-DBUILD_SHARED_LIBS=ON -DBUILD_SHELL=OFF" (
		sed -i 's/STATIC sqlite3.c/SHARED sqlite3.c/g' %CYGPATH_SRC%/%1/CMakeLists.txt
	) else (
		sed -i 's/OUTPUT_NAME   sqlite3/OUTPUT_NAME   sqlite3_static/g' %CYGPATH_SRC%/%1/CMakeLists.txt
	)

	cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DSQLITE_ENABLE_DBSTAT_VTAB=ON ^
	-DSQLITE_ENABLE_FTS3=ON ^
	-DSQLITE_ENABLE_FTS4=ON ^
	-DSQLITE_ENABLE_FTS5=ON ^
	-DSQLITE_ENABLE_GEOPOLY=ON ^
	-DSQLITE_ENABLE_ICU=ON ^
	-DSQLITE_ENABLE_JSON1=ON ^
	-DSQLITE_ENABLE_MATH_FUNCTIONS=ON ^
	-DSQLITE_ENABLE_RBU=ON ^
	-DSQLITE_ENABLE_RTREE=ON ^
	-DSQLITE_ENABLE_STAT4=ON ^
	-DSQLITE_USE_URI=ON ^
	-DSQLITE_RECOMMENDED_OPTIONS=ON ^
	!new! ^
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
		REM ICU  lib
	sed -i 's/LINK_LIBRARIES =/LINK_LIBRARIES = %PATH_INSTALL:\=\\/%\/lib\/icuuc.lib %PATH_INSTALL:\=\\/%\/lib\/icuin.lib/g' %CYGPATH_BUILD%/%1/build.ninja	

	if %%C =="-DBUILD_SHARED_LIBS=OFF -DBUILD_SHELL=ON" (
		sed -i 's/SQLite3\.pdb/sqlite3_static\.pdb/g' %CYGPATH_BUILD%/%1/build.ninja
		%NINJA% sqlite3_static.lib
		for %%X in (CMakeFiles\SQLite3.dir\sqlite3_static.pdb sqlite3_static.lib) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%X %PATH_INSTALL%\lib\*)
	) else (
			REM https://sqlite.org/forum/info/9bfd09f4772035e7
		sed -i 's/DWIN32/DWIN32 \/DSQLITE_API=__declspec^(dllexport^)/g' %CYGPATH_BUILD%/%1/build.ninja
		%NINJA% install
		for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\sqlite3.%%X %PATH_INSTALL%\bin\*)
	)
)
xcopy /C /F /Y %PATH_SRC%\%1\sqlite3ext.h %PATH_INSTALL%\include\sqlite3\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\sqlite3.dll