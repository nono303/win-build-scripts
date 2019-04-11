MSBuild.exe C:\src\libpng\projects\vstudio2019\vstudio.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libpng /p:Configuration="Release Library" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
MSBuild.exe C:\src\libpng\projects\vstudio2019\vstudio.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libpng /p:Configuration="Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y "C:\src\libpng\projects\vstudio2019\%outmsbuild%\libpng.dll" %PHPDEPS%\bin\libpng.dll
copy /Y "C:\src\libpng\projects\vstudio2019\%outmsbuild%\libpng.pdb" %PHPDEPS%\bin\libpng.pdb
copy /Y "C:\src\libpng\projects\vstudio2019\%outmsbuild% Library\libpng_a.lib" %PHPDEPS%\lib\libpng_a.lib
copy /Y "C:\src\libpng\projects\vstudio2019\%outmsbuild% Library\libpng_a.pdb" %PHPDEPS%\lib\libpng_a.pdb

copy /Y C:\httpd-sdk\src\libpng\pnglibconf.h %PHPDEPS%\include\pnglibconf.h
copy /Y C:\httpd-sdk\src\libpng\png.h %PHPDEPS%\include\png.h
copy /Y C:\httpd-sdk\src\libpng\pngconf.h %PHPDEPS%\include\pngconf.h
cd /D C:\httpd-sdk\modules_bat