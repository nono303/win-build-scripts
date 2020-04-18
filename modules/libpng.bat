call %PATH_MODULES_COMMON%\init.bat %1
SET VCDIR=projects/vstudio2017

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
copy /Y %PATH_BUILD%\%LIBNAME%\*.* %PATH_SRC%\%1\
rmdir /S /Q %PATH_BUILD%\%LIBNAME%

for %%C in ("Release" "Release Library") do (
	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\vstudio.sln ^
	/nowarn:MSB8012 ^
	/p:Turbo=true ^
	/m:%NUMBER_OF_PROCESSORS% ^
	/p:CL_MPCount=%NUMBER_OF_PROCESSORS% ^
	/t:Clean,libpng ^
	/p:Configuration=%%C ^
	/p:DebugSymbols=true ^
	/p:DebugType=None ^
	/p:Platform="%archmsbuild%"
)

for %%X in (lib pdb) do (copy /Y "%PATH_SRC%\%1\%VCDIR%\%archmsbuild%\Release Library\libpng_a.%%X" %PATH_INSTALL%\lib\libpng_a.%%X)
for %%X in (dll pdb) do (copy /Y "%PATH_SRC%\%1\%VCDIR%\%archmsbuild%\Release\libpng.%%X" %PATH_INSTALL%\bin\libpng.%%X)

copy /Y %PATH_SRC%\%1\pnglibconf.h %PATH_INSTALL%\include\pnglibconf.h
copy /Y %PATH_SRC%\%1\png.h %PATH_INSTALL%\include\png.h
copy /Y %PATH_SRC%\%1\pngconf.h %PATH_INSTALL%\include\pngconf.h
cd /D %PATH_MODULES%