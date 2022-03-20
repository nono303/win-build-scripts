@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

REM -Denable_asm=true + --default-library=shared == KO
meson ^
--prefix %PATH_INSTALL% ^
--buildtype debugoptimized ^
--default-library=shared ^
-Dbitdepths=8 ^
-Denable_asm=true ^
-Denable_tools=true ^
-Denable_examples=false ^
-Denable_tests=false ^
-Denable_docs=false ^
-Dlogging=true ^
-Dtestdata_tests=false ^
-Dfuzzing_engine=none ^
-Dstack_alignment=0 ^
-Dxxhash_muxer=auto ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/meson.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% src/dav1d.dll

for %%X in (dll pdb) do (xcopy /C /F /Y  %PATH_BUILD%\%1\src\dav1d.%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y  %PATH_BUILD%\%1\src\dav1d.lib %PATH_INSTALL%\lib\*
if not exist %PATH_INSTALL%\include\dav1d\. mkdir %PATH_INSTALL%\include\dav1d
xcopy /C /F /Y %PATH_SRC%\%1\include\dav1d\*.h %PATH_INSTALL%\include\dav1d\*
xcopy /C /F /Y %PATH_BUILD%\%1\include\dav1d\version.h %PATH_INSTALL%\include\dav1d\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\dav1d.dll