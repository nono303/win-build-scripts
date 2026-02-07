@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set OUTDIR_CONF=Release
set VCDIR=build-VS2026\libiconv

if %ARG_KEEPSRC% == 0 (call do_php %PATH_MODULES_COMMON%/msbuild.php "%PATH_SRC%/%1/%VCDIR%;%PATH_SRC%/%1/%VCDIR%/../_props" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%)

MSBuild.exe %VCDIR%/libiconv.vcxproj %MSBUILD_OPTS% ^
/t:Clean,Build ^
/nowarn:C4311;C4267;C4090;C4311 ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform="%archmsbuild%"

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\%VCDIR%\%outmsbuild%\%1.dll
for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%outmsbuild%\%1.%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%outmsbuild%\%1.lib %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_SRC%\%1\include\iconv.h %PATH_INSTALL%\include\*
