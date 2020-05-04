@echo off && call %PATH_MODULES_COMMON%\init.bat %1
set VCDIR=windows/vc15

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR%" %AVXVCX% %PTFTS% %WKITVER%

	REM update src...
cd /D %PATH_BUILD%
set LIBVER=3.5.13
set LIBNAME=libXpm-%LIBVER%
if not exist %PATH_BUILD%\%LIBNAME%.tar.gz (
	wget https://www.x.org/releases/individual/lib/%LIBNAME%.tar.gz
)
tar xvf %LIBNAME%.tar.gz
xcopy /E /C /F /Y %PATH_BUILD%\%LIBNAME%\src %PATH_SRC%\%1\src\
rmdir /S /Q %PATH_BUILD%\%LIBNAME%

	REM version
xcopy /C /F /Y %PATH_MODULES%\%1_version.h %PATH_SRC%\%1\%VCDIR:/=\%\version.h*
xcopy /C /F /Y %PATH_MODULES_COMMON%\version.rc %PATH_SRC%\%1\%VCDIR:/=\%\version.rc*
sed -i 's/^<\/Project^>/^<ItemGroup^>^<ResourceCompile Include="version.rc" \/^>^<\/ItemGroup^>^<\/Project^>/g' %CYGPATH_SRC%/%1/%VCDIR%/libxpm.vcxproj
sed -i -E 's/Static Release(.)Win32(.)"^>/Static Release\1Win32\2"^>\r\n    ^<Midl^>\r\n      ^<TargetEnvironment^>X86^<\/TargetEnvironment^>\r\n    ^<\/Midl^>/g' %CYGPATH_SRC%/%1/%VCDIR%/libxpm.vcxproj
	REM version (in sh cause &gt &lt...) https://www.zachburlingame.com/2011/02/versioning-a-native-cc-binary-with-visual-studio/
	REM "Static Release" win32 : LINK : warning LNK4068: /MACHINE not specified; defaulting to X86 [C:\sdk\src\libxpm\windows\vc15\libxpm.vcxproj]
sed -i 's/^<\/Lib^>/^<TargetMachine^>Machine%ARCH%^<\/TargetMachine^>^<\/Lib^>/g' %CYGPATH_SRC%/%1/%VCDIR%/libxpm.vcxproj

for %%C in ("Static Release" "DLL Release") do (
	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\libxpm.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4018;C4244;C4267;C4311;C4312;C4013;MSB8012 ^
	/t:Clean,libxpm ^
	/p:Configuration=%%C ^
	/p:Platform="%archmsbuild%"
)

for %%X in (lib pdb) do (xcopy /C /F /Y "%PATH_SRC%\%1\windows\builds\%archmsbuild%\Static Release\libxpm_a.%%X" %PATH_INSTALL%\lib\)
for %%X in (dll pdb) do (xcopy /C /F /Y "%PATH_SRC%\%1\windows\builds\%archmsbuild%\DLL Release\libxpm.%%X" %PATH_INSTALL%\bin\)

if not exist %PATH_INSTALL%\include\X11\. mkdir %PATH_INSTALL%\include\X11
	REM get xlib include
cd /D %PATH_BUILD%
set LIBVER=3.5.12-5
set LIBNAME=libxpm-%LIBVER%-vs16-x64
if not exist %PATH_BUILD%\%LIBNAME%.zip (
	wget https://windows.php.net/downloadS/php-sdk/deps/vs16/x64/%LIBNAME%.zip
)
call %BIN_SEVENZ% x -o"%LIBNAME%" -y %LIBNAME%.zip
xcopy /E /C /F /Y %PATH_BUILD%\%LIBNAME%\include\X11 %PATH_INSTALL%\include\X11\
rmdir /S /Q %PATH_BUILD%\%LIBNAME%
xcopy /E /C /F /Y %PATH_SRC%\%1\include\X11 %PATH_INSTALL%\include\X11\
if not exist %PATH_INSTALL%\include\xpm.h mklink /h %PATH_INSTALL%\include\xpm.h %PATH_INSTALL%\include\X11\xpm.h