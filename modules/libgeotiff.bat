@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=ON ^
-DWITH_ZLIB=ON ^
-DWITH_UTILITIES=OFF ^
-DWITH_TIFF=ON ^
-DWITH_JPEG=ON ^
-DWITH_TOWGS84=ON ^
-DBUILD_DOC=OFF ^
-DBUILD_MAN=OFF ^
-DLIB_SUFFIX= ^
%PATH_SRC%\%1\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\geotiff.dll