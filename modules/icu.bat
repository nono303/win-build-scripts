@echo off && call %PATH_MODULES_COMMON%\init.bat %1

FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\grep 'U_ICU_VERSION_SHORT' /cygdrive/c/sdk/src/icu/icu4c/source/common/unicode/uvernum.h ^| %PATH_BIN_CYGWIN%\tr -dc '0-9'`) do (set ICUV=%%F)
set VCDIR=icu4c\source\allinone
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/icu4c" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

REM icudtXX.pdb
sed -i 's/NXCOMPAT/NXCOMPAT \/LTCG \/OPT:REF,ICF \/DEBUG/g' %CYGPATH_SRC%/%1/icu4c/source/tools/pkgdata/pkgdata.cpp

REM https://unicode-org.github.io/icu/userguide/icu4c/build.html#skipping-the-uwp-projects-on-the-command-line
	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\allinone.sln ^
	%MSBUILD_OPTS% ^
	/t:cal,cintltst,common,date,derb,genbrk,genccode,gencmn,gencnval,genrb,i18n,makeconv,makedata,pkgdata,stubdata,toolutil,uconv,io,gensprep,icupkg,gendict,gencfu,gennorm2,icuinfo ^
	/nowarn:C4018;C4116;C4267;C4312;C4146;MSB8028 ^
	/p:Configuration=Release ^
	/p:SkipUWP=true ^
	/p:Platform="%archmsbuild%"

for %%C in (dt in io tu uc) do (
	xcopy /C /F /Y %PATH_SRC%\icu\icu4c\bin64\icu%%C%ICUV%.dll %PATH_INSTALL%\bin\*
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\icu%%C%ICUV%.dll
	xcopy /C /F /Y %PATH_SRC%\icu\icu4c\lib64\icu%%C.pdb %PATH_INSTALL%\bin\icu%%C%ICUV%.pdb*
	xcopy /C /F /Y %PATH_SRC%\icu\icu4c\lib64\icu%%C.lib %PATH_INSTALL%\lib\*
	xcopy /C /F /Y %PATH_SRC%\icu\icu4c\lib64\icu%%C.pdb %PATH_INSTALL%\lib\*
)
xcopy /C /F /Y %PATH_SRC%\icu\icu4c\source\data\out\build\icudt69l\icudt69.pdb %PATH_INSTALL%\bin\*
if not exist %PATH_INSTALL%\include\unicode\. mkdir %PATH_INSTALL%\include\unicode
xcopy /C /F /Y %PATH_SRC%\%1\icu4c\include\unicode\*.h %PATH_INSTALL%\include\unicode\*