call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=projects\vstudio\nono
mkdir %PATH_SRC%\%1\%VCDIR%
	REM adapted from https://github.com/winlibs/libpng
xcopy /C /F /Y %PATH_MODULES%\%1.vcxproj %PATH_SRC%\%1\%VCDIR%\*
xcopy /C /F /Y %PATH_MODULES%\%1.sln %PATH_SRC%\%1\%VCDIR%\*

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR:\=/%" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

MSBuild.exe %PATH_SRC%\%1\projects\vstudio\vstudio.sln ^
%MSBUILD_OPTS% ^
/t:pnglibconf:Rebuild ^
/p:Configuration=Release ^
/p:Platform="Win32"

for %%C in ("Release" "Release Library") do (
	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\%1.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:MSB8012 ^
	/t:Clean,libpng:Rebuild ^
	/p:Configuration=%%C ^
	/p:ZLibSrcDir=C:\sdk\src\zlib ^
	/p:ZLibLib=%PATH_INSTALL%\lib\zlib.lib ^
	/p:Platform="%archmsbuild%"
)

if %ARCH% == x86 (set INTER_DIR=)
if %ARCH% == x64 (set INTER_DIR=%archmsbuild%\)

for %%X in (lib pdb) do (xcopy /C /F /Y "%PATH_SRC%\%1\%VCDIR%\%INTER_DIR%Release Library\libpng_a.%%X" %PATH_INSTALL%\lib\*)
for %%X in (dll pdb) do (xcopy /C /F /Y "%PATH_SRC%\%1\%VCDIR%\%INTER_DIR%Release\libpng.%%X" %PATH_INSTALL%\bin\*)
for %%X in (pnglibconf png pngconf) do (xcopy /C /F /Y %PATH_SRC%\%1\%%X.h %PATH_INSTALL%\include\*)