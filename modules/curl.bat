call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM add nmake options : BUILDDIR & CONFIGNAMELIB in Makefile.vc
cd %PATH_SRC%\%1
git apply %PATH_MODULES%\curl.patch
sed -i 's/..\\\\builds/%SEDPATH_BUILD%\\\\%1/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc

	REM https://github.com/curl/curl/blob/master/GIT-INFO
move /Y %PATH_SRC%\%1\src\tool_hugehelp.c.cvs %PATH_SRC%\%1\src\tool_hugehelp.c
	REM https://curl.haxx.se/mail/lib-2012-10/0163.html
sed -i 's/SSH2        = dll/SSH2        = dll\r\nWIN_LIBS     = $(WIN_LIBS) user32.lib/g' %CYGPATH_SRC%/curl/winbuild/MakefileBuild.vc
sed -i 's/libcares/cares_static/g' %CYGPATH_SRC%/curl/winbuild/MakefileBuild.vc

sed -i 's/\/W4/\/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/Zc:inline \/MP%NUMBER_OF_PROCESSORS% \/LD \/MD \/Ox \/W3 %AVXSED%/g' %CYGPATH_SRC%/curl/winbuild/MakefileBuild.vc
sed -i 's/LFLAGS     = \/nologo/LFLAGS     = \/nologo \/LTCG \/OPT:ICF/g' %CYGPATH_SRC%/curl/winbuild/MakefileBuild.vc
sed -i 's/LNKLIB     = lib.exe/LNKLIB     = lib.exe \/LTCG/g' %CYGPATH_SRC%/curl/winbuild/MakefileBuild.vc

	REM WITH_SSH2=static WITH_SSL=static // doesn't work on mod_md
	REM libssh2 : req opensll & zlib / ko winssl
	REM WITH_PREFIX=%PATH_INSTALL%

set CURL_MODE=static dll
set CURL_SSLENGINE=openssl-ssh2 winssl
@echo off
for %%s in (%CURL_SSLENGINE%) do (
	for %%m in (%CURL_MODE%) do (
		for %%d in (%CURL_MODE%) do (
			echo on
			call %PATH_MODULES%\curl-sub.bat %%m %%d %%s %1
		)
	)
)
echo on



	REM dll
		REM KO tout static : cares en dll
		REM KO tout dll : ssh2 en static
		REM OK nmake /f Makefile.vc mode=dll VC=%MSVC_VER% WITH_DEVEL=c:/httpd-sdk/install WITH_CARES=dll WITH_SSH2=static WITH_SSL=static WITH_NGHTTP2=static WITH_ZLIB=static ENABLE_SSPI=yes ENABLE_IPV6=yes ENABLE_IDN=yes ENABLE_WINSSL=yes GEN_PDB=yes DEBUG=no MACHINE=%ARCH%
	REM WITH_SSH2=static WITH_SSL=dll // doesn't work on mod_md
nmake /f Makefile.vc mode=dll VC=%MSVC_VER% WITH_DEVEL=c:/httpd-sdk/install WITH_CARES=dll WITH_NGHTTP2=dll WITH_ZLIB=dll ENABLE_SSPI=yes ENABLE_IPV6=yes ENABLE_IDN=yes ENABLE_WINSSL=yes GEN_PDB=yes DEBUG=no MACHINE=%ARCH%

mkdir %PATH_INSTALL%\include\%1\
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rs%\lib\libcurl_a.lib %PATH_INSTALL%\lib\libcurl_a.lib
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rs%\lib\libcurl_a.pdb %PATH_INSTALL%\lib\libcurl_a.pdb

Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\bin\libcurl.dll %PATH_INSTALL%\bin\libcurl.dll
Copy /Y %PATH_INSTALL%\lib\libcurl.pdb %PATH_INSTALL%\bin\libcurl.pdb

Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\lib\libcurl.lib %PATH_INSTALL%\lib\libcurl.lib
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\lib\libcurl.pdb %PATH_INSTALL%\lib\libcurl.pdb
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\bin\curl.exe %PATH_INSTALL%\bin\curl.exe
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\bin\curl.pdb %PATH_INSTALL%\bin\curl.pdb

Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\%1\curl.h %PATH_INSTALL%\include\%1\curl.h
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\%1\curlver.h %PATH_INSTALL%\include\%1\curlver.h
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\%1\easy.h %PATH_INSTALL%\include\%1\easy.h
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\%1\mprintf.h %PATH_INSTALL%\include\%1\mprintf.h
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\%1\multi.h %PATH_INSTALL%\include\%1\multi.h
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\%1\stdcheaders.h %PATH_INSTALL%\include\%1\stdcheaders.h
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\%1\system.h %PATH_INSTALL%\include\%1\system.h
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\%1\typecheck-gcc.h %PATH_INSTALL%\include\%1\typecheck-gcc.h
Copy /Y %PATH_SRC%\%1\builds\libcurl-vc%MSVC_VER%-%ARCH%%rd%\include\%1\urlapi.h %PATH_INSTALL%\include\%1\urlapi.h
Copy /Y %PATH_SRC%\%1\include\%1\*.h %PATH_INSTALL%\include\curl
