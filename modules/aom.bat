@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM ninja: error: build.ninja:288: multiple rules generate aom.lib [-w dupbuild=err]
cmake -Wno-dev -G "Visual Studio 17 2022" ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=1 ^
-DENABLE_DOCS=0 ^
-DENABLE_EXAMPLES=0 ^
-DENABLE_TESTDATA=0 ^
-DENABLE_TESTS=0 ^
-DENABLE_TOOLS=0 ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%PATH_BUILD:\=/%/%1/" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%
sed -i -E 's/    ^<LinkIncremental.*//g' %CYGPATH_BUILD%/%1/aom.vcxproj
set AOMCONF=RelWithDebInfo
MSBuild.exe %PATH_BUILD%\%1\%VCDIR%\AOM.sln ^
	%MSBUILD_OPTS% ^
	/t:aom ^
	/p:Configuration=%AOMCONF% ^
	/p:Platform="%archmsbuild%"

xcopy /C /F /Y %PATH_BUILD%\%1\%AOMCONF%\aom.lib %PATH_INSTALL%\lib\*
for %%X in (aom.pdb aom.dll) do (xcopy /C /F /Y  %PATH_BUILD%\%1\%AOMCONF%\%%X %PATH_INSTALL%\bin\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\aom.dll