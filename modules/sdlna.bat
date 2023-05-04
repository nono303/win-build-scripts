@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set OUTDIR_CONF=Release

MSBuild.exe sdlna.sln %MSBUILD_OPTS% ^
/t:clean,restore,Build ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform="Any CPU" ^
/p:RestorePackagesConfig=true

xcopy /C /F /Y %PATH_SRC%\%1\assets\nono\ico.ico %PATH_SRC%\%1\build\*
xcopy /C /F /Y %PATH_SRC%\%1\packages\Stub.System.Data.SQLite.Core.NetFramework.1.0.117.0\build\net46\x64\SQLite.Interop.dll %PATH_SRC%\%1\build\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\build\sdlna.exe