@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
%PATH_SRC%\%1 

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/\/DWIN32/\/DWIN32 \/DLIBRARY_EXPORTS=1/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% src\edit.dll

if not exist %PATH_INSTALL%\include\editline\. mkdir %PATH_INSTALL%\include\editline
xcopy /C /F /Y %PATH_SRC%\%1\src\editline\readline.h %PATH_INSTALL%\include\editline\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\edit.dll %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\edit.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\edit.lib %PATH_INSTALL%\lib\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\edit.dll