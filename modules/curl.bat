call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM add nmake options : BUILDDIR & CONFIGNAMELIB in Makefile.vc
cd %PATH_SRC%\%1
git apply --verbose %PATH_MODULES%\%1.patch
sed -i 's/..\\\\builds/%PATH_BUILD:\=\\\\%\\\\%1/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc

	REM https://curl.haxx.se/mail/lib-2012-10/0163.html
sed -i 's/SSH2        = dll/SSH2        = dll\r\nWIN_LIBS     = $(WIN_LIBS) user32.lib/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc
sed -i 's/libcares/cares_static/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc

sed -i 's/\/W4/\/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/Zc:inline \/MP%NUMBER_OF_PROCESSORS% \/LD \/MD \/Ox \/W3 %AVXSED%/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc
sed -i 's/LFLAGS     = \/nologo/LFLAGS     = \/nologo \/LTCG \/OPT:ICF/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc
sed -i 's/LNKLIB     = lib.exe/LNKLIB     = lib.exe \/LTCG/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc

	REM WITH_SSH2=static WITH_SSL=static // doesn't work on mod_md
	REM libssh2 : req opensll & zlib / ko winssl
	REM WITH_PREFIX=%PATH_INSTALL%
	REM ***** Loop for all versions ***
REM set CURL_MODE=static dll
REM set CURL_SSLENGINE=openssl-ssh2 winssl
REM for %%s in (%CURL_SSLENGINE%) do (
REM 	for %%m in (%CURL_MODE%) do (
REM 		for %%d in (%CURL_MODE%) do (
REM 			echo on
REM 			call %PATH_MODULES%\curl-sub.bat %1 %%m %%d %%s
REM 		)
REM 	)
REM )

	REM Apache
call %PATH_MODULES%\curl-sub.bat %1 dll static winssl
	REM PHP
call %PATH_MODULES%\curl-sub.bat %1 static static openssl-ssh2

if exist %PATH_INSTALL%\%1\. rmdir /S /Q %PATH_INSTALL%\%1
move /Y %PATH_BUILD%\%1 %PATH_INSTALL%