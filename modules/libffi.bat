@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

REM call call %PATH_BIN_CYGWIN%\bash --login -c '%CYGPATH_MODULES%/%1.sh %CYGPATH_SRC%/%1'

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	REM FAILED: unrecognized file format in 'CMakeFiles\libffi.dir\src\x86\ffiw64.c.obj, 0
sed -i 's/\/GL //g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%1.dll