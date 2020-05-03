@echo off && call %PATH_MODULES_COMMON%\init.bat %1

MSBuild.exe sdlna.sln %MSBUILD_OPTS% ^
	/t:clean,Build ^
	/p:Configuration=Release ^
	/p:Platform="Any CPU"

for %%X in (x64 x86) do (xcopy /C /F /Y %PATH_SRC%\%1\packages\System.Data.SQLite.Core.1.0.112.0\build\net46\%%X\ %PATH_SRC%\%1\build)
del /Q /F %PATH_SRC%\%1\build\SQLite.Interop.dll
xcopy /C /F /Y %PATH_SRC%\%1\assets\nono\ico.ico %PATH_SRC%\%1\build\*
call do_php %PATH_UTILS%\sub\bininfo.php %PATH_SRC%\%1\build\sdlna.exe null checkavx