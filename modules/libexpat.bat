@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_UNITY_BUILD=1 ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DEXPAT_BUILD_DOCS=OFF ^
-DEXPAT_BUILD_TESTS=OFF ^
-DEXPAT_BUILD_EXAMPLES=OFF ^
-DEXPAT_MSVC_STATIC_CRT=OFF ^
-DEXPAT_BUILD_TOOLS=OFF ^
-DEXPAT_ATTR_INFO=ON ^
-DEXPAT_LARGE_SIZE=ON ^
%PATH_SRC%\%1\expat

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\libexpat.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libexpat.dll