@echo off && call %PATH_UTILS%\init.bat %1 cmake nocxx

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DZLIB_BUILD_ADA=OFF ^
-DZLIB_BUILD_BLAST=OFF ^
-DZLIB_BUILD_IOSTREAM3=OFF ^
-DZLIB_BUILD_MINIZIP=OFF ^
-DZLIB_BUILD_PUFF=OFF ^
-DZLIB_BUILD_SHARED=ON ^
-DZLIB_BUILD_STATIC=ON ^
-DZLIB_BUILD_TESTING=OFF ^
-DZLIB_BUILD_TESTZLIB=OFF ^
-DZLIB_BUILD_ZLIB1_DLL=OFF ^
-DZLIB_INSTALL=ON ^
-DZLIB_WITH_CRC32VX=OFF ^
-DZLIB_WITH_GVMAT64=OFF ^
-DZLIB_WITH_INFBACK9=OFF ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash --login -c '%CYGPATH_UTILS%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"'
sed -i 's/zlibstatic.pdb/libzs.pdb/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libz.dll
call %PATH_UTILS%\fileutils mv %PATH_INSTALL%\lib\libzs.lib %PATH_INSTALL%\%DIR_LIB_STATIC%\libzs.lib
call %PATH_UTILS%\fileutils cp %PATH_BUILD%\%1\CMakeFiles\zlibstatic.dir\libzs.pdb %PATH_INSTALL%\%DIR_LIB_STATIC%\*