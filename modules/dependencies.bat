@echo off && call %PATH_UTILS%\init.bat %1

if %ARG_KEEPSRC% == 0 (call do_php %PATH_UTILS%/msbuild.php "%PATH_SRC%/%1" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER% nostd)

set OUTDIR_CONF=Release

if exist %SRC%\%1\build\obj\. rmdir /S /Q %SRC%\%1\build\obj
if exist %SRC%\%1\build\x64\. rmdir /S /Q %SRC%\%1\build\x64

MSBuild.exe Dependencies.slnx %MSBUILD_OPTS% ^
/t:clean,restore,DependenciesGui ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform="%ARCH%"

if exist %PATH_INSTALL%\_%1\. rmdir /S /Q %PATH_INSTALL%\_%1
mkdir %PATH_INSTALL%\_%1
set DEPENDENCIES_OUT_PATH=%PATH_SRC%\%1\build\%ARCH%\%OUTDIR_CONF%\DependenciesGui
for %%X in (Dependencies.exe DependenciesGui.exe DependenciesLib.dll) do (call do_php %PATH_UTILS%\sub\version.php %1 %DEPENDENCIES_OUT_PATH%\%%X nopdb)
call %PATH_UTILS%\fileutils cp %DEPENDENCIES_OUT_PATH%\* %PATH_INSTALL%\_%1\*
REM call do_php %PATH_UTILS%\sub\bininfo.php %PATH_INSTALL%\_%1\ checkavx

if %LOCAL_COPY% == 1 if %LOCAL_COPY_AVX_ECHO% == %AVXECHO%  if %LOCAL_COPY_MSVC_VER% == %MSVC_VER% (
	for %%E in (%LOCAL_PATH_DEPENDENCIES% %LOCAL_PATH_DEPENDENCIES2%) do (
		if exist %%E\. rmdir /S /Q %%E
		mkdir %%E
		call %PATH_UTILS%\fileutils cpdir %PATH_INSTALL%\_%1\* %%E\*
	)
)