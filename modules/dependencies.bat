@echo off && call %PATH_MODULES_COMMON%\init.bat %1

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

set OUTDIR_CONF=Release
%PATH_SOFTS%\NuGet.exe restore Dependencies.sln
MSBuild.exe Dependencies.sln %MSBUILD_OPTS% ^
	/t:clean,DependenciesGui ^
	/p:Configuration=%OUTDIR_CONF% ^
	/nowarn:C4018;C4267;CS0169 ^
	/p:Platform="%ARCH%"

if exist %PATH_INSTALL%\_%1\. rmdir /S /Q %PATH_INSTALL%\_%1
mkdir %PATH_INSTALL%\_%1
for %%X in (DependenciesGui.exe DependenciesLib.dll ClrPhlib.dll Dragablz.dll) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\bin\%OUTDIR_CONF%%ARCH%\%%X)
xcopy /C /F /Y %PATH_SRC%\%1\bin\%OUTDIR_CONF%%ARCH%\* %PATH_INSTALL%\_%1\*
call do_php %PATH_UTILS%\sub\bininfo.php %PATH_INSTALL%\_%1\ checkavx