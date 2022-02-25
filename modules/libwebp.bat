@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake
REM goto shared
cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DCMAKE_DISABLE_FIND_PACKAGE_PkgConfig=ON ^
	-DGIF_LIBRARY=%PATH_INSTALL%\lib\giflib_static.lib ^
	-DBUILD_SHARED_LIBS=ON ^
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
sed -i -E 's/WEBP_EXTERN extern/WEBP_EXTERN __declspec^(dllexport^)/g' %CYGPATH_SRC%/%1/src/webp/types.h
%NINJA% webp.dll
for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\webp.%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_BUILD%\%1\webp.lib %PATH_INSTALL%\lib\*
if not exist %PATH_INSTALL%\include\webp\. mkdir %PATH_INSTALL%\include\webp
for %%X in (decode.h types.h decode.h encode.h types.h decode.h demux.h mux_types.h types.h mux.h mux_types.h types.h) do (xcopy /C /F /Y %PATH_SRC%\%1\src\webp\%%X %PATH_INSTALL%\include\webp\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\webp.dll

exit /B

:cmakestatic
	REM fix /lib pdb: webp.lib > vc140.pdb / webpdecoder.lib > vc140.pdb / webpmux.lib > libwebpmux.pdb
for %%X in (webp webpdecoder webpdemux webpmux) do (
	sed -i -E 's/%%X\.lib/%%X_static\.lib/g' %CYGPATH_BUILD%/%1/build.ninja
	sed -i -E 's/TARGET_COMPILE_PDB.*/TARGET_COMPILE_PDB = %%~nX_static\.pdb/g' %CYGPATH_BUILD%/%1/build.ninja
	%NINJA% %%X.dll
	move /Y %PATH_BUILD%\%1\%%X_static.lib %PATH_INSTALL%\lib\%%X_static.lib
	move /Y %PATH_BUILD%\%1\%%X_static.pdb %PATH_INSTALL%\lib\%%X_static.pdb
	del /S %PATH_BUILD%\%1\*.obj
)

:nmakeshared
	REM release-dynamic : pdb issue
cd /D %PATH_SRC%\%1

if not [%AVX%] == [] set AVXDEF=%AVX:/=\/%
sed -i 's/\/W3/\/w \/Zi \/Zf \/GL \/MP%NUMBER_OF_PROCESSORS% %AVXDEF%/g'  %CYGPATH_SRC%/%1/Makefile.vc
sed -i 's/DYNAMICBASE/DYNAMICBASE \/LTCG \/OPT:REF,ICF/g'  %CYGPATH_SRC%/%1/Makefile.vc
sed -i 's/lib\.exe/lib\.exe \/LTCG/g'  %CYGPATH_SRC%/%1/Makefile.vc
sed -i 's/link\.exe \/DLL/link\.exe \/DLL \/PDB:libwebp\.pdb \/LTCG \/OPT:REF,ICF/g'  %CYGPATH_SRC%/%1/Makefile.vc
sed -i 's/_dll\.pdb/\.pdb/g'  %CYGPATH_SRC%/%1/Makefile.vc

set nmakewepbcfg=release-dynamic
nmake %NMAKE_OPTS% /f Makefile.vc CFG=%nmakewepbcfg% OBJDIR=%PATH_BUILD%\%1 UNICODE=1 all

for %%X in (%nmakewepbcfg%\%ARCH%\lib\libwebp.pdb %nmakewepbcfg%\%ARCH%\bin\libwebp.dll %nmakewepbcfg%\%ARCH%\bin\libwebpdecoder.dll %nmakewepbcfg%\%ARCH%\bin\libwebpdemux.dll %nmakewepbcfg%\%ARCH%\bin\libwebpmux.dll) do (
	xcopy /C /F /Y %PATH_BUILD%\%1\%%X %PATH_INSTALL%\bin\*
)
for %%X in (libwebp.dll libwebpdecoder.dll libwebpdemux.dll libwebpmux.dll) do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X
)
for %%X in (%nmakewepbcfg%\%ARCH%\lib\libwebpdecoder_dll.lib %nmakewepbcfg%\%ARCH%\lib\libwebpdemux_dll.lib %nmakewepbcfg%\%ARCH%\lib\libwebpmux_dll.lib %nmakewepbcfg%\%ARCH%\lib\libwebp_dll.lib) do (
	xcopy /C /F /Y %PATH_BUILD%\%1\%%X %PATH_INSTALL%\lib\*
)