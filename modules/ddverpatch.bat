call %PATH_MODULES_COMMON%\init.bat %1
git apply --verbose %PATH_MODULES%\%1.patch
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1" %AVXVCX% %PTFTS% %WKITVER%

set VERPATCH_CONF=Release

MSBuild.exe %PATH_SRC%\%1\verpatch.sln ^
/nowarn:MSB8012 ^
/p:Turbo=true ^
/m:%NUMBER_OF_PROCESSORS% ^
/p:CL_MPCount=%NUMBER_OF_PROCESSORS% ^
/t:Clean,verpatch ^
/p:Configuration=%VERPATCH_CONF% ^
/p:DebugSymbols=true ^
/p:DebugType=None ^
/p:Platform="Win32"

xcopy /C /F /Y %PATH_SRC%\%1\%VERPATCH_CONF%\verpatch.exe %PATH_SOFTS%\*