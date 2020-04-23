call %PATH_MODULES_COMMON%\init.bat %1 cmake

cd /D %PATH_SRC%\%1
call buildconf.bat
cd /D %PATH_BUILD%\%1

cmake ^
-Wno-dev ^
-G "NMake Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DCARES_STATIC=ON ^
-DCARES_SHARED=ON ^
-DCARES_INSTALL=ON ^
-DCARES_STATIC_PIC=OFF ^
-DCARES_BUILD_TESTS=OFF ^
-DCARES_MSVC_STATIC_RUNTIME=OFF ^
%PATH_SRC%\%1 

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

move /y %PATH_INSTALL%\bin\cares_static.pdb %PATH_INSTALL%\lib\cares_static.pdb

	REM version
CD /D %PATH_SRC%\%1 
for /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set VERSION=%%F)
set VERSION=%VERSION:_=.%
for %%X in (cares acountry adig ahost) do (copy /Y %PATH_BUILD%\%1\bin\%%X.pdb %PATH_INSTALL%\bin\%%X.pdb)
for %%X in (cares.dll acountry.exe adig.exe ahost.exe) do (call %PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\bin\%%X "%VERSION:~6%")