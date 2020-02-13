rmdir /S /Q C:\src\curl\builds
cd /D C:\httpd-sdk\src\curl\winbuild
git reset --hard
git clean -fdx
move /Y C:\httpd-sdk\src\curl\src\tool_hugehelp.c.cvs C:\httpd-sdk\src\curl\src\tool_hugehelp.c

sed -i 's/\/W4/\/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/Zc:inline \/MP%MTPROC% \/LD \/MD \/Ox \/W3 %AVXSED%/g' /cygdrive/c/httpd-sdk/src/curl/winbuild/MakefileBuild.vc
sed -i 's/LFLAGS     = \/nologo/LFLAGS     = \/nologo \/LTCG \/OPT:ICF/g' /cygdrive/c/httpd-sdk/src/curl/winbuild/MakefileBuild.vc
sed -i 's/LNKLIB     = lib.exe/LNKLIB     = lib.exe \/LTCG/g' /cygdrive/c/httpd-sdk/src/curl/winbuild/MakefileBuild.vc

SET rd=-release-dll-cares-dll-zlib-dll-ipv6-sspi-winssl-nghttp2-dll
SET rs=-release-static-cares-static-zlib-static-ipv6-sspi-winssl-nghttp2-static

	REM static
	REM WITH_SSH2=static WITH_SSL=static // doesn't work on mod_md
nmake /f Makefile.vc mode=static	VC=%MSVC_VER% WITH_DEVEL=c:/httpd-sdk/install WITH_CARES=static WITH_NGHTTP2=static WITH_ZLIB=static ENABLE_SSPI=yes ENABLE_IPV6=yes ENABLE_IDN=yes ENABLE_WINSSL=yes GEN_PDB=yes DEBUG=no MACHINE=%ARCH%

	REM dll
		REM KO tout static : cares en dll
		REM KO tout dll : ssh2 en static
		REM OK nmake /f Makefile.vc mode=dll VC=%MSVC_VER% WITH_DEVEL=c:/httpd-sdk/install WITH_CARES=dll WITH_SSH2=static WITH_SSL=static WITH_NGHTTP2=static WITH_ZLIB=static ENABLE_SSPI=yes ENABLE_IPV6=yes ENABLE_IDN=yes ENABLE_WINSSL=yes GEN_PDB=yes DEBUG=no MACHINE=%ARCH%
	REM WITH_SSH2=static WITH_SSL=dll // doesn't work on mod_md
nmake /f Makefile.vc mode=dll VC=%MSVC_VER% WITH_DEVEL=c:/httpd-sdk/install WITH_CARES=dll WITH_NGHTTP2=dll WITH_ZLIB=dll ENABLE_SSPI=yes ENABLE_IPV6=yes ENABLE_IDN=yes ENABLE_WINSSL=yes GEN_PDB=yes DEBUG=no MACHINE=%ARCH%

mkdir C:\httpd-sdk\install\include\curl\
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rs%\lib\libcurl_a.lib C:\httpd-sdk\install\lib\libcurl_a.lib
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rs%\lib\libcurl_a.pdb C:\httpd-sdk\install\lib\libcurl_a.pdb

Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\bin\libcurl.dll C:\httpd-sdk\install\bin\libcurl.dll
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\curl.h C:\httpd-sdk\install\include\curl\curl.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\curlver.h C:\httpd-sdk\install\include\curl\curlver.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\easy.h C:\httpd-sdk\install\include\curl\easy.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\mprintf.h C:\httpd-sdk\install\include\curl\mprintf.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\multi.h C:\httpd-sdk\install\include\curl\multi.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\stdcheaders.h C:\httpd-sdk\install\include\curl\stdcheaders.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\system.h C:\httpd-sdk\install\include\curl\system.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\typecheck-gcc.h C:\httpd-sdk\install\include\curl\typecheck-gcc.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\urlapi.h C:\httpd-sdk\install\include\curl\urlapi.h
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\lib\libcurl.lib C:\httpd-sdk\install\lib\libcurl.lib
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\lib\libcurl.pdb C:\httpd-sdk\install\lib\libcurl.pdb
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\bin\curl.exe C:\httpd-sdk\install\bin\curl.exe
Copy /Y C:\httpd-sdk\src\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\bin\curl.pdb C:\httpd-sdk\install\bin\curl.pdb

Copy /Y C:\httpd-sdk\install\lib\libcurl.pdb C:\httpd-sdk\install\bin\libcurl.pdb
Copy /Y C:\httpd-sdk\src\curl\include\curl\*.h C:\httpd-sdk\install\include\curl

cd /D C:\httpd-sdk\modules_bat