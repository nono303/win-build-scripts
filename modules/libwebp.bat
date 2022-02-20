@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

REM webp.lib                           vc140.pdb
REM webpdecoder.lib                    vc140.pdb
REM tiff build after but required
cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DCMAKE_DISABLE_FIND_PACKAGE_PkgConfig=ON ^
	-DGIF_LIBRARY=%PATH_INSTALL%\lib\giflib_static.lib ^
	-DWEBP_ENABLE_SIMD=ON ^
	-DWEBP_BUILD_ANIM_UTILS=ON ^
	-DWEBP_BUILD_CWEBP=ON ^
	-DWEBP_BUILD_DWEBP=ON ^
	-DWEBP_BUILD_GIF2WEBP=ON ^
	-DWEBP_BUILD_IMG2WEBP=ON ^
	-DWEBP_BUILD_VWEBP=ON ^
	-DWEBP_BUILD_WEBPINFO=ON ^
	-DWEBP_BUILD_LIBWEBPMUX=ON ^
	-DWEBP_BUILD_WEBPMUX=ON ^
	-DWEBP_BUILD_EXTRAS=ON ^
	-DWEBP_BUILD_WEBP_JS=OFF ^
	-DWEBP_USE_THREAD=ON ^
	-DWEBP_NEAR_LOSSLESS=ON ^
	-DWEBP_ENABLE_SWAP_16BIT_CSP=ON ^
	-DWEBP_UNICODE=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
for %%X in (build.ninja cmake_install.cmake) do (sed -i 's/webpmux.lib/libwebpmux.lib/g' %CYGPATH_BUILD%/%1/%%X)
%NINJA% install

for %%X in (cwebp dwebp gif2webp img2webp webpinfo webpmux vwebp) do (
	xcopy /C /F /Y %PATH_BUILD%\%1\%%X.pdb %PATH_INSTALL%\bin\*
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X.exe
)
for %%X in (webpdemux.dir\webpdemux.pdb libwebpmux.dir\libwebpmux.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\%%X %PATH_INSTALL%\lib\*)