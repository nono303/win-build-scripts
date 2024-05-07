@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=builds\msvc\vs2022
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR%" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

MSBuild.exe %PATH_SRC%\%1\%VCDIR%\libsodium.sln %MSBUILD_OPTS% ^
/nowarn:C4197 ^
/p:VCToolsInstallDir=%VCToolsInstallDir% ^
/p:Configuration=DynRelease ^
/p:Platform=%archmsbuild%

for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\%1\bin\libsodium.lib') do (xcopy /C /F /Y %%I %PATH_INSTALL%\lib\*)
for %%X in (libsodium.dll libsodium.pdb) do (
	for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\%1\bin\%%X') do (xcopy /C /F /Y %%I %PATH_INSTALL%\bin\*)
)
xcopy /C /F /Y %PATH_SRC%\%1\src\libsodium\include\sodium.h %PATH_INSTALL%\include\*
if not exist %PATH_INSTALL%\include\sodium\. mkdir %PATH_INSTALL%\include\sodium
xcopy /C /F /Y %PATH_SRC%\%1\src\libsodium\include\sodium\*.h %PATH_INSTALL%\include\sodium\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libsodium.dll