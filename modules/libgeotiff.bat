@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=ON ^
-DWITH_UTILITIES=OFF ^
-DWITH_TOWGS84=ON ^
-DBUILD_DOC=OFF ^
-DBUILD_MAN=OFF ^
-DINTERFACE_LIB_PREFIX= ^
%PATH_SRC%\%1\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\geotiff.dll