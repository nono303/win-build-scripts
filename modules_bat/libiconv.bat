"C:\msvc%MSVC_VER%\MSBuild\15.0\Bin\MSBuild.exe" C:\src\libiconv\MSvc%MSVC_VER%\libiconv.sln /nowarn:C4090 /nowarn:C4244 /nowarn:C4267 /nowarn:c4018 /nowarn:MSB8012 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libiconv_dll /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y C:\src\libiconv\MSvc%MSVC_VER%\%archmsbuild%\bin\libiconv.dll C:\httpd-sdk\install\bin\libiconv.dll 
copy /Y C:\src\libiconv\MSvc%MSVC_VER%\%archmsbuild%\bin\libiconv.pdb C:\httpd-sdk\install\bin\libiconv.pdb 
copy /Y C:\src\libiconv\MSvc%MSVC_VER%\%archmsbuild%\lib\libiconv.lib C:\httpd-sdk\install\lib\iconv.lib 
copy /Y C:\src\libiconv\source\include\iconv.h C:\httpd-sdk\install\include\iconv.h
cd /D C:\httpd-sdk\modules_bat