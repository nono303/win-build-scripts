cd ..
rmdir /S /Q C:\httpd-sdk\build\brotli
mkdir C:\httpd-sdk\build\brotli
cd /D C:\httpd-sdk\build\brotli
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON ..\..\src\brotli
nmake %NMAKE_OPTS% clean install
copy /Y C:\httpd-sdk\build\brotli\brotlicommon.pdb c:\httpd-sdk\install\bin\brotlicommon.pdb
copy /Y C:\httpd-sdk\build\brotli\brotli.pdb c:\httpd-sdk\install\bin\brotli.pdb 
copy /Y C:\httpd-sdk\build\brotli\brotlidec.pdb c:\httpd-sdk\install\bin\brotlidec.pdb
copy /Y C:\httpd-sdk\build\brotli\brotlienc.pdb c:\httpd-sdk\install\bin\brotlienc.pdb
cd /D C:\httpd-sdk\modules_bat