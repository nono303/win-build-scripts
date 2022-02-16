@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=builds\msvc\vs2019
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR%" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%
sed -i 's/^<\/TargetExt^>/^<\/TargetExt^>^<TargetName^>libsodium_static^<\/TargetName^>/g' %CYGPATH_SRC%/%1/builds/msvc/properties/LIB.props

for %%C in (StaticRelease DynRelease) do (
	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\libsodium.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4197 ^
	/p:Configuration=%%C ^
	/p:Platform=%archmsbuild%
)
for %%X in (libsodium_static.lib libsodium_static.pdb libsodium.lib) do (
	for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\%1\bin\%%X') do (xcopy /C /F /Y %%I %PATH_INSTALL%\lib\*)
)
for %%X in (libsodium.dll libsodium.pdb) do (
	for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\%1\bin\%%X') do (xcopy /C /F /Y %%I %PATH_INSTALL%\bin\*)
)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libsodium.dll

xcopy /C /F /Y %PATH_SRC%\%1\src\libsodium\include\sodium.h %PATH_INSTALL%\include\*
if not exist %PATH_INSTALL%\include\sodium\. mkdir %PATH_INSTALL%\include\sodium
xcopy /C /F /Y %PATH_SRC%\%1\src\libsodium\include\sodium\*.h %PATH_INSTALL%\include\sodium\*