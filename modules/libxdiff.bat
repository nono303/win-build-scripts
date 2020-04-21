call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake ^
-Wno-dev ^
-G "NMake Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DENABLE_TESTS=OFF ^
-DENABLE_TOOLS=OFF ^
%PATH_SRC%\libxdiff

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

copy /Y %PATH_BUILD%\%1\xdiff.pdb %PATH_INSTALL%\bin

	REM version
CD /D %PATH_SRC%\%1 
FOR /F "tokens=* USEBACKQ" %%F IN (`git describe --tags`) DO (SET VERSION=%%F)
%PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\bin\xdiff.dll "%VERSION:~1%"