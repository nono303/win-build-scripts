call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake ^
-Wno-dev ^
-G "NMake Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/libev.sh "%CYGPATH_BUILD%/%1"
nmake %NMAKE_OPTS%

copy /Y %PATH_BUILD%\%1\libev_static.lib %PATH_INSTALL%\lib\libev_static.lib
copy /Y %PATH_BUILD%\%1\CMakeFiles\libev_static.dir\libev_static.pdb %PATH_INSTALL%\lib\libev_static.pdb
copy /Y %PATH_BUILD%\%1\libev.dll %PATH_INSTALL%\bin\libev.dll
copy /Y %PATH_BUILD%\%1\libev.pdb %PATH_INSTALL%\bin\libev.pdb
copy /Y %PATH_SRC%\%1\ev.h %PATH_INSTALL%\include\ev.h

	REM version
for /f %%i in ('FINDSTR /C:"AM_INIT_AUTOMAKE" C:\sdk\src\libev\configure.ac') do for /F "tokens=1,2,3 delims=,\)" %%a in ("%%i") do set VERSION=%%b
%BIN_VERPATCH% /va %PATH_INSTALL%\bin\libev.dll "%VERSION%.0.0" /pv "%VERSION%.0.0")