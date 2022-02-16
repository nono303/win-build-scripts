@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=windows\vs2019
set OUTDIR_CONF=Release

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR:\=/%" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%
REM liblzma.vcxproj : error for static lib defined with <Link> and not <Lib> for vc15
sed -i 's/^<\/Link^>/^<\/Link^>^<Lib^>^<LinkTimeCodeGeneration^>true^<\/LinkTimeCodeGeneration^>^<EnableCOMDATFolding^>true^<\/EnableCOMDATFolding^>^<OptimizeReferences^>true^<\/OptimizeReferences^>^<\/Lib^>/g' %CYGPATH_SRC%/%1/%VCDIR:\=/%/liblzma.vcxproj
sed -i 's/^<\/IntDir^>/^<\/IntDir^>^<TargetName^>liblzma_static^<\/TargetName^>/g' %CYGPATH_SRC%/%1/%VCDIR:\=/%/liblzma.vcxproj

MSBuild.exe %PATH_SRC%\%1\%VCDIR%\xz_win.sln ^
%MSBUILD_OPTS% ^
/t:Clean,liblzma:Rebuild,liblzma_dll:Rebuild ^
/nowarn:C4267,C4996,C4028,C4133 ^
/p:Configuration=%OUTDIR_CONF% ^
/p:ZLibSrcDir=C:\sdk\src\zlib ^
/p:ZLibLib=%PATH_INSTALL%\lib\zlib.lib ^
/p:Platform="%archmsbuild%"


	REM C:\sdk\src\liblzma\windows\vs2019\%OUTDIR_CONF%\x64\liblzma_dll\liblzma.lib
for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%OUTDIR_CONF%\%archmsbuild%\liblzma_dll\liblzma.%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%OUTDIR_CONF%\%archmsbuild%\liblzma_dll\liblzma.lib %PATH_INSTALL%\lib\*
for %%X in (lib pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%OUTDIR_CONF%\%archmsbuild%\liblzma\liblzma_static.%%X %PATH_INSTALL%\lib\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\liblzma.dll
	REM xcopy /C /F /Y %PATH_SRC%\%1\src\liblzma\lzma\*.h %PATH_INSTALL%\include\*
xcopy /C /F /Y %PATH_SRC%\%1\src\liblzma\api\lzma.h %PATH_INSTALL%\include\*
if not exist %PATH_SRC%\%1\src\liblzma\api\lzma\. mkdir %PATH_SRC%\%1\src\liblzma\api\lzma
xcopy /C /F /Y %PATH_SRC%\%1\src\liblzma\api\lzma\*.h %PATH_INSTALL%\include\lzma\*