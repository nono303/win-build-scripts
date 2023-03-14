@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set OUTDIR_CONF=Release

MSBuild.exe MySqlPlugIn.sln %MSBUILD_OPTS% ^
/t:clean,restore,Build ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform="Any CPU" ^
/p:OutputPath=%OUTDIR_CONF% ^
/p:RestorePackagesConfig=true