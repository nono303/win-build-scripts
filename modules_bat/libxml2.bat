cd /D C:\httpd-sdk\src\libxml2\win32\
cscript configure.js compiler=nmakemsvc prefix=C:\httpd-sdk\install include=C:\httpd-sdk\install\include lib=C:\httpd-sdk\install\lib debug=no zlib=yes
nmake /NOLOGO /A /B /f Makefile.msvc clean install-libs
copy /Y C:\httpd-sdk\src\libxml2\win32\bin.msvc\libxml2.pdb C:\httpd-sdk\install\bin\libxml2.pdb
nmake /NOLOGO /A /B /f Makefile.msvc distclean
cd /D C:\httpd-sdk\modules_bat