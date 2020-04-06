rmdir /S /Q %PATH_SRC%\curl\builds
cd /D %PATH_SRC%\curl\winbuild
git reset --hard
git clean -fdx
move /Y %PATH_SRC%\curl\src\tool_hugehelp.c.cvs %PATH_SRC%\curl\src\tool_hugehelp.c

sed -i 's/\/W4/\/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/Zc:inline \/MP%MTPROC% \/LD \/MD \/Ox \/W3 %AVXSED%/g' %CYGPATH_SRC%/curl/winbuild/MakefileBuild.vc
sed -i 's/LFLAGS     = \/nologo/LFLAGS     = \/nologo \/LTCG \/OPT:ICF/g' %CYGPATH_SRC%/curl/winbuild/MakefileBuild.vc
sed -i 's/LNKLIB     = lib.exe/LNKLIB     = lib.exe \/LTCG/g' %CYGPATH_SRC%/curl/winbuild/MakefileBuild.vc

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

mkdir %PATH_INSTALL%\include\curl\
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rs%\lib\libcurl_a.lib %PATH_INSTALL%\lib\libcurl_a.lib
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rs%\lib\libcurl_a.pdb %PATH_INSTALL%\lib\libcurl_a.pdb

Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\bin\libcurl.dll %PATH_INSTALL%\bin\libcurl.dll
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\curl.h %PATH_INSTALL%\include\curl\curl.h
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\curlver.h %PATH_INSTALL%\include\curl\curlver.h
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\easy.h %PATH_INSTALL%\include\curl\easy.h
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\mprintf.h %PATH_INSTALL%\include\curl\mprintf.h
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\multi.h %PATH_INSTALL%\include\curl\multi.h
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\stdcheaders.h %PATH_INSTALL%\include\curl\stdcheaders.h
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\system.h %PATH_INSTALL%\include\curl\system.h
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\typecheck-gcc.h %PATH_INSTALL%\include\curl\typecheck-gcc.h
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\curl\urlapi.h %PATH_INSTALL%\include\curl\urlapi.h
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\lib\libcurl.lib %PATH_INSTALL%\lib\libcurl.lib
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\lib\libcurl.pdb %PATH_INSTALL%\lib\libcurl.pdb
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\bin\curl.exe %PATH_INSTALL%\bin\curl.exe
Copy /Y %PATH_SRC%\curl\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\bin\curl.pdb %PATH_INSTALL%\bin\curl.pdb

Copy /Y %PATH_INSTALL%\lib\libcurl.pdb %PATH_INSTALL%\bin\libcurl.pdb
Copy /Y %PATH_SRC%\curl\include\curl\*.h %PATH_INSTALL%\include\curl

cd /D %PATH_MODULE_BAT%