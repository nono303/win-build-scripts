"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\src\libiconv\MSVC15\libiconv.sln /nowarn:C4090 /nowarn:C4244 /nowarn:C4267 /nowarn:c4018 /nowarn:MSB8012 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libiconv_static,libiconv_dll /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y C:\src\libiconv\MSVC15\%archmsbuild%\libiconv_a.lib %PHPDEPS%\lib\libiconv_a.lib
copy /Y C:\src\libiconv\MSVC15\%archmsbuild%\libiconv_a.pdb %PHPDEPS%\lib\libiconv_a.pdb
copy /Y C:\src\libiconv\MSVC15\%archmsbuild%\bin\libiconv.dll %PHPDEPS%\bin\libiconv.dll
copy /Y C:\src\libiconv\MSVC15\%archmsbuild%\bin\libiconv.pdb %PHPDEPS%\bin\libiconv.pdb
cd /D C:\httpd-sdk\modules_bat