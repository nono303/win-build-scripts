@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake ^
%CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
for %%Y in (cmake_install.cmake build.ninja) do (sed -i 's/-static\./_static\./g' %CYGPATH_BUILD%/%1/%%Y)
%NINJA% install

for %%X in (brotlicommon brotli brotlidec brotlienc) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%X.pdb %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\brotlicommon_static.dir\brotlicommon_static.pdb %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\brotlidec_static.dir\brotlidec_static.pdb %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\brotlienc_static.dir\brotlienc_static.pdb %PATH_INSTALL%\lib\*

for %%X in (brotlicommon.dll brotli.exe brotlidec.dll brotlienc.dll) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)