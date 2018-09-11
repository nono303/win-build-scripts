cd ..
rmdir /S /Q C:\httpd-sdk\build\jansson
mkdir C:\httpd-sdk\build\jansson
cd /D C:\httpd-sdk\build\jansson
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DUSE_URANDOM=OFF -DJANSSON_EXAMPLES=OFF -DJANSSON_BUILD_DOCS=OFF -DJANSSON_BUILD_SHARED_LIBS=ON ..\..\src\jansson
nmake /B /NOLOGO clean install
copy /Y C:\httpd-sdk\build\jansson\bin\jansson.pdb C:\httpd-sdk\install\bin\jansson.pdb
cd /D C:\httpd-sdk\modules_bat