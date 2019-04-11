cd /D C:\httpd-sdk\src\boost
call bootstrap.bat
REM http://boost.2283326.n4.nabble.com/boost-1-63-fails-to-build-with-zlib-and-bzip2-in-different-directories-td4690868.html
set ZLIB_SOURCE="C:\src\zlib"
set ZLIB_INCLUDE="C:\httpd-sdk\install\include"
set ZLIB_LIBPATH="C:\httpd-sdk\install\lib"
set BZIP2_SOURCE="C:\httpd-sdk\src\bzip2-1.0.6"
set BZIP2_INCLUDE="C:\httpd-sdk\install\include"
set BZIP2_LIBPATH="C:\httpd-sdk\install\lib"
call b2 debug-symbols=on toolset=msvc-15.9 variant=release --with-system --with-thread --abbreviate-paths architecture=x86 address-model=%CYGV% --build-dir=C:\src\boost\%ARCH%\ install -j8
cd /D C:\httpd-sdk\modules_bat