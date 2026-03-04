@echo off && call %PATH_UTILS%\init.bat %1

if %ARG_KEEPSRC% == 0 (call do_php %PATH_UTILS%/msbuild.php "%PATH_SRC%/%1/" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%)

set OUTDIR_CONF=Release

MSBuild.exe run-hidden.sln %MSBUILD_OPTS% ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform="%archmsbuild%"

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\%OUTDIR_CONF%\%archmsbuild%\%1.exe
