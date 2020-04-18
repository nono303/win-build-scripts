call %PATH_MODULES_COMMON%\init.bat %1
SET VCDIR=builds/windows/vc2010

	REM add Link option for LTCG
%PATH_BIN_CYGWIN%\bash %PATH_MODULES%/freetype.sh "%CYGPATH_SRC%/%1/%VCDIR%"
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR%" %AVXVCX% %PTFTS% %WKITVER%

for %%C in ("Release" "Release Static") do (
	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\%1.sln ^
	/nowarn:C4018 ^
	/nowarn:C4100 ^
	/nowarn:C4267 ^
	/nowarn:C4244 ^
	/nowarn:C4706 ^
	/nowarn:C4701 ^
	/nowarn:C4312 ^
	/p:Turbo=true ^
	/m:%NUMBER_OF_PROCESSORS% ^
	/p:CL_MPCount=%NUMBER_OF_PROCESSORS% ^
	/t:Clean,freetype ^
	/p:Configuration=%%C ^
	/p:DebugSymbols=true ^
	/p:DebugType=None ^
	/p:Platform="%archmsbuild%"
)

for %%X in (lib pdb) do (copy /Y "%PATH_SRC%\%1\objs\%archmsbuild%\Release Static\freetype.%%X" %PATH_INSTALL%\lib\freetype.%%X)
for %%X in (dll pdb) do (copy /Y "%PATH_SRC%\%1\objs\%archmsbuild%\Release\freetype.%%X" %PATH_INSTALL%\bin\freetype.%%X)
copy /Y %PATH_SRC%\%1\include\ft2build.h %PATH_INSTALL%\include\ft2build.h
if not exist %PATH_INSTALL%\include\%1\config\. mkdir %PATH_INSTALL%\include\%1\config
copy /Y %PATH_SRC%\%1\include\%1\config\*.h %PATH_INSTALL%\include\%1\config
copy /Y %PATH_SRC%\%1\include\%1\*.h %PATH_INSTALL%\include\%1