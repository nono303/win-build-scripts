@echo off
set ARG_KEEPSRC=1
call %PATH_MODULES_COMMON%\init.bat %1

set MPIRDIR=vs22
set OUTDIR_CONF=Release
set MPIROUT=build
set VCDIR=msvc

	REM clean out dir
if exist %PATH_SRC%\%1\%MPIROUT%\%MPIRDIR%-%archmsbuild%_%OUTDIR_CONF%_%AVX_MPIR%\. rmdir /S /Q %PATH_SRC%\%1\%MPIROUT%\%MPIRDIR%-%archmsbuild%_%OUTDIR_CONF%_%AVX_MPIR%

	REM 32. skylake_avx	(x64)	AVX2
	REM 29. sandybridge	(x64)	AVX
	REM 20. core2_penryn	(x64)	SSE2
call python %PATH_SRC%\%1\%VCDIR%\mpir_config.py 22 29,20,32

	REM clean build dir
if exist %PATH_SRC%\%1\%VCDIR%\%MPIRDIR%\dll_mpir_%AVX_MPIR:-=_%\%archmsbuild%\. rmdir /S /Q %PATH_SRC%\%1\%VCDIR%\%MPIRDIR%\dll_mpir_%AVX_MPIR:-=_%\%archmsbuild%

MSBuild.exe %PATH_SRC%\%1\%VCDIR%\%MPIRDIR%\dll_mpir_%AVX_MPIR:-=_%\dll_mpir_%AVX_MPIR:-=_%.vcxproj %MSBUILD_OPTS% ^
/p:VCToolsInstallDir=%VCToolsInstallDir% ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform=%archmsbuild%
echo on
for %%D in (bin lib include) do (xcopy /C /F /Y %PATH_SRC%\%1\%MPIROUT%\%MPIRDIR%-%archmsbuild%_%OUTDIR_CONF%_%AVX_MPIR%\%%D\*.* %PATH_INSTALL%\%%D\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\mpir_%AVX_MPIR%.dll