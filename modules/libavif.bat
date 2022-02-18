@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

REM AVIF_CODEC_AOM - requires CMake, NASM
REM AVIF_CODEC_DAV1D - requires Meson, Ninja, NASM
REM AVIF_CODEC_LIBGAV1 - requires CMake, Ninja
REM AVIF_CODEC_RAV1E - requires cargo (Rust), NASM


cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DCMAKE_DISABLE_FIND_PACKAGE_PkgConfig=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DAVIF_ENABLE_WERROR=OFF ^
-DAVIF_CODEC_AOM=ON ^
-DAVIF_CODEC_AOM_DECODE=ON ^
-DAVIF_CODEC_AOM_ENCODE=ON ^
-DAVIF_CODEC_DAV1D=ON ^
-DDAV1D_LIBRARY=%PATH_INSTALL:\=/%/lib/libdav1d.lib ^
-DAVIF_CODEC_LIBGAV1=ON ^
-DLIBGAV1_LIBRARY=%PATH_INSTALL:\=/%/lib/libgav1_static.lib ^
-DLIBGAV1_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DLIBYUV_LIBRARY=%PATH_INSTALL:\=/%/lib/yuv_static.lib ^
-DLIBYUV_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DAVIF_CODEC_RAV1E=OFF ^
-DAVIF_CODEC_SVT=OFF ^
-DAVIF_LOCAL_AOM=OFF ^
-DAVIF_LOCAL_DAV1D=OFF ^
-DAVIF_LOCAL_LIBGAV1=OFF ^
-DAVIF_LOCAL_RAV1E=OFF ^
-DAVIF_LOCAL_SVT=OFF ^
-DAVIF_LOCAL_ZLIBPNG=OFF ^
-DAVIF_LOCAL_JPEG=OFF ^
-DAVIF_LOCAL_LIBYUV=OFF ^
-DAVIF_BUILD_EXAMPLES=OFF ^
-DAVIF_BUILD_APPS=ON ^
-DAVIF_BUILD_TESTS=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX:/=\/%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for %%X in (avif.dll avifenc.exe avifdec.exe) do (
	xcopy /C /F /Y %PATH_BUILD%\%1\%%~nX.pdb %PATH_INSTALL%\bin\*
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X
)
xcopy /C /F /Y %PATH_BUILD%\%1\avif.pdb %PATH_INSTALL%\bin\*