cd /D %PATH_SRC%\%4
git clean -fdx
cd /D %PATH_SRC%\%4\winbuild
set CURL_CONFIGNAMELIB=%3_%1_deps-%2
if %3 == openssl-ssh2 (set CURL_SSLNMAKE=ENABLE_WINSSL=no WITH_SSH2=%1 WITH_SSL=%2)
if %3 == winssl (set CURL_SSLNMAKE=ENABLE_WINSSL=yes)

nmake /f Makefile.vc ^
mode=%1 ^
VC=%MSVC_VER% ^
WITH_DEVEL=%PATH_INSTALL% ^
WITH_NGHTTP2=%2 ^
WITH_CARES=%2 ^
WITH_ZLIB=%2 ^
ENABLE_SSPI=yes ^
ENABLE_IPV6=yes ^
ENABLE_IDN=yes ^
GEN_PDB=yes ^
DEBUG=no ^
MACHINE=%ARCH% ^
BUILDDIR=%PATH_BUILD%\%4 ^
CONFIGNAMELIB=%CURL_CONFIGNAMELIB% ^
%CURL_SSLNMAKE%

rmdir /S /Q %PATH_BUILD%\%4\%CURL_CONFIGNAMELIB%-obj-curl
rmdir /S /Q %PATH_BUILD%\%4\%CURL_CONFIGNAMELIB%-obj-lib
exit /B 0