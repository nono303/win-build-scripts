@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=MSVC%MSVC_VER%
if not exist %PATH_SRC%\%1\%VCDIR%\. mklink /J %PATH_SRC%\%1\%VCDIR% %PATH_SRC%\%1\MSVC16
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR%/" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

MSBuild.exe %PATH_SRC%\%1\%VCDIR%\%1.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4267;C4090;C4018 ^
	/t:Clean,%1_static:Rebuild,%1_dll:Rebuild ^
	/p:Configuration=Release ^
	/p:Platform="%archmsbuild%"

xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%archmsbuild%\bin\%1.dll %PATH_INSTALL%\bin\* 
xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%archmsbuild%\bin\%1.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%1.dll
xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%archmsbuild%\lib\%1.lib %PATH_INSTALL%\lib\iconv.lib*
xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%archmsbuild%\lib\%1_a.lib %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_SRC%\%1\%VCDIR%\%archmsbuild%\lib\%1_a.pdb %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_SRC%\%1\source\include\iconv.h %PATH_INSTALL%\include\*
