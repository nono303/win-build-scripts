cd /D %PATH_SRC%\libiconv
git reset --hard
git clean -fdx
%PATH_BIN_CYGWIN%\bash %CYGPATH_HTTPD_SDK%/vcxproj.sh "%CYGPATH_SRC%/libiconv/MSvc%MSVC_VER%/" %AVXVCX%
if %MSVC_DEPS% == vc15 (
	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULE_BAT%/libiconv.sh
)
MSBuild.exe %PATH_SRC%\libiconv\MSvc%MSVC_VER%\libiconv.sln /nowarn:C4090 /nowarn:C4244 /nowarn:C4267 /nowarn:c4018 /nowarn:MSB8012 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libiconv_static,libiconv_dll /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y %PATH_SRC%\libiconv\MSvc%MSVC_VER%\%archmsbuild%\bin\libiconv.dll	%PATH_INSTALL%\bin\libiconv.dll 
copy /Y %PATH_SRC%\libiconv\MSvc%MSVC_VER%\%archmsbuild%\bin\libiconv.pdb	%PATH_INSTALL%\bin\libiconv.pdb 
copy /Y %PATH_SRC%\libiconv\MSvc%MSVC_VER%\%archmsbuild%\lib\libiconv.lib	%PATH_INSTALL%\lib\iconv.lib
copy /Y %PATH_SRC%\libiconv\MSvc%MSVC_VER%\%archmsbuild%\lib\libiconv_a.lib	%PATH_INSTALL%\lib\libiconv_a.lib
copy /Y %PATH_SRC%\libiconv\MSvc%MSVC_VER%\%archmsbuild%\lib\libiconv_a.pdb	%PATH_INSTALL%\lib\libiconv_a.pdb
copy /Y %PATH_SRC%\libiconv\source\include\iconv.h				%PATH_INSTALL%\include\iconv.h
cd /D %PATH_MODULE_BAT%