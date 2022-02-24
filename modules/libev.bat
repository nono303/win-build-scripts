@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=1 ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/-GS -W4 -wd4251 -wd4275/\/Zc:inline \/EHsc -w/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA%

for %%X in (libev_static.lib libev.lib CMakeFiles\libev_static.dir\libev_static.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%X %PATH_INSTALL%\lib\*)
for %%X in (pdb dll) do (xcopy /C /F /Y %PATH_BUILD%\%1\libev.%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_SRC%\%1\ev.h %PATH_INSTALL%\include\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%1.dll