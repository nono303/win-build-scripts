@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DENABLE_SHARED=1 ^
-DENABLE_STATIC=0 ^
-DREQUIRE_SIMD=1 ^
-DWITH_ARITH_DEC=1 ^
-DWITH_ARITH_ENC=1 ^
-DWITH_JAVA=0 ^
-DWITH_JPEG7=1 ^
-DWITH_JPEG8=1 ^
-DWITH_SIMD=1 ^
-DWITH_TURBOJPEG=1 ^
-DWITH_FUZZ=0 ^
-DWITH_CRT_DLL=0 ^
-DFORCE_INLINE=1 ^
-DNEON_INTRINSICS=0 ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
for %%Y in (cmake_install.cmake build.ninja) do (sed -i 's/-static\./_static\./g' %CYGPATH_BUILD%/%1/%%Y)
REM fix unexistant option -nologo for nasm
sed -i 's/ -nologo//g' %CYGPATH_BUILD%/%1/build.ninja

for %%X in (dll pdb) do (
	for %%Y in (sharedlib/cmake_install.cmake build.ninja) do (sed -i 's/jpeg8\.%%X/jpeg\.%%X/g' %CYGPATH_BUILD%/%1/%%Y)
)

for %%X in (turbojpeg jpeg) do (
	sed -i -E 's/TARGET_COMPILE_PDB.*/TARGET_COMPILE_PDB = %%X\.pdb/g' %CYGPATH_BUILD%/%1/build.ninja
	%NINJA% %%X
	move /Y %PATH_BUILD%\%1\%%X.lib %PATH_INSTALL%\lib\%%X.lib
	for %%Y in (pdb dll) do (move /Y %PATH_BUILD%\%1\%%X.%%Y %PATH_INSTALL%\bin\%%X.%%Y)
	del /S %PATH_BUILD%\%1\*.obj
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X.dll
)
for %%X in (%PATH_BUILD%\%1\jconfig.h %PATH_SRC%\%1\jerror.h %PATH_SRC%\%1\jmorecfg.h %PATH_SRC%\%1\jpeglib.h %PATH_SRC%\%1\turbojpeg.h) do (
	xcopy /C /F /Y %%X %PATH_INSTALL%\include\*
)