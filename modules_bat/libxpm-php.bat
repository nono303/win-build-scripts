MSBuild.exe C:\src\libxpm\windows\vc%MSVC_VER%\libxpm.sln /nowarn:C4018 /nowarn:C4244 /nowarn:C4267 /nowarn:C4311 /nowarn:C4312 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libxpm /p:Configuration="Static Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
MSBuild.exe C:\src\libxpm\windows\vc%MSVC_VER%\libxpm.sln /nowarn:C4018 /nowarn:C4244 /nowarn:C4267 /nowarn:C4311 /nowarn:C4312 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libxpm /p:Configuration="DLL Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y "C:\src\libxpm\windows\builds\%archmsbuild%\Static Release\libxpm_a.lib" %PHPDEPS%\lib\libxpm_a.lib
copy /Y "C:\src\libxpm\windows\builds\%archmsbuild%\Static Release\libxpm_a.pdb" %PHPDEPS%\lib\libxpm_a.pdb
copy /Y "C:\src\libxpm\windows\builds\%archmsbuild%\DLL Release\libxpm_a.dll" %PHPDEPS%\bin\libxpm.dll
copy /Y "C:\src\libxpm\windows\builds\%archmsbuild%\DLL Release\libxpm_a.pdb" %PHPDEPS%\bin\libxpm.pdb

copy /Y C:\httpd-sdk\src\libxpm\include\X11\xpm.h %PHPDEPS%\include\xpm.h
cd /D C:\httpd-sdk\modules_bat