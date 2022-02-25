@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DENABLE_SHARED=TRUE ^
-DENABLE_STATIC=TRUE ^
-DREQUIRE_SIMD=FALSE ^
-DWITH_12BIT=FALSE ^
-DWITH_ARITH_DEC=TRUE ^
-DWITH_ARITH_ENC=TRUE ^
-DWITH_JAVA=FALSE ^
-DWITH_JPEG7=FALSE ^
-DWITH_JPEG8=TRUE ^
-DWITH_MEM_SRCDST=TRUE ^
-DWITH_SIMD=TRUE ^
-DWITH_TURBOJPEG=TRUE ^
-DWITH_FUZZ=FALSE ^
-DWITH_CRT_DLL=FALSE ^
-DFORCE_INLINE=TRUE ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/\/w \/wd4996 \/MT //g' %CYGPATH_BUILD%/%1/build.ninja
for %%Y in (cmake_install.cmake build.ninja) do (sed -i 's/-static\./_static\./g' %CYGPATH_BUILD%/%1/%%Y)
for %%Y in (sharedlib/cmake_install.cmake build.ninja) do (sed -i 's/jpeg8\.dll/jpeg\.dll/g' %CYGPATH_BUILD%/%1/%%Y)
%NINJA% install
for %%E in (jpeg.lib CMakeFiles\jpeg_static.dir\jpeg_static.pdb CMakeFiles\turbojpeg_static.dir\turbojpeg_static.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%E %PATH_INSTALL%\lib\*)
for %%E in (djpeg.pdb jpegtran.pdb rdjpgcom.pdb tjbench.pdb cjpeg.pdb wrjpgcom.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%E %PATH_INSTALL%\bin\*)
for %%X in (turbojpeg.dll tjbench.exe rdjpgcom.exe wrjpgcom.exe jpeg.dll cjpeg.exe djpeg.exe jpegtran.exe wrjpgcom.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)