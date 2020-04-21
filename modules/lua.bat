call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DLUA_BUILD_WLUA=OFF -DLUA_BUILD_AS_DLL=ON %PATH_SRC%\%1
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install
for %%X in (lua luac) do (copy /Y %PATH_BUILD%\%1\%%X.pdb %PATH_INSTALL%\bin\%%X.pdb)

	REM version
CD /D %PATH_SRC%\%1 
FOR /F "tokens=* USEBACKQ" %%F IN (`git describe --tags`) DO ( SET VERSION=%%F)
for %%X in (dll exe) do (%PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\bin\lua.%%X "%VERSION%.0" /pv "%VERSION%.0")
%BIN_VERPATCH% %PATH_INSTALL%\bin\luac.exe "%VERSION%"