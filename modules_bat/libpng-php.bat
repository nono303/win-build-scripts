cd /D %PATH_SRC%\libpng\
git reset --hard
git clean -fdx
if %MSVC_DEPS% == vc15 (bash %CYGPATH_MODULE_BAT%/vcxproj2vc15.sh "libpng/projects/vstudio2019")
cd /D %PATH_SRC%\libpng\projects\vstudio2019\
MSBuild.exe %PATH_SRC%\libpng\projects\vstudio2019\vstudio.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libpng /p:Configuration="Release Library" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
MSBuild.exe %PATH_SRC%\libpng\projects\vstudio2019\vstudio.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libpng /p:Configuration="Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y "%PATH_SRC%\libpng\projects\vstudio2019\%outmsbuild%\libpng.dll" %PHPDEPS%\bin\libpng.dll
copy /Y "%PATH_SRC%\libpng\projects\vstudio2019\%outmsbuild%\libpng.pdb" %PHPDEPS%\bin\libpng.pdb
copy /Y "%PATH_SRC%\libpng\projects\vstudio2019\%outmsbuild% Library\libpng_a.lib" %PHPDEPS%\lib\libpng_a.lib
copy /Y "%PATH_SRC%\libpng\projects\vstudio2019\%outmsbuild% Library\libpng_a.pdb" %PHPDEPS%\lib\libpng_a.pdb

copy /Y %PATH_SRC%\libpng\pnglibconf.h %PHPDEPS%\include\pnglibconf.h
copy /Y %PATH_SRC%\libpng\png.h %PHPDEPS%\include\png.h
copy /Y %PATH_SRC%\libpng\pngconf.h %PHPDEPS%\include\pngconf.h
cd /D %PATH_MODULE_BAT%