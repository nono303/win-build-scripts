rmdir /S /Q C:\src\curl\builds
cd /D C:\src\curl\winbuild
REM WITH_SSH2=dll KO avec openssl 1.1.1
nmake /f Makefile.vc mode=static VC=15 WITH_DEVEL=c:/httpd-sdk/install WITH_NGHTTP2=dll WITH_CARES=dll WITH_ZLIB=dll ENABLE_SSPI=yes ENABLE_IPV6=yes ENABLE_IDN=yes ENABLE_WINSSL=yes GEN_PDB=yes DEBUG=no MACHINE=%ARCH%
nmake /f Makefile.vc mode=dll VC=15 WITH_DEVEL=c:/httpd-sdk/install WITH_NGHTTP2=dll WITH_CARES=dll WITH_ZLIB=dll ENABLE_SSPI=yes ENABLE_IPV6=yes ENABLE_IDN=yes ENABLE_WINSSL=yes GEN_PDB=yes DEBUG=no MACHINE=%ARCH%

Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\bin\libcurl.dll C:\httpd-sdk\install\bin\libcurl.dll
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\curl.h C:\httpd-sdk\install\include\curl\curl.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\curlver.h C:\httpd-sdk\install\include\curl\curlver.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\easy.h C:\httpd-sdk\install\include\curl\easy.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\mprintf.h C:\httpd-sdk\install\include\curl\mprintf.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\multi.h C:\httpd-sdk\install\include\curl\multi.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\stdcheaders.h C:\httpd-sdk\install\include\curl\stdcheaders.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\system.h C:\httpd-sdk\install\include\curl\system.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\typecheck-gcc.h C:\httpd-sdk\install\include\curl\typecheck-gcc.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\urlapi.h C:\httpd-sdk\install\include\curl\urlapi.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\lib\libcurl.lib C:\httpd-sdk\install\lib\libcurl.lib
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\lib\libcurl.pdb C:\httpd-sdk\install\lib\libcurl.pdb
copy /Y C:\httpd-sdk\install\lib\libcurl.pdb C:\httpd-sdk\install\bin\libcurl.pdb
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-static-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\lib\libcurl_a.lib C:\httpd-sdk\install\lib\libcurl_a.lib
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-static-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\lib\libcurl_a.pdb C:\httpd-sdk\install\lib\libcurl_a.pdb
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\bin\curl.exe C:\httpd-sdk\install\bin\curl.exe
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc15-x64-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\bin\curl.pdb C:\httpd-sdk\install\bin\curl.pdb
mkdir C:\httpd-sdk\install\include\curl\
Copy /Y C:\httpd-sdk\src\curl\include\curl\*.h C:\httpd-sdk\install\include\curl

cd /D C:\httpd-sdk\modules_bat