cd /D %PATH_SRC%\freetype\
git reset --hard
git clean -fdx
if %MSVC_DEPS% == vc15 (bash %CYGPATH_MODULE_BAT%/vcxproj2vc15.sh "freetype/builds/windows/vc2019")
MSBuild.exe %PATH_SRC%\freetype\builds\windows\vc2019\freetype.sln /nowarn:C4267 /nowarn:C4244 /nowarn:C4702 /nowarn:C4312 /nowarn:C4701 /nowarn:LNK4006 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,freetype /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
REM MSBuild.exe %PATH_SRC%\freetype\builds\windows\vc2019\freetype.sln /nowarn:C4267 /nowarn:C4244 /nowarn:C4702 /nowarn:C4312 /nowarn:C4701 /nowarn:LNK4006 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,freetype /p:Configuration="DLL Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y %PATH_SRC%\freetype\objs\vc2019\%archmsbuild%\freetype_a.lib %PHPDEPS%\lib\freetype_a.lib
copy /Y %PATH_SRC%\freetype\objs\vc2019\%archmsbuild%\freetype_a.pdb %PHPDEPS%\lib\freetype_a.pdb
copy /Y %PATH_SRC%\freetype\include\ft2build.h %PHPDEPS%\include\ft2build.h
mkdir %PHPDEPS%\include\freetype\config
copy /Y %PATH_SRC%\freetype\include\freetype\config\*.h %PHPDEPS%\include\freetype\config\
copy /Y %PATH_SRC%\freetype\include\freetype\*.h %PHPDEPS%\include\freetype\
cd /D %PATH_MODULE_BAT%