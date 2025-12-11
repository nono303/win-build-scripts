@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cd /D %PATH_SRC%\%1
REM https://github.com/libgd/libgd/pull/
for /f "tokens=*" %%P in ('dir %PATH_PATCHES%\libgd\pr*.patch /s/b') do (call %PATH_UTILS%\gitapply %%P)
cd /D %PATH_BUILD%\%1

REM missing libraqm, libfontconfig, libimagequant
if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DENABLE_GD_FORMATS=ON ^
-DENABLE_PNG=ON ^
-DENABLE_LIQ=OFF ^
-DENABLE_JPEG=ON ^
-DENABLE_TIFF=ON ^
-DENABLE_ICONV=ON ^
-DENABLE_XPM=ON ^
-DENABLE_FREETYPE=ON ^
-DENABLE_FONTCONFIG=OFF ^
-DENABLE_WEBP=ON ^
-DENABLE_HEIF=ON ^
-DENABLE_AVIF=ON ^
-DENABLE_RAQM=OFF ^
-DENABLE_ASAN=OFF ^
-DENABLE_CPP=ON ^
-DVERBOSE_MAKEFILE=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_STATIC_LIBS=OFF ^
-DBUILD_TESTS=OFF ^
-DBUILD_PROGRAMS=OFF ^
-DBUILD_EXEMPLES=OFF ^
-DBUILD_DOCS=OFF ^
-DBUILD_CPACK=OFF ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"

%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\Bin\libgd.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libgd.dll