cd ..
rmdir /S /Q C:\httpd-sdk\build\lua
mkdir C:\httpd-sdk\build\lua
cd /D C:\httpd-sdk\build\lua
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DLUA_BUILD_WLUA=OFF -DLUA_BUILD_AS_DLL=ON ..\..\src\lua
nmake /B /NOLOGO clean install
copy /Y C:\httpd-sdk\build\lua\lua.pdb C:\httpd-sdk\install\bin\lua.pdb