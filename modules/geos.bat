@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=%MSVC_DEPS%_%ARCH%_%AVXECHO%
if exist %VCDIR%\. rmdir /S /Q %VCDIR%
cmake -S . -B %VCDIR% -G "Visual Studio 16 2019" -A %archmsbuild% -DCMAKE_GENERATOR_TOOLSET=host=%ARCH% 
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR:\=/%" %AVXVCX% %PTFTS% %WKITVER%

sed -i 's/true^<\/LinkIncremental/false^<\/LinkIncremental/g' %CYGPATH_SRC%/%1/%VCDIR%/geos_c.vcxproj
sed -i 's/true^<\/LinkIncremental/false^<\/LinkIncremental/g' %CYGPATH_SRC%/%1/%VCDIR%/geos.vcxproj

REM cmake --clean-first --build %VCDIR% --config RelWithDebInfo ---parallel 16 --verbose

	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\GEOS.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4267;C4702;C4018;C4458 ^
	/t:geos,geos_c ^
	/p:Configuration=%CMAKE_BUILD_TYPE% ^
	/p:Platform="%archmsbuild%"

for %%X in (geos geos_c) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\%VCDIR%\bin\%CMAKE_BUILD_TYPE%\%%X.dll)

for %%E in (geos geos_c) do (
	xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\lib\%CMAKE_BUILD_TYPE%\%%E.lib %PATH_INSTALL%\lib\*
	xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\bin\%CMAKE_BUILD_TYPE%\%%E.dll %PATH_INSTALL%\bin\*
	xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\bin\%CMAKE_BUILD_TYPE%\%%E.pdb %PATH_INSTALL%\bin\*
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