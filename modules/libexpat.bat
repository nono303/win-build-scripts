@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DEXPAT_BUILD_DOCS=OFF ^
	-DEXPAT_BUILD_TESTS=OFF ^
	-DEXPAT_BUILD_EXAMPLES=OFF ^
	-DEXPAT_MSVC_STATIC_CRT=OFF ^
	-DEXPAT_BUILD_TOOLS=OFF %PATH_SRC%\%1\expat

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\libexpat.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libexpat.dll