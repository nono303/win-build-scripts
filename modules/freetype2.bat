@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

REM	CMake Warning at builds/cmake/FindHarfBuzz.cmake:99 (message):
REM	  Required version (2.0.0) is higher than found version ()
REM	Call Stack (most recent call first):
REM	  CMakeLists.txt:215 (find_package)
sed -i 's/  find_package(HarfBuzz/# find_package(HarfBuzz/g' %CYGPATH_SRC%/%1/CMakeLists.txt

for %%S in (OFF ON) do (
	cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DBUILD_SHARED_LIBS=%%S ^
	-DFT_WITH_ZLIB=ON ^
	-DFT_WITH_BZIP2=ON ^
	-DFT_WITH_PNG=ON ^
	-DPNG_LIBRARY=%PATH_INSTALL%\lib\png_static.lib ^
	-DFT_WITH_HARFBUZZ=OFF ^
	-DFT_WITH_BROTLI=ON ^
	%PATH_SRC%\%1
		REM LNK4098: defaultlib 'MSVCRT' conflicts with use of other libs; use /NODEFAULTLIB:library
	REM sed -i 's/LTCG/LTCG \/NODEFAULTLIB:libcmt.lib/g' %PATH_BUILD%/%1/CMakeFiles/freetype.dir/build.make
	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	%NINJA% install
)

xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\freetype.dir\freetype.pdb %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_BUILD%\%1\freetype.pdb %PATH_INSTALL%\bin\*