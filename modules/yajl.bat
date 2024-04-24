@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

if exist %PATH_INSTALL%\lib\yajl_static.lib del /Q /F %PATH_INSTALL%\lib\yajl_static.lib
for %%X in (%PATH_BUILD%\%1\yajl-2.1.1\lib\yajl_static.lib %PATH_BUILD%\%1\src\CMakeFiles\yajl_static.dir\yajl_static.pdb) do (xcopy /C /F /Y %%X %PATH_INSTALL%\lib_unused\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\yajl.dll