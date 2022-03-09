@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=ON ^
-DFT_DISABLE_ZLIB=OFF ^
-DFT_DISABLE_BZIP2=OFF ^
-DFT_DISABLE_BROTLI=OFF ^
-DFT_DISABLE_HARFBUZZ=ON ^
-DFT_DISABLE_PNG=OFF ^
-DPNG_LIBRARY=%PATH_INSTALL%\lib\libpng16.lib ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\freetype.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\freetype.dll