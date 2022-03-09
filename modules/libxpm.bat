@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=windows\nono
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR:\=/%" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%
MSBuild.exe %PATH_SRC%\%1\%VCDIR%\libxpm.sln ^
%MSBUILD_OPTS% ^
/nowarn:C4018;C4244;C4267;C4311;C4312;C4013;MSB8012 ^
/t:Clean,libxpm ^
/p:Configuration="DLL Release" ^
/p:Platform="%archmsbuild%"

for %%X in (dll pdb) do (xcopy /C /F /Y "%PATH_SRC%\%1\windows\builds\%archmsbuild%\DLL Release\libxpm.%%X" %PATH_INSTALL%\bin\*)
xcopy /C /F /Y "%PATH_SRC%\%1\windows\builds\%archmsbuild%\DLL Release\libxpm.lib" %PATH_INSTALL%\lib\*
if not exist %PATH_INSTALL%\include\X11\. mkdir %PATH_INSTALL%\include\X11
xcopy /E /C /F /Y %PATH_SRC%\%1\include\X11 %PATH_INSTALL%\include\X11\
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libxpm.dll