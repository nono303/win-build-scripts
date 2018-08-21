"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\src\libpng\projects\vstudio2017\vstudio.sln /m:8 /t:Clean,libpng /p:Configuration="Release Library" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\src\libpng\projects\vstudio2017\vstudio.sln /m:8 /t:Clean,libpng /p:Configuration="Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y "C:\src\libpng\projects\vstudio2017\%outmsbuild%\libpng.dll" C:\php72-sdk\phpmaster\vc15\%ARCH%\deps\bin\libpng.dll
copy /Y "C:\src\libpng\projects\vstudio2017\%outmsbuild%\libpng.pdb" C:\php72-sdk\phpmaster\vc15\%ARCH%\deps\bin\libpng.pdb
copy /Y "C:\src\libpng\projects\vstudio2017\%outmsbuild% Library\libpng_a.lib" C:\php72-sdk\phpmaster\vc15\%ARCH%\deps\lib\libpng_a.lib
copy /Y "C:\src\libpng\projects\vstudio2017\%outmsbuild% Library\libpng_a.pdb" C:\php72-sdk\phpmaster\vc15\%ARCH%\deps\lib\libpng_a.pdb