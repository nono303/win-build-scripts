@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake
	REM https://stackoverflow.com/questions/29505121/cmake-zlib-build-on-windows
if %ARCH% == x86 (cmake %CMAKE_OPTS% -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DASM686=ON %PATH_SRC%\%1)
if %ARCH% == x64 (cmake %CMAKE_OPTS% -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DAMD64=ON %PATH_SRC%\%1)
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX:/=\/%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install
xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\zlibstatic.dir\zlibstatic.pdb %PATH_INSTALL%\lib\zlibstatic.pdb*
xcopy /C /F /Y %PATH_BUILD%\%1\zlib.pdb %PATH_INSTALL%\bin\zlib1.pdb*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\zlib1.dll