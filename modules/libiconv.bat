@echo off && call %PATH_MODULES_COMMON%\init.bat %1

if %ARG_KEEPSRC% == 0 (call do_php %PATH_MODULES_COMMON%/msbuild.php "%PATH_SRC%/%1/build-VS2022/libiconv;%PATH_SRC%/%1/build-VS2022/_props" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%)

set OUTDIR_CONF=Release

MSBuild.exe build-VS2022/libiconv/libiconv.vcxproj %MSBUILD_OPTS% ^
/t:Clean,Build ^
/nowarn:C4311;C4267;C4090;C4311 ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform="%archmsbuild%"

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\build-VS2022\libiconv\%outmsbuild%\%1.dll
for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\build-VS2022\libiconv\%outmsbuild%\%1.%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_SRC%\%1\build-VS2022\libiconv\%outmsbuild%\%1.lib %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_SRC%\%1\include\iconv.h %PATH_INSTALL%\include\*
