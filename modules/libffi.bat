@echo off && call %PATH_UTILS%\init.bat %1 cmake nocxx
set TARGET_CONFIG=x86_64-pc-cygwin

REM /c/sdk/src/libffi (master)
REM git add -N CMakeLists.txt
REM git add -f -N x86_64-pc-cygwin/fficonfig.h
REM git add -f -N x86_64-pc-cygwin/include/ffi.h
REM git add -f -N x86_64-pc-cygwin/include/ffitarget.h
REM git checkout HEAD configure.ac
REM git diff > /c/sdk/batch/patches/libffi.patch
REM call %PATH_BIN_CYGWIN%\bash --login -c '%CYGPATH_MODULES%/%1.sh %CYGPATH_SRC%/%1 %TARGET_CONFIG%

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=ON ^
-DTARGET_CONFIG=%TARGET_CONFIG% ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_UTILS%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%1.dll