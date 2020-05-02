@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake ^
%CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DUSE_URANDOM=OFF ^
-DJANSSON_EXAMPLES=OFF ^
-DJANSSON_BUILD_DOCS=OFF ^
-DJANSSON_BUILD_SHARED_LIBS=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

xcopy /C /F /Y %PATH_BUILD%\%1\bin\jansson.pdb %PATH_INSTALL%\bin\*

	REM version
CD /D %PATH_SRC%\%1 
for /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set VERSION=%%F)
call %PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\bin\jansson.dll "%VERSION:~1%"