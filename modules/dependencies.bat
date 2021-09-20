@echo off && call %PATH_MODULES_COMMON%\init.bat %1

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

%PATH_SOFTS%\NuGet.exe restore Dependencies.sln
MSBuild.exe Dependencies.sln %MSBUILD_OPTS% ^
	/t:clean,DependenciesGui ^
	/p:Configuration=Release ^
	/nowarn:C4018;C4267;CS0169 ^
	/p:Platform="x64"