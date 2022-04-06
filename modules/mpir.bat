@echo off
set ARG_KEEPSRC=1
call %PATH_MODULES_COMMON%\init.bat %1

set MPIRDIR=vs22
set OUTDIR_CONF=Release
set MPIROUT=build
set VCDIR=msvc

	REM clean out dir
if exist %PATH_SRC%\%1\%MPIROUT%\%MPIRDIR%-%archmsbuild%_%OUTDIR_CONF%_%AVXMPIR%\. rmdir /S /Q %PATH_SRC%\%1\%MPIROUT%\%MPIRDIR%-%archmsbuild%_%OUTDIR_CONF%_%AVXMPIR%

	REM 29. sandybridge                (x64)
	REM 20. core2_penryn               (x64)
	REM 12. pentium4_sse2            (win32)
call python %PATH_SRC%\%1\%VCDIR%\mpir_config.py 22 29,20,12

	REM clean build dir
if exist %PATH_SRC%\%1\%VCDIR%\%MPIRDIR%\dll_mpir_%AVXMPIR:-=_%\%archmsbuild%\. rmdir /S /Q %PATH_SRC%\%1\%VCDIR%\%MPIRDIR%\dll_mpir_%AVXMPIR:-=_%\%archmsbuild%

MSBuild.exe %PATH_SRC%\%1\%VCDIR%\%MPIRDIR%\dll_mpir_%AVXMPIR:-=_%\dll_mpir_%AVXMPIR:-=_%.vcxproj %MSBUILD_OPTS% ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform=%archmsbuild%

for %%D in (bin lib include) do (xcopy /C /F /Y %PATH_SRC%\%1\%MPIROUT%\%MPIRDIR%-%archmsbuild%_%OUTDIR_CONF%_%AVXMPIR%\%%D\*.* %PATH_INSTALL%\%%D\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\mpir_%AVXMPIR%.dll