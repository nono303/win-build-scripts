@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DENABLE_TESTS=OFF ^
-DENABLE_TOOLS=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\xdiff.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\xdiff.dll