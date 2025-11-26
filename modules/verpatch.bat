@echo off && call %PATH_MODULES_COMMON%\init.bat %1

if %ARG_KEEPSRC% == 0 (call do_php %PATH_MODULES_COMMON%/msbuild.php "%PATH_SRC%/%1" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER% nostd)

set OUTDIR_CONF=Release

MSBuild.exe verpatch.sln %MSBUILD_OPTS% ^
/t:Clean,verpatch ^
/nowarn:C4267;C4838;C4474;C4311;C4302;C4312 ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform="%archmsbuild%"

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\%outmsbuild%\verpatch.exe
for %%X in (exe pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%outmsbuild%\verpatch.%%X %PATH_SOFTS%\*)
call do_php %PATH_UTILS%\sub\bininfo.php %PATH_SOFTS%\verpatch.exe checkavx