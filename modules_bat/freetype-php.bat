"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\src\freetype\builds\windows\vc2017\freetype.sln /nowarn:C4267 /nowarn:C4244 /nowarn:C4702 /nowarn:C4312 /nowarn:C4701 /nowarn:LNK4006 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,freetype /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y C:\src\freetype\objs\vc2017\%archmsbuild%\freetype_a.lib C:\php72-sdk\phpmaster\vc15\%ARCH%\deps\lib\freetype_a.lib
copy /Y C:\src\freetype\objs\vc2017\%archmsbuild%\freetype_a.pdb C:\php72-sdk\phpmaster\vc15\%ARCH%\deps\lib\freetype_a.pdb
cd /D C:\httpd-sdk\modules_bat