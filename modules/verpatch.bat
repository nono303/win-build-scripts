@echo off && call %PATH_MODULES_COMMON%\init.bat %1

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

set OUTDIR_CONF=Release

MSBuild.exe verpatch.sln %MSBUILD_OPTS% ^
/t:Clean,verpatch ^
/nowarn:C4267;C4838;C4474,C4311,C4302,C4312 ^
/p:Configuration=%Release% ^
/p:Platform="%archmsbuild%"

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\%outmsbuild%\verpatch.exe
for %%X in (exe pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%outmsbuild%\verpatch.%%X %PATH_SOFTS%\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SOFTS%\verpatch.exe
call do_php %PATH_UTILS%\sub\bininfo.php %PATH_SOFTS%\verpatch.exe null checkavx