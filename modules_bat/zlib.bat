REM https://stackoverflow.com/questions/29505121/cmake-zlib-build-on-windows

mkdir C:\httpd-sdk\install\lib
mkdir C:\httpd-sdk\install\bin
mkdir C:\httpd-sdk\install\include
cd /D C:\httpd-sdk\src\zlib
nmake %NMAKE_OPTS% /f win32/Makefile.msc clean
if %ARCH% == x86 (
	nmake -f win32/Makefile.msc LOC="-DASMV -DASMINF" OBJA="inffas32.obj match686.obj"
)
if %ARCH% == x64 (
	nmake -f win32/Makefile.msc AS=ml64 LOC="-DASMV -DASMINF -I." OBJA="inffasx64.obj gvmat64.obj inffas8664.obj"
)
copy /Y C:\httpd-sdk\src\zlib\zlib.lib C:\httpd-sdk\install\lib\zlibstatic.lib
copy /Y C:\httpd-sdk\src\zlib\zlib.pdb C:\httpd-sdk\install\lib\zlibstatic.pdb
copy /Y C:\httpd-sdk\src\zlib\zlib1.dll c:\httpd-sdk\install\bin\zlib1.dll
copy /Y C:\httpd-sdk\src\zlib\zlib1.pdb c:\httpd-sdk\install\bin\zlib1.pdb
copy /Y C:\httpd-sdk\src\zlib\zdll.lib C:\httpd-sdk\install\lib\zlib.lib
copy /Y C:\httpd-sdk\src\zlib\zlib.h C:\httpd-sdk\install\include\zlib.h
copy /Y C:\src\zlib\zconf.h C:\httpd-sdk\install\include\zconf.h
cd /D C:\httpd-sdk\modules_bat