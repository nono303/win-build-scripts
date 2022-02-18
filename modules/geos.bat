@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DBUILD_SHARED_LIBS=ON ^
	-DDISABLE_GEOS_INLINE=OFF ^
	-DBUILD_TESTING=OFF ^
	-DBUILD_BENCHMARKS=OFF ^
	-DBUILD_DOC=OFF ^
	%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for %%X in (geos.dll geos_c.dll geosop.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X
	xcopy /C /F /Y %PATH_BUILD%\%1\bin\%%~nX.pdb %PATH_INSTALL%\bin\*
)
