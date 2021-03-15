call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=windows\vs2019
set VCCONF=Release

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR:\=/%" %AVXVCX% %PTFTS% %WKITVER%

MSBuild.exe %PATH_SRC%\%1\%VCDIR%\xz_win.sln ^
%MSBUILD_OPTS% ^
/t:Clean,liblzma,liblzma_dll ^
/nowarn:C4267,C4996,C4028 ^
/p:Configuration=%VCCONF% ^
/p:ZLibSrcDir=C:\sdk\src\zlib ^
/p:ZLibLib=%PATH_INSTALL%\lib\zlib.lib ^
/p:Platform="%archmsbuild%"


	REM C:\sdk\src\liblzma\windows\vs2019\%VCCONF%\x64\liblzma_dll\liblzma.lib
for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%VCCONF%\%archmsbuild%\liblzma_dll\liblzma.%%X %PATH_INSTALL%\bin\*)
for %%X in (lib pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%VCCONF%\%archmsbuild%\liblzma\liblzma.%%X %PATH_INSTALL%\lib\*)
	REM xcopy /C /F /Y %PATH_SRC%\%1\src\liblzma\lzma\*.h %PATH_INSTALL%\include\*
xcopy /C /F /Y %PATH_SRC%\%1\src\liblzma\api\lzma.h %PATH_INSTALL%\include\*
if not exist %PATH_SRC%\%1\src\liblzma\api\lzma\. mkdir %PATH_SRC%\%1\src\liblzma\api\lzma
xcopy /C /F /Y %PATH_SRC%\%1\src\liblzma\api\lzma\*.h %PATH_INSTALL%\include\lzma\*