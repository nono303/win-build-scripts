call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DGIT_EXECUTABLE=%PATH_BIN_GIT%\git.exe -DEVENT__DISABLE_DEBUG_MODE=ON -DEVENT__DISABLE_THREAD_SUPPORT=OFF -DEVENT__DISABLE_OPENSSL=OFF -DEVENT__DISABLE_BENCHMARK=ON -DEVENT__DISABLE_TESTS=ON -DEVENT__DISABLE_REGRESS=ON -DEVENT__DISABLE_SAMPLES=ON -DEVENT__COVERAGE=OFF %PATH_SRC%\%1
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"

nmake %NMAKE_OPTS% clean install

	REM version
CD /D %PATH_SRC%\%1 
for /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set VERSION=%%F)
for /F "tokens=2 delims=-" %%a in ("%VERSION%") do set VERSION=%%a
	REM copy
for %%F in (event event_extra event_openssl event_core) do (
	call %PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\lib\%%F.dll "%VERSION%"
	move /Y %PATH_INSTALL%\lib\%%F.dll %PATH_INSTALL%\bin\%%F.dll
	xcopy /C /F /Y %PATH_BUILD%\%1\bin\%%F.pdb %PATH_INSTALL%\bin\*
	xcopy /C /F /Y %PATH_BUILD%\%1\bin\%%F.pdb %PATH_INSTALL%\lib\*
)