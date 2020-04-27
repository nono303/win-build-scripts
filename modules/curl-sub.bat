cd /D %PATH_SRC%\%1\winbuild
set CURL_CONFIGNAMELIB=%4_%2_deps-%3
if %4 == openssl-ssh2 (set CURL_SSLNMAKE=ENABLE_WINSSL=no WITH_SSH2=%2 WITH_SSL=%3)
if %4 == winssl (set CURL_SSLNMAKE=ENABLE_WINSSL=yes)

if exist %PATH_INSTALL%\%1\%CURL_CONFIGNAMELIB%\. rmdir /S /Q %PATH_INSTALL%\%1\%CURL_CONFIGNAMELIB%
for %%I in (lib/libcurl.rc src/curl.rc) do (sed -i -E 's/"ProductName",.*/"ProductName",      "%CURL_CONFIGNAMELIB%\\\\0"/g' %CYGPATH_SRC%/%1/%%I)

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

xcopy /E /C /F /Y %PATH_BUILD%\%1\%CURL_CONFIGNAMELIB% %PATH_INSTALL%\%1\%CURL_CONFIGNAMELIB%\