rmdir /S /Q C:\src\curl\builds
cd /D C:\src\curl\winbuild
REM WITH_SSH2=%DLLSTATIC% KO avec openssl 1.1.1
REM dll || static
set DLLSTATIC=dll
git reset --hard
git clean -d -f
sed -i 's/\/W4/\/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/Zc:inline \/MP8 \/LD \/MD \/Ox \/W3 %AVXSED%/g' /cygdrive/c/httpd-sdk/src/curl/winbuild/MakefileBuild.vc
sed -i 's/LFLAGS     = \/nologo/LFLAGS     = \/nologo \/LTCG \/OPT:ICF/g' /cygdrive/c/httpd-sdk/src/curl/winbuild/MakefileBuild.vc
move /Y C:\httpd-sdk\src\curl\src\tool_hugehelp.c.cvs C:\httpd-sdk\src\curl\src\tool_hugehelp.c
nmake /f Makefile.vc mode=static VC=%MSVC_VER% WITH_DEVEL=c:/httpd-sdk/install WITH_NGHTTP2=%DLLSTATIC% WITH_CARES=%DLLSTATIC% WITH_ZLIB=%DLLSTATIC% ENABLE_SSPI=yes ENABLE_IPV6=yes ENABLE_IDN=yes ENABLE_WINSSL=yes GEN_PDB=yes DEBUG=no MACHINE=%ARCH%
nmake /f Makefile.vc mode=dll VC=%MSVC_VER% WITH_DEVEL=c:/httpd-sdk/install WITH_NGHTTP2=%DLLSTATIC% WITH_CARES=%DLLSTATIC% WITH_ZLIB=%DLLSTATIC% ENABLE_SSPI=yes ENABLE_IPV6=yes ENABLE_IDN=yes ENABLE_WINSSL=yes GEN_PDB=yes DEBUG=no MACHINE=%ARCH%

mkdir C:\httpd-sdk\install\include\curl\
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\bin\libcurl.dll C:\httpd-sdk\install\bin\libcurl.dll
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\curl.h C:\httpd-sdk\install\include\curl\curl.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\curlver.h C:\httpd-sdk\install\include\curl\curlver.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\easy.h C:\httpd-sdk\install\include\curl\easy.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\mprintf.h C:\httpd-sdk\install\include\curl\mprintf.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\multi.h C:\httpd-sdk\install\include\curl\multi.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\stdcheaders.h C:\httpd-sdk\install\include\curl\stdcheaders.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\system.h C:\httpd-sdk\install\include\curl\system.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\typecheck-gcc.h C:\httpd-sdk\install\include\curl\typecheck-gcc.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\include\curl\urlapi.h C:\httpd-sdk\install\include\curl\urlapi.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\lib\libcurl.lib C:\httpd-sdk\install\lib\libcurl.lib
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\lib\libcurl.pdb C:\httpd-sdk\install\lib\libcurl.pdb
copy /Y C:\httpd-sdk\install\lib\libcurl.pdb C:\httpd-sdk\install\bin\libcurl.pdb
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-static-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\lib\libcurl_a.lib C:\httpd-sdk\install\lib\libcurl_a.lib
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-static-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\lib\libcurl_a.pdb C:\httpd-sdk\install\lib\libcurl_a.pdb
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\bin\curl.exe C:\httpd-sdk\install\bin\curl.exe
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll\bin\curl.pdb C:\httpd-sdk\install\bin\curl.pdb
Copy /Y C:\httpd-sdk\src\curl\include\curl\*.h C:\httpd-sdk\install\include\curl

cd /D C:\httpd-sdk\modules_bat