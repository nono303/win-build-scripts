cd /D C:\httpd-sdk\src\libxml2\
git reset --hard
git clean -fdx
cd /D C:\httpd-sdk\src\libxml2\win32\
cscript configure.js compiler=nmakemsvc prefix=C:\httpd-sdk\install include=C:\httpd-sdk\install\include lib=C:\httpd-sdk\install\lib debug=no zlib=yes
sed -i 's/\/W3/\/W3 \/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/Zc:inline \/MP%MTPROC% \/LD \/MD \/Ox \/wd4311 \/wd4090 \/wd4996 \/wd4789 %AVXSED%/g' /cygdrive/c/httpd-sdk/src/libxml2/win32/Makefile.msvc
sed -i 's/LDFLAGS = \/nologo/LDFLAGS = \/debug \/nologo \/LTCG \/OPT:ICF/g' /cygdrive/c/httpd-sdk/src/libxml2/win32/Makefile.msvc
sed -i 's/ARFLAGS = \/nologo/ARFLAGS = \/nologo \/LTCG/g' /cygdrive/c/httpd-sdk/src/libxml2/win32/Makefile.msvc

nmake %NMAKE_OPTS% /f Makefile.msvc clean install-libs
copy /Y C:\httpd-sdk\src\libxml2\win32\bin.msvc\libxml2.pdb C:\httpd-sdk\install\bin\libxml2.pdb
nmake %NMAKE_OPTS% /f Makefile.msvc distclean
	REM pour PHP
mklink /J C:\httpd-sdk\install\include\libxml C:\httpd-sdk\install\include\libxml2\libxml
cd /D C:\httpd-sdk\modules_bat