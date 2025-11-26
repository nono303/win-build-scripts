@echo off && call %PATH_MODULES_COMMON%\init.bat %1

if %ARG_KEEPSRC% == 0 (call do_php %PATH_MODULES_COMMON%/msbuild.php "%PATH_SRC%/%1" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER% nostd)

	REM * branch master	e8211e9	10 Apr 2020	2.25 in readme.md	2.24 in ChangeLog.txt	no tag
	REM   branch 2.x	4951a78	13 Apr 2020	2.22 in readme.md	2.24 in ChangeLog.txt	tag 2.25.0
set NSSM_VER=2.25.0
sed -i -E 's/for \/f.*/set description=%NSSM_VER:.=-%-0/g' %CYGPATH_SRC%/%1/version.cmd

set OUTDIR_CONF=Release

MSBuild.exe nssm.sln %MSBUILD_OPTS% ^
/t:Build ^
/nowarn:C4311;C4302;C4312 ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform="%archmsbuild%"

for %%E in (exe pdb) do (
	xcopy /C /F /Y %PATH_SRC%\%1\out\%OUTDIR_CONF%\%archmsbuild%\nssm.%%E %PATH_INSTALL%\bin\nssm-%NSSM_VER%.%%E*
)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\nssm-%NSSM_VER%.exe