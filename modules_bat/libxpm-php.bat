"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\src\libxpm\windows\vc15\libxpm.sln /nowarn:C4018 /nowarn:C4244 /nowarn:C4267 /nowarn:C4311 /nowarn:C4312 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libxpm /p:Configuration="Static Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y "C:\src\libxpm\windows\builds\%archmsbuild%\Static Release\libxpm_a.lib" %PHPDEPS%\lib\libxpm_a.lib
copy /Y "C:\src\libxpm\windows\builds\%archmsbuild%\Static Release\libxpm_a.pdb" %PHPDEPS%\lib\libxpm_a.pdb
mkdir %PHPDEPS%\include\X11
copy /Y C:\httpd-sdk\src\libxpm\include\X11\xpm.h %PHPDEPS%\include\X11\xpm.h
cd /D C:\httpd-sdk\modules_bat