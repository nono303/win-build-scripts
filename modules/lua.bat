call %PATH_MODULES_COMMON%\init.bat %1 cmake

sed -i 's/OUTPUT_NAME lua/OUTPUT_NAME liblua/g' %CYGPATH_SRC%/%1/CMakeLists.txt

cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DLUA_BUILD_WLUA=OFF ^
	-DLUA_BUILD_AS_DLL=ON ^
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	nmake %NMAKE_OPTS% clean install

xcopy /C /F /Y %PATH_BUILD%\%1\*.pdb %PATH_INSTALL%\bin\*
for %%X in (liblua.dll lua.exe luac.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)