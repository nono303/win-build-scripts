call %PATH_MODULES_COMMON%\init.bat %1
	REM update sln 
	REM conform platefrom name & target 
	REM use localtime instead of systemtime for timestamp in log and logname rotate
	REM add nssm list command in console message
git apply --verbose %PATH_MODULES%\%1.patch
REM %PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1" %AVXVCX% %PTFTS% %WKITVER%

MSBuild.exe nssm.sln ^
/p:Turbo=true ^
/nowarn:C4312 ^
/nowarn:C4311 ^
/nowarn:C4302 ^
/m:%NUMBER_OF_PROCESSORS% ^
/p:CL_MPCount=%NUMBER_OF_PROCESSORS% ^
/t:Clean,Build ^
/p:Configuration=Release ^
/p:DebugSymbols=true ^
/p:DebugType=None ^
/p:Platform="%archmsbuild%"

FOR /F "tokens=* USEBACKQ" %%F IN (`git describe --tags`) DO (SET VERSION=%%F)
for %%E in (exe pdb) do (copy /Y %PATH_SRC%\%1\out\Release\%archmsbuild%\nssm.%%E %PATH_INSTALL%\bin\nssm-%VERSION%.%%E)