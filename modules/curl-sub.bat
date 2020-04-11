cd /D %PATH_SRC%\%1
git clean -fdx
	REM https://github.com/curl/curl/blob/master/GIT-INFO
copy /Y %PATH_SRC%\%1\src\tool_hugehelp.c.cvs %PATH_SRC%\%1\src\tool_hugehelp.c
cd /D %PATH_SRC%\%1\winbuild
set CURL_CONFIGNAMELIB=%4_%2_deps-%3
if %4 == openssl-ssh2 (set CURL_SSLNMAKE=ENABLE_WINSSL=no WITH_SSH2=%2 WITH_SSL=%3)
if %4 == winssl (set CURL_SSLNMAKE=ENABLE_WINSSL=yes)

nmake /f Makefile.vc ^
mode=%2 ^
VC=%MSVC_VER% ^
WITH_DEVEL=%PATH_INSTALL% ^
WITH_NGHTTP2=%3 ^
WITH_CARES=%3 ^
WITH_ZLIB=%3 ^
ENABLE_SSPI=yes ^
ENABLE_IPV6=yes ^
ENABLE_IDN=yes ^
GEN_PDB=yes ^
DEBUG=no ^
MACHINE=%ARCH% ^
BUILDDIR=%PATH_BUILD%\%1 ^
CONFIGNAMELIB=%CURL_CONFIGNAMELIB% ^
%CURL_SSLNMAKE%

rmdir /S /Q %PATH_BUILD%\%1\%CURL_CONFIGNAMELIB%-obj-curl
rmdir /S /Q %PATH_BUILD%\%1\%CURL_CONFIGNAMELIB%-obj-lib
exit /B 0