cd /D %PATH_SRC%\libjpeg
git reset --hard
git clean -fdx
if %MSVC_DEPS% == vc15 (%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULE_BAT%/vcxproj2vc15.sh "libjpeg")
MSBuild.exe %PATH_SRC%\libjpeg\jpeg.sln /nowarn:C4267 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,jpeg /p:Configuration="Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y %PATH_SRC%\libjpeg\%outmsbuild%\jpeg.lib %PHPDEPS%\lib\libjpeg_a.lib
copy /Y %PATH_SRC%\libjpeg\%outmsbuild%\jpeg.pdb %PHPDEPS%\lib\libjpeg_a.pdb
copy /Y %PATH_SRC%\libjpeg\jconfig.h %PHPDEPS%\include\jconfig.h
copy /Y %PATH_SRC%\libjpeg\jerror.h %PHPDEPS%\include\jerror.h
copy /Y %PATH_SRC%\libjpeg\jmorecfg.h %PHPDEPS%\include\jmorecfg.h
copy /Y %PATH_SRC%\libjpeg\jpeglib.h %PHPDEPS%\include\jpeglib.h
copy /Y %PATH_SRC%\libjpeg\jversion.h %PHPDEPS%\include\jversion.h
cd /D %PATH_MODULE_BAT%