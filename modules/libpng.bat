@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DPNG_BUILD_ZLIB=ON ^
-DZLIB_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DZLIB_LIBRARY=%PATH_INSTALL:\=/%/lib/zlib.lib ^
-DPNG_SHARED=ON ^
-DPNG_STATIC=ON ^
-DPNG_TESTS=OFF ^
-DPNG_FRAMEWORK=OFF ^
-DPNG_DEBUG=OFF ^
-DPNG_HARDWARE_OPTIMIZATIONS=ON ^
-Dld-version-script=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

move /y %PATH_INSTALL%\lib\libpng16_static.lib %PATH_INSTALL%\lib\png_static.lib
xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\png_static.dir\png_static.pdb %PATH_INSTALL%\lib\*
for %%E in (pngfix.pdb png-fix-itxt.pdb libpng16.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%E %PATH_INSTALL%\bin\*)
for %%X in (libpng16.dll png-fix-itxt.exe pngfix.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)