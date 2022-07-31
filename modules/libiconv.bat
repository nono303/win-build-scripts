@echo off && call %PATH_MODULES_COMMON%\init.bat %1

REM https://bugs.php.net/bug.php?id=29362
REM https://www.codeproject.com/Articles/302012/How-to-Build-libiconv-with-Microsoft-Visual-Studio

set OUTDIR_CONF=Release

if not exist %PATH_SRC%\%1\. mklink /J %PATH_SRC%\%1 %PATH_SRC%\%1\MSVC16
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

MSBuild.exe %PATH_SRC%\%1\%1.sln %MSBUILD_OPTS% ^
/t:Clean,%1 ^
/nowarn:C4311,C4117,C4267,C4141,C4090 ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform="%archmsbuild%"

set LIBDIR=lib
if %CYGV% == 64 (set LIBDIR=lib64)

xcopy /C /F /Y %PATH_SRC%\%1\%LIBDIR%\libiconv.lib %PATH_INSTALL%\lib\*
for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%LIBDIR%\libiconv.%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_SRC%\%1\include\iconv.h %PATH_INSTALL%\include\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libiconv.dll