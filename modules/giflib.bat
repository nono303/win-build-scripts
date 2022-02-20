@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

set VCDIR=5.2.1
sed -i 's/GifLib/giflib_static/g' %CYGPATH_SRC%/%1/%VCDIR%/CMakeLists.txt
cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
%PATH_SRC%\%1\%VCDIR%

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA%

for %%X in (%PATH_BUILD%\%1\CMakeFiles\giflib_static.dir\giflib_static.pdb %PATH_SRC%\%1\%VCDIR%\lib\giflib_static.lib) do (xcopy /C /F /Y %%X %PATH_INSTALL%\lib\*)
for %%X in (gif_lib.h gif_hash.h) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\include\%%X %PATH_INSTALL%\include\*)