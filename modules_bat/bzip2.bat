rmdir /S /Q C:\httpd-sdk\build\bzip2-1.0.6
mkdir C:\httpd-sdk\build\bzip2-1.0.6
cd /D c:\httpd-sdk\src\bzip2-1.0.6
git reset --hard
git clean -fdx
sed -i 's/MP%MTPROC%/MP%MTPROC% %AVXSED%/g' /cygdrive/c/httpd-sdk/src/bzip2-1.0.6/makefile.msc
nmake %NMAKE_OPTS% /f Makefile.msc clean lib bzip2
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.lib C:\httpd-sdk\install\lib
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.exe c:\httpd-sdk\install\bin
move /Y C:\httpd-sdk\src\bzip2-1.0.6\libbz2.pdb C:\httpd-sdk\install\lib\libbz2.pdb 
move /Y C:\httpd-sdk\src\bzip2-1.0.6\bzip2recover.pdb c:\httpd-sdk\install\bin\bzip2recover.pdb
move /Y C:\httpd-sdk\src\bzip2-1.0.6\bzip2.pdb c:\httpd-sdk\install\bin\bzip2.pdb
copy /Y c:\httpd-sdk\src\bzip2-1.0.6\bzlib.h c:\httpd-sdk\install\include\bzlib.h
	REM libbz2 => bzip2  [pcre]
mklink /h c:\httpd-sdk\install\lib\bzip2.lib C:\httpd-sdk\install\lib\libbz2.lib
mklink /h c:\httpd-sdk\install\lib\bzip2.pdb C:\httpd-sdk\install\lib\libbz2.pdb
	REM libbz2 => bzip2 [PHP]
mklink /h c:\httpd-sdk\install\lib\libbz2_a.lib C:\httpd-sdk\install\lib\libbz2.lib
mklink /h c:\httpd-sdk\install\lib\libbz2_a.pdb C:\httpd-sdk\install\lib\libbz2.pdb
cd /D C:\httpd-sdk\modules_bat