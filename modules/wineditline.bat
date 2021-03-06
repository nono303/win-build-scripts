call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	%PATH_SRC%\%1 

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"

nmake %NMAKE_OPTS% clean install

for /f "tokens=*" %%G in ('dir %PATH_SRC%\%1\bin%CYGV%\*.dll %PATH_SRC%\%1\bin%CYGV%\*.exe /b') do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\bin%CYGV%\%%G
	xcopy /C /F /Y %PATH_SRC%\%1\bin%CYGV%\%%G %PATH_INSTALL%\bin\*
)
for %%D in (bin lib) do (xcopy /C /F /Y %PATH_SRC%\%1\%%D%CYGV%\*.* %PATH_INSTALL%\%%D\*)
if not exist %PATH_INSTALL%\include\editline\. mkdir %PATH_INSTALL%\include\editline
xcopy /C /F /Y %PATH_SRC%\%1\include\editline\readline.h %PATH_INSTALL%\include\editline\*

xcopy /C /F /Y %PATH_BUILD%\%1\src\edit_test_dll.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\edit_test.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\edit.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\CMakeFiles\edit_static.dir\edit_static.pdb %PATH_INSTALL%\lib\*