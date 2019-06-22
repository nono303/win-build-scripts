cd /D C:\httpd-sdk\src\libiconv\
git clean -f -d
git reset --hard
if %MSVC_DEPS% == vc15 (C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/vcxproj2vc15.sh "libiconv/MSVC16")
MSBuild.exe C:\src\libiconv\MSVC16\libiconv.sln /nowarn:C4090 /nowarn:C4244 /nowarn:C4267 /nowarn:c4018 /nowarn:MSB8012 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libiconv_static,libiconv_dll /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y C:\src\libiconv\MSVC16\%archmsbuild%\libiconv_a.lib %PHPDEPS%\lib\libiconv_a.lib
copy /Y C:\src\libiconv\MSVC16\%archmsbuild%\libiconv_a.pdb %PHPDEPS%\lib\libiconv_a.pdb
copy /Y C:\src\libiconv\MSVC16\%archmsbuild%\bin\libiconv.dll %PHPDEPS%\bin\libiconv.dll
copy /Y C:\src\libiconv\MSVC16\%archmsbuild%\bin\libiconv.pdb %PHPDEPS%\bin\libiconv.pdb
copy /Y C:\httpd-sdk\src\libiconv\source\include\iconv.h %PHPDEPS%\include\iconv.h
cd /D C:\httpd-sdk\modules_bat