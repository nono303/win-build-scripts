REM https://stackoverflow.com/questions/29505121/cmake-zlib-build-on-windows

mkdir %PATH_INSTALL%\lib
mkdir %PATH_INSTALL%\bin
mkdir %PATH_INSTALL%\include
cd /D %PATH_SRC%\zlib
git reset --hard
git clean -fdx
sed -i 's/ARFLAGS = -nologo/ARFLAGS = -nologo -ltcg/g' %CYGPATH_SRC%/zlib/win32/Makefile.msc
sed -i 's/-incremental:no -opt:ref/-ltcg -opt:ICF/g' %CYGPATH_SRC%/zlib/win32/Makefile.msc
sed -i 's/-O2/-GL -GS- -guard:cf- -FD -GF -Zc:inline -MP%NUMBER_OF_PROCESSORS% -LD -Ox %AVXMSC% -wd4267/g' %CYGPATH_SRC%/zlib/win32/Makefile.msc
nmake %NMAKE_OPTS% /f win32/Makefile.msc clean
if %ARCH% == x86 (
	nmake -f win32/Makefile.msc LOC="-DASMV -DASMINF" OBJA="inffas32.obj match686.obj"
)
if %ARCH% == x64 (
	nmake -f win32/Makefile.msc AS=ml64 LOC="-DASMV -DASMINF -I." OBJA="inffasx64.obj gvmat64.obj inffas8664.obj"
)
copy /Y %PATH_SRC%\zlib\zlib.lib %PATH_INSTALL%\lib\zlib_a.lib
copy /Y %PATH_SRC%\zlib\zlib.pdb %PATH_INSTALL%\lib\zlib_a.pdb
copy /Y %PATH_SRC%\zlib\zlib1.dll %PATH_INSTALL%\bin\zlib1.dll
copy /Y %PATH_SRC%\zlib\zlib1.pdb %PATH_INSTALL%\bin\zlib1.pdb
copy /Y %PATH_SRC%\zlib\zdll.lib %PATH_INSTALL%\lib\zlib.lib
copy /Y %PATH_SRC%\zlib\zlib.h %PATH_INSTALL%\include\zlib.h
copy /Y %PATH_SRC%\zlib\zconf.h %PATH_INSTALL%\include\zconf.h
cd /D %PATH_MODULES%