rmdir /S /Q C:\httpd-sdk\build\bzip2-1.0.6
mkdir C:\httpd-sdk\build\bzip2-1.0.6
cd /D c:\httpd-sdk\src\bzip2-1.0.6
nmake /f Makefile.msc clean lib bzip2
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.lib C:\httpd-sdk\build\bzip2-1.0.6
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.exe C:\httpd-sdk\build\bzip2-1.0.6
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.obj C:\httpd-sdk\build\bzip2-1.0.6
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.pdb C:\httpd-sdk\build\bzip2-1.0.6
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.idb C:\httpd-sdk\build\bzip2-1.0.6
copy /Y c:\httpd-sdk\src\bzip2-1.0.6\bzlib.h c:\httpd-sdk\install\include\bzlib.h
REM libbz2 => bzip2
copy /Y C:\httpd-sdk\build\bzip2-1.0.6\libbz2.lib c:\httpd-sdk\install\lib\bzip2.lib
copy /Y C:\httpd-sdk\build\bzip2-1.0.6\libbz2.pdb c:\httpd-sdk\install\lib\bzip2.pdb