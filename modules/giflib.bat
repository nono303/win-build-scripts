@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

set VCDIR=5.2.1
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
%PATH_SRC%\%1\%VCDIR%

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA%

for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\lib\giflib.%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\lib\giflib.lib %PATH_INSTALL%\lib\*
for %%X in (gif_lib.h gif_hash.h) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\source\%%X %PATH_INSTALL%\include\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\giflib.dll