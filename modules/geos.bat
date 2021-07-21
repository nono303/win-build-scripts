@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DBUILD_SHARED_LIBS=ON ^
	-DBUILD_BENCHMARKS=OFF ^
	-DDISABLE_GEOS_INLINE=OFF ^
	-DBUILD_TESTING=OFF ^
	-S %PATH_SRC%\%1 ^
	-B . ^
	-G "NMake Makefiles" 
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% geos geos_c

for %%X in (geos geos_c) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_BUILD%\%1\bin\%%X.dll)

for %%E in (geos geos_c) do (
	xcopy /C /F /Y %PATH_BUILD%\%1\lib\%%E.lib %PATH_INSTALL%\lib\*
	xcopy /C /F /Y %PATH_BUILD%\%1\bin\%%E.dll %PATH_INSTALL%\bin\*
	xcopy /C /F /Y %PATH_BUILD%\%1\bin\%%E.pdb %PATH_INSTALL%\bin\*
)
if not exist %PATH_INSTALL%\include\geos\util\. (
	setlocal enableextensions
	md %PATH_INSTALL%\include\geos\util
	endlocal
)
xcopy /C /F /Y %PATH_SRC%\%1\include\geos.h %PATH_INSTALL%\include\*
xcopy /C /F /Y %PATH_SRC%\%1\include\geos\export.h %PATH_INSTALL%\include\geos\*
xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\capi\geos_c.h %PATH_INSTALL%\include\*
xcopy /C /F /Y %PATH_SRC%\%1\include\geos\util\GEOSException.h %PATH_INSTALL%\include\geos\util\*