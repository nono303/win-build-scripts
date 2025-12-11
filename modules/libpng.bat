@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DPNG_BUILD_ZLIB=OFF ^
-DPNG_SHARED=ON ^
-DPNG_EXECUTABLES=OFF ^
-DPNG_TOOLS=OFF ^
-DPNG_STATIC=OFF ^
-DPNG_TESTS=OFF ^
-DPNG_FRAMEWORK=OFF ^
-DPNG_HARDWARE_OPTIMIZATIONS=ON ^
-Dld-version-script=OFF ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	REM cl nologo for genout
sed -i 's/CMAKE_C_FLAGS \//CMAKE_C_FLAGS \/nologo \//g' %CYGPATH_BUILD%/%1/scripts/cmake/genout.cmake
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\libpng16.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libpng16.dll
if exist %PATH_INSTALL%\lib\cmake\%1\. rmdir /S /Q %PATH_INSTALL%\lib\cmake\%1
move /Y %PATH_INSTALL%\lib\%1 %PATH_INSTALL%\lib\cmake\%1