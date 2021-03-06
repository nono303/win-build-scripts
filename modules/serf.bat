@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

if %ARCH% == x64 (set SERF64=-DSERF_WIN64=ON )
	REM unimplemented: -DGSSAPI=%PATH_INSTALL%\ -DBROTLI=%PATH_INSTALL%\ -DLIBDIR=%PATH_INSTALL%\lib\ 
cmake %CMAKE_OPTS% ^
	%SERF64%^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DDEBUG=OFF ^
	-DSKIP_SHARED=OFF ^
	-DSKIP_STATIC=OFF ^
	-DDISABLE_LOGGING=OFF ^
	-DSKIP_TESTS=ON ^
	-DENABLE_SLOW_TESTS=OFF ^
	-DAPR_STATIC=OFF ^
	-DEXPAT=%PATH_INSTALL%\ ^
	-DAPR_ROOT=%PATH_INSTALL%\ ^
	-DAPRUtil_ROOT=%PATH_INSTALL%\ ^
	%PATH_SRC%\%1 

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install
xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\serf_static.dir\serf_static.pdb %PATH_INSTALL%\lib\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libserf-2.dll