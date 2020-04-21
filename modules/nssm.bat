call %PATH_MODULES_COMMON%\init.bat %1

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1" %AVXVCX% %PTFTS% %WKITVER%

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
/p:Platform="%ARCH%"

if %ARCH% == x86 set archnssm=Win32
if %ARCH% == x64 set archnssm=Win64
for %%E in (exe pdb) do (copy /Y %PATH_SRC%\%1\out\Release\%archnssm%\nssm.%%E %PATH_INSTALL%\bin\nssm-103.%%E)