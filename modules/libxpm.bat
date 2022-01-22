@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=windows\nono
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR:\=/%" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

for %%C in ("Static Release" "DLL Release") do (
	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\libxpm.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4018;C4244;C4267;C4311;C4312;C4013;MSB8012 ^
	/t:Clean,libxpm ^
	/p:Configuration=%%C ^
	/p:Platform="%archmsbuild%"
)

for %%X in (lib pdb) do (xcopy /C /F /Y "%PATH_SRC%\%1\windows\builds\%archmsbuild%\Static Release\libxpm_a.%%X" %PATH_INSTALL%\lib\)
for %%X in (dll pdb) do (xcopy /C /F /Y "%PATH_SRC%\%1\windows\builds\%archmsbuild%\DLL Release\libxpm.%%X" %PATH_INSTALL%\bin\)

if not exist %PATH_INSTALL%\include\X11\. mkdir %PATH_INSTALL%\include\X11
xcopy /E /C /F /Y %PATH_SRC%\%1\include\X11 %PATH_INSTALL%\include\X11\
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libxpm.dll