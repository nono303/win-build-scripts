cd /D C:\httpd-sdk\src\libiconv
git reset --hard
git clean -fdx
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/vcxproj.sh "/cygdrive/c/httpd-sdk/src/libiconv/MSvc%MSVC_VER%/" %AVXVCX%
if %MSVC_DEPS% == vc15 (
	C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/libiconv.sh
)
MSBuild.exe C:\src\libiconv\MSvc%MSVC_VER%\libiconv.sln /nowarn:C4090 /nowarn:C4244 /nowarn:C4267 /nowarn:c4018 /nowarn:MSB8012 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libiconv_static,libiconv_dll /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y C:\src\libiconv\MSvc%MSVC_VER%\%archmsbuild%\bin\libiconv.dll	C:\httpd-sdk\install\bin\libiconv.dll 
copy /Y C:\src\libiconv\MSvc%MSVC_VER%\%archmsbuild%\bin\libiconv.pdb	C:\httpd-sdk\install\bin\libiconv.pdb 
copy /Y C:\src\libiconv\MSvc%MSVC_VER%\%archmsbuild%\lib\libiconv.lib	C:\httpd-sdk\install\lib\iconv.lib
copy /Y C:\src\libiconv\MSvc%MSVC_VER%\%archmsbuild%\lib\libiconv_a.lib	C:\httpd-sdk\install\lib\libiconv_a.lib
copy /Y C:\src\libiconv\MSvc%MSVC_VER%\%archmsbuild%\lib\libiconv_a.pdb	C:\httpd-sdk\install\lib\libiconv_a.pdb
copy /Y C:\src\libiconv\source\include\iconv.h				C:\httpd-sdk\install\include\iconv.h
cd /D C:\httpd-sdk\modules_bat