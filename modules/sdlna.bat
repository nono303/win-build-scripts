@echo off && call %PATH_UTILS%\init.bat %1

set OUTDIR_CONF=Release

if exist %PATH_SRC%\%1\build\. rmdir /S /Q %PATH_SRC%\%1\build
REM if exist %PATH_SRC%\%1\packages\. rmdir /S /Q %PATH_SRC%\%1\packages

MSBuild.exe sdlna.sln %MSBUILD_OPTS% ^
/restore ^
/t:clean,Build ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform="Any CPU" ^
/p:RestorePackagesConfig=true

call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\assets\nono\ico.ico %PATH_SRC%\%1\build\*
call %PATH_UTILS%\fileutils mv %PATH_SRC%\%1\build\x64\SQLite.Interop.dll %PATH_SRC%\%1\build
for %%d in (x64 x86) do (rmdir /S /Q %PATH_SRC%\%1\build\%%d)

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\build\sdlna.exe