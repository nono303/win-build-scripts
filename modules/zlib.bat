@echo off && call %PATH_MODULES_COMMON%\init.bat %1

	REM https://stackoverflow.com/questions/29505121/cmake-zlib-build-on-windows
sed -i 's/-O2 -GL -MD/-O2 -GL -MD -MP%NUMBER_OF_PROCESSORS% %AVXMSC%/g' %CYGPATH_SRC%/%1/win32/Makefile.msc
if %ARCH% == x86 (nmake %NMAKE_OPTS% /f win32/Makefile.msc LOC="-DASMV -DASMINF"     OBJA="inffas32.obj match686.obj")
if %ARCH% == x64 (nmake %NMAKE_OPTS% /f win32/Makefile.msc LOC="-DASMV -DASMINF -I." OBJA="inffasx64.obj gvmat64.obj inffas8664.obj" AS=ml64)

for %%E in (zlib.lib zlib.pdb zdll.lib) do (xcopy /C /F /Y %PATH_SRC%\%1\%%E %PATH_INSTALL%\lib\*)
for %%E in (zlib1.dll zlib1.pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%%E %PATH_INSTALL%\bin\*)
for %%E in (zlib.h zconf.h) do (xcopy /C /F /Y %PATH_SRC%\%1\%%E %PATH_INSTALL%\include\*)