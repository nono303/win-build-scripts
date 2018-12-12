"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\src\libpng\projects\vstudio2017\vstudio.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libpng /p:Configuration="Release Library" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\src\libpng\projects\vstudio2017\vstudio.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libpng /p:Configuration="Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y "C:\src\libpng\projects\vstudio2017\%outmsbuild%\libpng.dll" %PHPDEPS%\bin\libpng.dll
copy /Y "C:\src\libpng\projects\vstudio2017\%outmsbuild%\libpng.pdb" %PHPDEPS%\bin\libpng.pdb
copy /Y "C:\src\libpng\projects\vstudio2017\%outmsbuild% Library\libpng_a.lib" %PHPDEPS%\lib\libpng_a.lib
copy /Y "C:\src\libpng\projects\vstudio2017\%outmsbuild% Library\libpng_a.pdb" %PHPDEPS%\lib\libpng_a.pdb

mkdir %PHPDEPS%\include\libpng16
copy /Y C:\httpd-sdk\src\libpng\pnglibconf.h %PHPDEPS%\include\libpng16\pnglibconf.h
copy /Y C:\httpd-sdk\src\libpng\png.h %PHPDEPS%\include\libpng16\png.h
copy /Y C:\httpd-sdk\src\libpng\pngconf.h %PHPDEPS%\include\libpng16\pngconf.h
cd /D C:\httpd-sdk\modules_bat