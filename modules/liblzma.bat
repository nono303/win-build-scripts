@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=windows\vs2019
set OUTDIR_CONF=Release

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR:\=/%" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

MSBuild.exe %PATH_SRC%\%1\%VCDIR%\xz_win.sln %MSBUILD_OPTS% ^
/t:Clean,liblzma_dll:Rebuild ^
/nowarn:C4267,C4996,C4028,C4133 ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform="%archmsbuild%" ^
/p:ZLibSrcDir=%PATH_SRC%\zlib ^
/p:ZLibLib=%PATH_INSTALL%\lib\zlib.lib

for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%OUTDIR_CONF%\%archmsbuild%\liblzma_dll\liblzma.%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%OUTDIR_CONF%\%archmsbuild%\liblzma_dll\liblzma.lib %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_SRC%\%1\src\liblzma\api\lzma.h %PATH_INSTALL%\include\*
if not exist %PATH_SRC%\%1\src\liblzma\api\lzma\. mkdir %PATH_SRC%\%1\src\liblzma\api\lzma
xcopy /C /F /Y %PATH_SRC%\%1\src\liblzma\api\lzma\*.h %PATH_INSTALL%\include\lzma\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\liblzma.dll