@echo off && call %PATH_MODULES_COMMON%\init.bat %1

%PATH_BIN_CYGWIN%\sh.exe -c "CC=cl ./autogen.sh"

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/msvc/projects/vc2017/jemalloc/" %AVXVCX% %PTFTS% %WKITVER%
	REM https://github.com/jemalloc/jemalloc/issues/1099
sed -i 's/^<PreprocessorDefinitions^>_REENTRANT/^<PreprocessorDefinitions^>JEMALLOC_NO_PRIVATE_NAMESPACE;_REENTRANT/g' %CYGPATH_SRC%/%1/msvc/projects/vc2017/jemalloc/jemalloc.vcxproj
sed -i 's/^<PreprocessorDefinitions^>JEMALLOC_DEBUG/^<PreprocessorDefinitions^>JEMALLOC_NO_PRIVATE_NAMESPACE;JEMALLOC_DEBUG/g' %CYGPATH_SRC%/%1/msvc/projects/vc2017/jemalloc/jemalloc.vcxproj

MSBuild.exe msvc\jemalloc_vc2017.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4028 ^
	/t:Clean,jemalloc ^
	/p:Configuration=Release ^
	/p:Plateform="%ARCH%"

for %%X in (dll pdb) do (move /Y %PATH_SRC%\%1\msvc\%archmsbuild%\Release\jemalloc.%%X %PATH_INSTALL%\bin)
move /Y %PATH_SRC%\%1\msvc\%archmsbuild%\Release\jemalloc.lib %PATH_INSTALL%\lib
if not exist %PATH_INSTALL%\include\%1\. mkdir %PATH_INSTALL%\include\%1\
xcopy /C /F /Y %PATH_SRC%\%1\include\%1\jemalloc.h %PATH_INSTALL%\include\%1\*

	REM version
CD /D %PATH_SRC%\%1 
for /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set VERSION=%%F)
call %PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\bin\jemalloc.dll "%VERSION%"