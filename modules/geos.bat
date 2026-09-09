@echo off && call %PATH_UTILS%\init.bat %1 cmake

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_TESTING=OFF ^
-DBUILD_BENCHMARKS=OFF ^
-DGEOS_BUILD_DEVELOPER=OFF ^
-DUSE_CCACHE=OFF ^
-DVERSION_MINGW_SHARED_LIBS=OFF ^
-DBUILD_WEBSITE=OFF ^
-DBUILD_DOCUMENTATION=OFF ^
-DBUILD_ASTYLE=OFF ^
-DBUILD_GEOSOP=ON ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash --login -c '%CYGPATH_UTILS%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"'
%NINJA% install

for %%X in (geos.dll geos_c.dll geosop.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X
	call %PATH_UTILS%\fileutils cp %PATH_BUILD%\%1\bin\%%~nX.pdb %PATH_INSTALL%\bin\*
)
