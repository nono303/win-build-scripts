@echo off && call %PATH_MODULES_COMMON%\init.bat %1

REM https://bugs.php.net/bug.php?id=29362
REM https://www.codeproject.com/Articles/302012/How-to-Build-libiconv-with-Microsoft-Visual-Studio

set VCDIR=MSVC%MSVC_VER%
if not exist %PATH_SRC%\%1\%VCDIR%\. mklink /J %PATH_SRC%\%1\%VCDIR% %PATH_SRC%\%1\MSVC16
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR%/" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%
sed -i 's/libiconv_a/libiconv_static/g' %CYGPATH_SRC%/%1/%VCDIR%/libiconv_static/libiconv_static.vcxproj
for %%X in (dll pdb lib) do (sed -i 's/libiconv\.%%X/iconv\.%%X/g' %CYGPATH_SRC%/%1/%VCDIR%/libiconv_dll/libiconv_dll.vcxproj)

MSBuild.exe %PATH_SRC%\%1\%VCDIR%\%1.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4267;C4090;C4018 ^
	/t:Clean,%1_static:Rebuild,%1_dll:Rebuild ^
	/p:Configuration=Release ^
	/p:Platform="%archmsbuild%"

for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%archmsbuild%\bin\iconv.%%X %PATH_INSTALL%\bin\*)
for %%X in (iconv.lib %1_static.lib %1_static.pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%archmsbuild%\lib\%%X %PATH_INSTALL%\lib\*)
xcopy /C /F /Y %PATH_SRC%\%1\source\include\iconv.h %PATH_INSTALL%\include\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\iconv.dll