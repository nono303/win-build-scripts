call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM patch PHP7.4
sed -i 's/SQLITE_OMIT_DECLTYPE/SQLITE_ENABLE_COLUMN_METADATA/g' %CYGPATH_SRC%/%1/CMakeLists.txt

for %%C in ("-DBUILD_SHARED_LIBS=ON -DBUILD_SHELL=OFF" "-DBUILD_SHARED_LIBS=OFF -DBUILD_SHELL=ON") do (
		REM dirty !! https://stackoverflow.com/questions/9556676/batch-file-how-to-replace-equal-signs-and-a-string-variable
	set CUR=%%C
	SETLOCAL ENABLEDELAYEDEXPANSION
	set new=!CUR:"=!

	cmake ^
	-Wno-dev ^
	-G "NMake Makefiles" ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DBUILD_ENABLE_FTS3=ON ^
	-DBUILD_ENABLE_DBSTAT_VTAB=ON ^
	!new! ^
	-DBUILD_ENABLE_RBU=ON ^
	-DBUILD_ENABLE_RTREE=ON ^
	-DBUILD_ENABLE_JSON1=ON ^
	-DBUILD_ENABLE_ICU=OFF ^
	-DBUILD_ENABLE_FTS5=ON ^
	%PATH_SRC%\%1 

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	nmake %NMAKE_OPTS% clean install
)

copy /Y %PATH_BUILD%\%1\sqlite3.dll %PATH_INSTALL%\bin\sqlite3.dll
copy /Y %PATH_BUILD%\%1\sqlite3.pdb %PATH_INSTALL%\bin\sqlite3.pdb
copy /Y %PATH_SRC%\%1\sqlite3ext.h %PATH_INSTALL%\include\sqlite3\sqlite3ext.h

	REM version
CD /D %PATH_SRC%\%1 
for /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set VERSION=%%F)
for %%X in (dll exe) do (call %PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\bin\sqlite3.%%X %VERSION%)