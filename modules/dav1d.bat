@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

REM -Denable_asm=true + --default-library=shared == KO
meson ^
--prefix %PATH_INSTALL% ^
--buildtype debugoptimized ^
--default-library=shared ^
-Dfuzzing_engine=none ^
-Denable_tests=false ^
-Dtestdata_tests=false ^
-Denable_examples=false ^
-Denable_tools=true ^
-Denable_avx512=false ^
-Denable_asm=false ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/meson.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\dav1d.exe