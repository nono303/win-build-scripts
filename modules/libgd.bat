@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake
 cd /D %PATH_SRC%\%1
git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\%1_pr692.patch

cd /D %PATH_BUILD%\%1
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DENABLE_GD_FORMATS=ON ^
-DENABLE_PNG=ON ^
-DENABLE_LIQ=OFF ^
-DENABLE_JPEG=ON ^
-DENABLE_TIFF=ON ^
-DENABLE_ICONV=ON ^
-DENABLE_XPM=ON ^
-DENABLE_FREETYPE=ON ^
-DENABLE_FONTCONFIG=OFF ^
-DENABLE_WEBP=ON ^
-DENABLE_HEIF=ON ^
-DENABLE_AVIF=ON ^
-DENABLE_RAQM=OFF ^
-DENABLE_ASAN=OFF ^
-DENABLE_CPP=ON ^
-DVERBOSE_MAKEFILE=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_STATIC_LIBS=OFF ^
-DWEBP_LIBRARY=%PATH_INSTALL%\lib\webp.lib ^
-DWEBP_INCLUDE_DIR=%PATH_INSTALL%\lib\include ^
-DXPM_LIBRARY=%PATH_INSTALL%\lib\libxpm.lib ^
-DXPM_XPM_INCLUDE_DIR=%PATH_INSTALL%\lib\include ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
for %%Y in (cmake_install.cmake build.ninja) do (sed -i 's/-static\./_static\./g' %CYGPATH_BUILD%/%1/%%Y)
%NINJA% install

for %%X in (bdftogd gd2copypal.exe gd2togif.exe gd2topng.exe gdcmpgif.exe gdparttopng.exe gdtopng.exe giftogd2.exe pngtogd.exe pngtogd2.exe) do (DEL /Q /F %PATH_INSTALL%\bin\%%X)
xcopy /C /F /Y %PATH_BUILD%\%1\Bin\libgd.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libgd.dll

exit /B
