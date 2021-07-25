@echo off && call %PATH_MODULES_COMMON%\init.bat %1

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

set OUTDIR_CONF=Release
MSBuild.exe nssm.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4311;C4302;C4312 ^
	/t:Build ^
	/p:Configuration=%OUTDIR_CONF% ^
	/p:Platform="%archmsbuild%"

for /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set VERSION=%%F)
for %%E in (exe pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\out\%OUTDIR_CONF%\%archmsbuild%\nssm.%%E %PATH_INSTALL%\bin\nssm-%VERSION%.%%E*)
call do_php %PATH_UTILS%\sub\bininfo.php %PATH_INSTALL%\bin\nssm-%VERSION%.exe null checkavx