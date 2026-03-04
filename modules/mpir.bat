REM /cygdrive/c/sdk/src/php-src/ext/gmp/config.w32:6   if (CHECK_LIB("mpir_a.lib", "gmp", PHP_GMP)
@echo off && call %PATH_UTILS%\init.bat %1

if %AVXECHO%==avx2 (
	set MPIR_NAME=skylake-avx
	set MPIR_CONFIG=32
)
if %AVXECHO%==avx (
	set MPIR_NAME=sandybridge
	set MPIR_CONFIG=29
)
if %AVXECHO%==sse2 (
	set MPIR_NAME=core2-penryn
	set MPIR_CONFIG=20
)

set MPIRVCVER=26
set MPIRDIR=vs%MPIRVCVER%
set OUTDIR_CONF=Release
set VCDIR=msvc

call python %PATH_SRC%\%1\%VCDIR%\mpir_config.py %MPIRVCVER% %WKITVER% %MPIR_CONFIG%

call do_php %PATH_UTILS%/msbuild.php "%PATH_SRC%\%1\%VCDIR%\%MPIRDIR%\dll_mpir_%MPIR_NAME:-=_%" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

MSBuild.exe %PATH_SRC%\%1\%VCDIR%\%MPIRDIR%\dll_mpir_%MPIR_NAME:-=_%\dll_mpir_%MPIR_NAME:-=_%.vcxproj %MSBUILD_OPTS% ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform=%archmsbuild% ^
/p:YASM_PATH="%PATH_SOFTS%" ^
/p:YASM_NAME="yasm-1.3.0-win64.exe"

xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%MPIRDIR%\dll_mpir_%MPIR_NAME:-=_%\%archmsbuild%\%OUTDIR_CONF%\%1.lib %PATH_INSTALL%\lib\*
for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%MPIRDIR%\dll_mpir_%MPIR_NAME:-=_%\%archmsbuild%\%OUTDIR_CONF%\%1.%%X %PATH_INSTALL%\bin\*)
for %%X in (config gmp-impl gmp-mparam gmp gmpxx longlong mpir mpirxx) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%MPIRDIR%\dll_mpir_%MPIR_NAME:-=_%\%archmsbuild%\%OUTDIR_CONF%\%%X.h %PATH_INSTALL%\include\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\mpir.dll
