@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DPNG_BUILD_ZLIB=OFF ^
-DZLIB_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DZLIB_LIBRARY=%PATH_INSTALL:\=/%/lib/zlib.lib ^
-DPNG_SHARED=ON ^
-DPNG_STATIC=OFF ^
-DPNG_TESTS=OFF ^
-DPNG_FRAMEWORK=OFF ^
-DPNG_DEBUG=OFF ^
-DPNG_HARDWARE_OPTIMIZATIONS=ON ^
-Dld-version-script=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	REM cl nologo for genout
sed -i 's/CMAKE_C_FLAGS \//CMAKE_C_FLAGS \/nologo \//g' %CYGPATH_BUILD%/%1/scripts/genout.cmake
%NINJA% install

for %%E in (pngfix.pdb png-fix-itxt.pdb libpng16.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%E %PATH_INSTALL%\bin\*)
for %%X in (libpng16.dll png-fix-itxt.exe pngfix.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)