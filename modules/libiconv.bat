@echo off && call %PATH_MODULES_COMMON%\init.bat %1

REM /******** > 2021-07-21 TMP !! vs17 non disponible ********/
if not exist %PATH_SRC%\libiconv\MSVC%MSVC_VER%\. mklink /J %PATH_SRC%\libiconv\MSVC%MSVC_VER% %PATH_SRC%\libiconv\MSVC16

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/libiconv/MSVC%MSVC_VER%/" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

MSBuild.exe %PATH_SRC%\libiconv\MSVC%MSVC_VER%\libiconv.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4267;C4090;C4018 ^
	/t:Clean,libiconv_static:Rebuild,libiconv_dll:Rebuild ^
	/p:Configuration=Release ^
	/p:Platform="%archmsbuild%"

xcopy /C /F /Y %PATH_SRC%\libiconv\MSVC%MSVC_VER%\%archmsbuild%\bin\libiconv.dll %PATH_INSTALL%\bin\* 
xcopy /C /F /Y %PATH_SRC%\libiconv\MSVC%MSVC_VER%\%archmsbuild%\bin\libiconv.pdb %PATH_INSTALL%\bin\*
	REM for libxml2 & httpd
xcopy /C /F /Y %PATH_SRC%\libiconv\MSVC%MSVC_VER%\%archmsbuild%\lib\libiconv.lib %PATH_INSTALL%\lib\iconv.lib*
xcopy /C /F /Y %PATH_SRC%\libiconv\MSVC%MSVC_VER%\%archmsbuild%\lib\libiconv_a.lib %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_SRC%\libiconv\MSVC%MSVC_VER%\%archmsbuild%\lib\libiconv_a.pdb %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_SRC%\libiconv\source\include\iconv.h %PATH_INSTALL%\include\*