cd ..
rmdir /S /Q C:\httpd-sdk\build\zlib
mkdir C:\httpd-sdk\build\zlib
cd /D C:\httpd-sdk\build\zlib
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -D%ZLIB_ASM%=1 ..\..\src\zlib
nmake /B /NOLOGO clean install
move /Y C:\src\zlib\zconf.h.included C:\src\zlib\zconf.h
copy /Y C:\httpd-sdk\build\zlib\zlib.pdb c:\httpd-sdk\install\bin\zlib1.pdb
cd /D C:\httpd-sdk\modules_bat