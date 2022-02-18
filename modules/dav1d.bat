@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

meson ^
--prefix %PATH_INSTALL% ^
--buildtype debugoptimized ^
--default-library=static ^
-Dfuzzing_engine=none ^
-Denable_tests=false ^
-Dtestdata_tests=false ^
-Denable_examples=false ^
-Denable_tools=true ^
-Denable_avx512=false ^
-Denable_asm=true ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/meson.sh "%AVX:/=\/%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i -E 's/Fdsrc\\\libdav1d.*\.pdb"/Fdsrc\\\libdav1d.pdb" "\/FS"/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install

move /Y %PATH_INSTALL%\lib\libdav1d.a %PATH_INSTALL%\lib\libdav1d.lib
xcopy /C /F /Y %PATH_BUILD%\%1\src\libdav1d.pdb %PATH_INSTALL%\lib\libdav1d.pdb*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\dav1d.exe