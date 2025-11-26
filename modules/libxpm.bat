@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=windows\nono
set OUTDIR_CONF=DLL Release

	REM already done. launch only once for bebase from upstream (/VS17)
REM call do_php %PATH_MODULES_COMMON%/msbuild.php "%PATH_SRC%/%1/%VCDIR:\=/%" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

MSBuild.exe %PATH_SRC%\%1\%VCDIR%\libxpm.sln %MSBUILD_OPTS% ^
/t:Clean,libxpm ^
/nowarn:C4018;C4244;C4267;C4311;C4312;C4013;MSB8012 ^
/p:Configuration="%OUTDIR_CONF%" ^
/p:Platform="%archmsbuild%"

for %%X in (dll pdb) do (xcopy /C /F /Y "%PATH_SRC%\%1\windows\builds\%archmsbuild%\%OUTDIR_CONF%\libxpm.%%X" %PATH_INSTALL%\bin\*)
xcopy /C /F /Y "%PATH_SRC%\%1\windows\builds\%archmsbuild%\%OUTDIR_CONF%\libxpm.lib" %PATH_INSTALL%\lib\*
if not exist %PATH_INSTALL%\include\X11\. mkdir %PATH_INSTALL%\include\X11
xcopy /E /C /F /Y %PATH_SRC%\%1\include\X11 %PATH_INSTALL%\include\X11\
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libxpm.dll