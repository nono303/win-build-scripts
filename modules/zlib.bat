call %PATH_MODULES_COMMON%\init.bat %1

REM https://stackoverflow.com/questions/29505121/cmake-zlib-build-on-windows
git apply --verbose %PATH_MODULES%\%1.patch

sed -i 's/Zc:inline/Zc:inline -MP%NUMBER_OF_PROCESSORS% %AVXMSC%/g' %CYGPATH_SRC%/%1/win32/Makefile.msc
nmake %NMAKE_OPTS% /f win32/Makefile.msc clean
if %ARCH% == x86 (
	nmake -f win32/Makefile.msc LOC="-DASMV -DASMINF"     OBJA="inffas32.obj match686.obj"
)
if %ARCH% == x64 (
	nmake -f win32/Makefile.msc LOC="-DASMV -DASMINF -I." OBJA="inffasx64.obj gvmat64.obj inffas8664.obj" AS=ml64 
)
copy /Y %PATH_SRC%\%1\zlib.lib %PATH_INSTALL%\lib\zlib_a.lib
copy /Y %PATH_SRC%\%1\zlib.pdb %PATH_INSTALL%\lib\zlib_a.pdb
copy /Y %PATH_SRC%\%1\zlib1.dll %PATH_INSTALL%\bin\zlib1.dll
copy /Y %PATH_SRC%\%1\zlib1.pdb %PATH_INSTALL%\bin\zlib1.pdb
copy /Y %PATH_SRC%\%1\zdll.lib %PATH_INSTALL%\lib\zlib.lib
copy /Y %PATH_SRC%\%1\zlib.h %PATH_INSTALL%\include\zlib.h
copy /Y %PATH_SRC%\%1\zconf.h %PATH_INSTALL%\include\zconf.h