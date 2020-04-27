call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake ^
-Wno-dev ^
-G "NMake Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
%PATH_SRC%\%1 

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

	REM TODO C:\sdk\src\wineditline\CMakeLists.txt
set VERSION=2.2
for /f "tokens=*" %%G in ('dir %PATH_SRC%\%1\bin%CYGV%\*.dll %PATH_SRC%\%1\bin%CYGV%\*.exe /b') do (
	call %PATH_MODULES_COMMON%\version.bat %PATH_SRC%\%1\bin%CYGV%\%%G "%VERSION%"
	xcopy /C /F /Y %PATH_SRC%\%1\bin%CYGV%\%%G %PATH_INSTALL%\bin\*
)

xcopy /C /F /Y %PATH_SRC%\%1\bin%CYGV%\*.lib %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_SRC%\%1\src\editline\*.h %PATH_INSTALL%\include\*

xcopy /C /F /Y %PATH_BUILD%\%1\src\edit_test_dll.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\edit.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\edit.pdb %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\edit_test.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\CMakeFiles\edit_static.dir\edit_static.pdb %PATH_INSTALL%\lib\*