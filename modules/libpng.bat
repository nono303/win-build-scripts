@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DPNG_BUILD_ZLIB=OFF ^
-DZLIB_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DZLIB_LIBRARY=%PATH_INSTALL:\=/%/lib/zlib.lib ^
-DPNG_SHARED=ON ^
-DPNG_EXECUTABLES=OFF ^
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

xcopy /C /F /Y %PATH_BUILD%\%1\libpng16.pdb %PATH_INSTALL%\bin\*
move /Y %PATH_INSTALL%\lib\%1 %PATH_INSTALL%\lib\cmake\%1
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libpng16.dll