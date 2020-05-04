call %PATH_MODULES_COMMON%\init.bat %1
set VCDIR=projects/vstudio2017

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR%" %AVXVCX% %PTFTS% %WKITVER%

if not exist %PATH_SRC%\%1\%VCDIR%\zlib-1.2.11\. mklink /J "%PATH_SRC%\%1\%VCDIR%\zlib-1.2.11" %PATH_SRC%\zlib

	REM update src...
cd /D %PATH_BUILD%
set LIBVER=1.6.37
set LIBNAME=libpng-%LIBVER%
if not exist %PATH_BUILD%\%LIBNAME%.tar.gz (
	wget http://sourceforge.mirrorservice.org/l/li/libpng/libpng16/%LIBVER%/%LIBNAME%.tar.gz
)
tar xvf %LIBNAME%.tar.gz
xcopy /C /F /Y %PATH_BUILD%\%LIBNAME%\*.* %PATH_SRC%\%1\*
rmdir /S /Q %PATH_BUILD%\%LIBNAME%

for %%C in ("Release" "Release Library") do (
	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\vstudio.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:MSB8012 ^
	/t:Clean,libpng ^
	/p:Configuration=%%C ^
	/p:Platform="%archmsbuild%"
)

if %ARCH% == x86 (set INTER_DIR=)
if %ARCH% == x64 (set INTER_DIR=%archmsbuild%\)

for %%X in (lib pdb) do (xcopy /C /F /Y "%PATH_SRC%\%1\%VCDIR%\%INTER_DIR%Release Library\libpng_a.%%X" %PATH_INSTALL%\lib\*)
for %%X in (dll pdb) do (xcopy /C /F /Y "%PATH_SRC%\%1\%VCDIR%\%INTER_DIR%Release\libpng.%%X" %PATH_INSTALL%\bin\*)
for %%X in (pnglibconf png pngconf) do (xcopy /C /F /Y %PATH_SRC%\%1\%%X.h %PATH_INSTALL%\include\*)

	REM version
call %PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\bin\libpng.dll "%LIBVER%"