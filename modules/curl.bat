call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM add nmake options : BUILDDIR & CONFIGNAMELIB in Makefile.vc
cd %PATH_SRC%\%1
git apply --verbose %PATH_MODULES%\curl.patch
sed -i 's/..\\\\builds/%SEDPATH_BUILD%\\\\%1/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc

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
			call %PATH_MODULES%\curl-sub.bat %1 %%m %%d %%s
		)
	)
)
echo on
if exist %PATH_INSTALL%\%1\. rmdir /S /Q %PATH_INSTALL%\%1
move /Y %PATH_BUILD%\%1 %PATH_INSTALL%