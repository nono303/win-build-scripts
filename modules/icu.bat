@echo off && call %PATH_MODULES_COMMON%\init.bat %1
REM ?icutu         # tool util
REM ?icudt         # stub data
REM +icuuc         # Common and Data libraries
REM +icuin         # Internationalization library
REM +icuio         # Stream and I/O Library
REM -icule         # Layout library
REM -iculx         # Paragraph Layout library

FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\grep 'U_ICU_VERSION_SHORT' %CYGPATH_SRC%/%1/icu4c/source/common/unicode/uvernum.h ^| %PATH_BIN_CYGWIN%\tr -dc '0-9'`) do (set ICUV=%%F)
set VCDIR=icu4c\source\allinone
set OUTDIR_CONF=Release

if %ARG_KEEPSRC% == 0 (
	%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/icu4c" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%
		REM icudtXX.pdb
	sed -i 's/NXCOMPAT/NXCOMPAT \/OPT:REF,ICF \/DEBUG/g' %CYGPATH_SRC%/%1/icu4c/source/tools/pkgdata/pkgdata.cpp
)

	REM	https://unicode-org.github.io/icu/userguide/icu4c/build.html#skipping-the-uwp-projects-on-the-command-line
	REM 	derb,genbrk,genccode,gencfu,gencmn,gencnval,gendict,gennorm2,genrb,gensprep,icuinfo,icupkg,makeconv,uconv
MSBuild.exe %PATH_SRC%\%1\%VCDIR%\allinone.sln %MSBUILD_OPTS% ^
/t:common,date,i18n,icuexportdata,io,makedata,pkgdata,stubdata ^
/nowarn:C4101,C4113,C4116,C4244,C4267,C4312,C4805,MSB8028 ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform=%archmsbuild% ^
/p:SkipUWP=true

if %ARCH% == x64 (set outarch=64)

for %%C in (dt in io tu uc) do (
	xcopy /C /F /Y %PATH_SRC%\icu\icu4c\bin%outarch%\icu%%C%ICUV%.dll %PATH_INSTALL%\bin\*
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\icu%%C%ICUV%.dll
	xcopy /C /F /Y %PATH_SRC%\icu\icu4c\lib%outarch%\icu%%C.pdb %PATH_INSTALL%\bin\icu%%C%ICUV%.pdb*
	xcopy /C /F /Y %PATH_SRC%\icu\icu4c\lib%outarch%\icu%%C.lib %PATH_INSTALL%\lib\*
)
xcopy /C /F /Y %PATH_SRC%\icu\icu4c\source\data\out\build\icudt%ICUV%l\icudt%ICUV%.pdb %PATH_INSTALL%\bin\*
if not exist %PATH_INSTALL%\include\unicode\. mkdir %PATH_INSTALL%\include\unicode
xcopy /C /F /Y %PATH_SRC%\%1\icu4c\include\unicode\*.h %PATH_INSTALL%\include\unicode\*