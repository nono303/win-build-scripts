call %PATH_MODULES_COMMON%\init.bat %1

nmake /f Makefile.vs setupcopy-v16
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1" %AVXVCX% %PTFTS% %WKITVER%
	REM remove 3 first junk char in vcxproj...
for %%F in (cjpeg djpeg jpeg jpegtran rdjpgcom wrjpgcom) do (sed -i -E '1s/^^...//g' %CYGPATH_SRC%/%1/%%F.vcxproj)
	REM pdb jor jpeg.lib
sed -i 's/^<ClCompile^>/^<ClCompile^>^<ProgramDataBaseFileName^>$(OutDir)jpeg.pdb^<\/ProgramDataBaseFileName^>/g' %CYGPATH_SRC%/%1/jpeg.vcxproj

for %%P in (jpeg apps) do (
	MSBuild.exe %PATH_SRC%\%1\%%P.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:MSB8012 ^
	/t:Build ^
	/p:Configuration=Release ^
	/p:Platform="%archmsbuild%"
)
for %%X in (lib pdb) do (xcopy /C /F /Y "%PATH_SRC%\%1\Release\%archmsbuild%\jpeg.%%X" %PATH_INSTALL%\lib\*)
for %%X in (exe pdb) do (for %%P in (wrjpgcom rdjpgcom cjpeg djpeg jpegtran) do (xcopy /C /F /Y "%PATH_SRC%\%1\Release\%archmsbuild%\%%P.%%X" %PATH_INSTALL%\bin\*))
xcopy /E /C /F /Y "%PATH_SRC%\%1\*.h" %PATH_INSTALL%\include\*)

	REM !! TODO
for %%P in (wrjpgcom rdjpgcom cjpeg djpeg jpegtran) do (call %PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\bin\%%P.exe "9.4" "9-d")