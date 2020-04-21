call %PATH_MODULES_COMMON%\init.bat %1

nmake /f Makefile.vs setupcopy-v16

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1" %AVXVCX% %PTFTS% %WKITVER%
	REM remove 3 first junk char in vcxproj...
	REM rename static lib : jpeg > %JPEG_LIB_NAME%
set JPEG_LIB_NAME=libjpeg_a
%PATH_BIN_CYGWIN%\bash %PATH_MODULES%/%1.sh "%CYGPATH_SRC%/%1" %JPEG_LIB_NAME%
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj_rename.sh "%CYGPATH_SRC%/%1/jpeg.vcxproj" %JPEG_LIB_NAME%

for %%P in (jpeg apps) do (
	MSBuild.exe %PATH_SRC%\%1\%%P.sln ^
	/nowarn:MSB8012 ^
	/p:Turbo=true ^
	/m:%NUMBER_OF_PROCESSORS% ^
	/p:CL_MPCount=%NUMBER_OF_PROCESSORS% ^
	/t:Build ^
	/p:Configuration=Release ^
	/p:DebugSymbols=true ^
	/p:DebugType=None ^
	/p:Platform="%archmsbuild%"
)
for %%X in (lib pdb) do (copy /Y "%PATH_SRC%\%1\Release\%archmsbuild%\%JPEG_LIB_NAME%.%%X" %PATH_INSTALL%\lib)
for %%X in (exe pdb) do (for %%P in (wrjpgcom rdjpgcom cjpeg djpeg jpegtran) do (copy /Y "%PATH_SRC%\%1\Release\%archmsbuild%\%%P.%%X" %PATH_INSTALL%\bin))

	REM rename... manually
for %%P in (wrjpgcom rdjpgcom cjpeg djpeg jpegtran) do (%PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\bin\%%P.exe "9.4" "9-d")