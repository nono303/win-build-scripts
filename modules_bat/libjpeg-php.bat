cd /D C:\src\libjpeg
MSBuild.exe C:\src\libjpeg\jpeg.sln /nowarn:C4267 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,jpeg /p:Configuration="Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y C:\src\libjpeg\%outmsbuild%\jpeg.lib %PHPDEPS%\lib\libjpeg_a.lib
copy /Y C:\src\libjpeg\%outmsbuild%\jpeg.pdb %PHPDEPS%\lib\libjpeg_a.pdb
copy /Y C:\src\libjpeg\jconfig.h %PHPDEPS%\include\jconfig.h
copy /Y C:\src\libjpeg\jerror.h %PHPDEPS%\include\jerror.h
copy /Y C:\src\libjpeg\jmorecfg.h %PHPDEPS%\include\jmorecfg.h
copy /Y C:\src\libjpeg\jpeglib.h %PHPDEPS%\include\jpeglib.h
copy /Y C:\src\libjpeg\jversion.h %PHPDEPS%\include\jversion.h
cd /D C:\httpd-sdk\modules_bat