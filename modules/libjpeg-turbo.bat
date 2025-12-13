@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DENABLE_SHARED=ON ^
-DENABLE_STATIC=OFF ^
-DWITH_ARITH_DEC=ON ^
-DWITH_ARITH_ENC=ON ^
-DWITH_JPEG7=ON ^
-DWITH_JPEG8=ON ^
-DWITH_TURBOJPEG=ON ^
-DREQUIRE_SIMD=ON ^
-DWITH_SIMD=ON ^
-DWITH_JAVA=OFF ^
-DWITH_FUZZ=OFF ^
-DWITH_CRT_DLL=OFF ^
-DFORCE_INLINE=ON ^
-DWITH_TESTS=OFF ^
-DWITH_TOOLS=OFF ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

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
for %%X in (%PATH_BUILD%\%1\jconfig.h %PATH_SRC%\%1\src\jerror.h %PATH_SRC%\%1\src\jmorecfg.h %PATH_SRC%\%1\src\jpeglib.h %PATH_SRC%\%1\src\turbojpeg.h) do (
	xcopy /C /F /Y %%X %PATH_INSTALL%\include\*
)