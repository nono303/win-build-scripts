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
for %%Y in (cmake_install.cmake build.ninja) do (sed -i 's/-static\./_static\./g' %CYGPATH_BUILD%/%1/%%Y)
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