@echo off && call %PATH_MODULES_COMMON%\init.bat %1

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

set OUTDIR_CONF=Release
MSBuild.exe verpatch.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4267;C4838;C4474 ^
	/t:Clean,verpatch ^
	/p:Configuration=%OUTDIR_CONF% ^
	/p:Platform="Win32"

xcopy /C /F /Y %PATH_SRC%\%1\%OUTDIR_CONF%\verpatch.exe %PATH_SOFTS%\*
call do_php %PATH_UTILS%\sub\bininfo.php %PATH_SOFTS%\verpatch.exe null checkavx