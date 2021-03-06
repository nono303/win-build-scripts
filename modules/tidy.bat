call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM static rename
sed -i 's/${LIB_NAME}s/${LIB_NAME}_a/g' %CYGPATH_SRC%/%1/CMakeLists.txt
sed -i 's/tidy-static/tidy_a/g' %CYGPATH_SRC%/%1/CMakeLists.txt
	REM shared rename
sed -i 's/OUTPUT_NAME ${LIB_NAME} /OUTPUT_NAME lib${LIB_NAME} /g' %CYGPATH_SRC%/%1/CMakeLists.txt

cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DBUILD_SHARED_LIB=ON ^
	-DTIDY_CONSOLE_SHARED=OFF ^
	-DBUILD_TAB2SPACE=OFF ^
	-DBUILD_SAMPLE_CODE=OFF ^
	-DTIDY_COMPAT_HEADERS=ON ^
	-DSUPPORT_LOCALIZATIONS=ON ^
	-DSUPPORT_CONSOLE_APP=ON ^
	-DENABLE_DEBUG_LOG=OFF ^
	-DENABLE_ALLOC_DEBUG=OFF ^
	-DENABLE_MEMORY_DEBUG=OFF ^
	-DENABLE_CRTDBG_MEMORY=OFF ^
	-DUSE_STATIC_RUNTIME=OFF ^
	-DADD_SYSTEM_RUNTIMES=OFF ^
	%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"

nmake %NMAKE_OPTS% clean install

xcopy /C /F /Y %PATH_BUILD%\%1\*.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\tidy_a.dir\tidy_a.pdb %PATH_INSTALL%\lib\*
for %%X in (tidy.exe libtidy.dll) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)