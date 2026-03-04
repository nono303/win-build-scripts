@echo off && call %PATH_UTILS%\init.bat %1 cmake nocxx

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
-DCMAKE_UNITY_BUILD=1 ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_UTILS%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\yajl.dll