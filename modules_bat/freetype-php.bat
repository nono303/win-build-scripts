cd /D C:\httpd-sdk\src\freetype\
git clean -fdx
git reset --hard
if %MSVC_DEPS% == vc15 (C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/vcxproj2vc15.sh "freetype/builds/windows/vc2019")
MSBuild.exe C:\src\freetype\builds\windows\vc2019\freetype.sln /nowarn:C4267 /nowarn:C4244 /nowarn:C4702 /nowarn:C4312 /nowarn:C4701 /nowarn:LNK4006 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,freetype /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
REM MSBuild.exe C:\src\freetype\builds\windows\vc2019\freetype.sln /nowarn:C4267 /nowarn:C4244 /nowarn:C4702 /nowarn:C4312 /nowarn:C4701 /nowarn:LNK4006 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,freetype /p:Configuration="DLL Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y C:\src\freetype\objs\vc2019\%archmsbuild%\freetype_a.lib %PHPDEPS%\lib\freetype_a.lib
copy /Y C:\src\freetype\objs\vc2019\%archmsbuild%\freetype_a.pdb %PHPDEPS%\lib\freetype_a.pdb
copy /Y C:\httpd-sdk\src\freetype\include\ft2build.h %PHPDEPS%\include\ft2build.h
mkdir %PHPDEPS%\include\freetype\config
copy /Y C:\httpd-sdk\src\freetype\include\freetype\config\*.h %PHPDEPS%\include\freetype\config\
copy /Y C:\httpd-sdk\src\freetype\include\freetype\*.h %PHPDEPS%\include\freetype\
cd /D C:\httpd-sdk\modules_bat