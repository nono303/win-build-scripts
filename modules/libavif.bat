call %PATH_MODULES_COMMON%\init.bat %1 cmake

REM AVIF_CODEC_AOM - requires CMake, NASM
REM AVIF_CODEC_DAV1D - requires Meson, Ninja, NASM
REM AVIF_CODEC_LIBGAV1 - requires CMake, Ninja
REM AVIF_CODEC_RAV1E - requires cargo (Rust), NASM

cd /D %PATH_SRC%\%1\ext\
if not exist %PATH_SRC%\%1\ext\aom\. call %PATH_SRC%\%1\ext\aom.cmd
if not exist %PATH_SRC%\%1\ext\libgav1\. call %PATH_SRC%\%1\ext\libgav1.cmd
REM if not exist %PATH_SRC%\%1\ext\libyuv\. call %PATH_SRC%\%1\ext\libyuv.cmd
cd /D %PATH_BUILD%\%1

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=ON ^
-DAVIF_ENABLE_WERROR=ON ^
-DAVIF_CODEC_AOM=ON ^
-DAVIF_CODEC_DAV1D=OFF ^
-DAVIF_CODEC_LIBGAV1=ON ^
-DAVIF_CODEC_RAV1E=OFF ^
-DAVIF_CODEC_SVT=OFF ^
-DAVIF_CODEC_AOM_DECODE=ON ^
-DAVIF_CODEC_AOM_ENCODE=ON ^
-DAVIF_LOCAL_AOM=ON ^
-DAVIF_LOCAL_DAV1D=OFF ^
-DAVIF_LOCAL_LIBGAV1=ON ^
-DAVIF_LOCAL_RAV1E=OFF ^
-DAVIF_LOCAL_SVT=OFF ^
-DAVIF_LOCAL_ZLIBPNG=OFF ^
-DAVIF_LOCAL_JPEG=OFF ^
-DAVIF_LOCAL_LIBYUV=OFF ^
-DAVIF_BUILD_EXAMPLES=OFF ^
-DAVIF_BUILD_APPS=OFF ^
-DAVIF_BUILD_TESTS=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install
