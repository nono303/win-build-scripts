call %PATH_MODULES_COMMON%\init.bat %1
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

	REM version (in sh cause &gt &lt...) 
	REM https://www.zachburlingame.com/2011/02/versioning-a-native-cc-binary-with-visual-studio/
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/%1.sh %CYGPATH_SRC%/%1/%VCDIR%/libxpm.vcxproj

xcopy /C /F /Y %PATH_MODULES%\%1_version.h %PATH_SRC%\%1\%VCDIR:/=\%\version.h*
xcopy /C /F /Y %PATH_MODULES_COMMON%\version.rc %PATH_SRC%\%1\%VCDIR:/=\%\version.rc*

for %%C in ("Static Release" "DLL Release") do (
	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\libxpm.sln  ^
	/nowarn:C4018 ^
	/nowarn:C4244 ^
	/nowarn:C4267 ^
	/nowarn:C4311 ^
	/nowarn:C4312 ^
	/nowarn:C4013 ^
	/nowarn:MSB8012 ^
	/p:Turbo=true ^
	/m:%NUMBER_OF_PROCESSORS% ^
	/p:CL_MPCount=%NUMBER_OF_PROCESSORS% ^
	/t:Clean,libxpm ^
	/p:Configuration=%%C ^
	/p:DebugSymbols=true ^
	/p:DebugType=None ^
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