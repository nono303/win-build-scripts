@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM https://github.com/curl/curl/blob/master/GIT-INFO
copy /Y %PATH_SRC%\%1\src\tool_hugehelp.c.cvs %PATH_SRC%\%1\src\tool_hugehelp.c

	REM add nmake options : BUILDDIR & CONFIGNAMELIB in Makefile.vc
cd %PATH_SRC%\%1
git apply --verbose %PATH_MODULES%\%1.patch
sed -i 's/..\\\\builds/%PATH_BUILD:\=\\\\%\\\\%1/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc

	REM https://curl.haxx.se/mail/lib-2012-10/0163.html
sed -i 's/SSH2        = dll/SSH2        = dll\r\nWIN_LIBS     = $(WIN_LIBS) user32.lib/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc
sed -i 's/libcares/cares_static/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc

sed -i 's/\/W4/\/O2 \/GL \/MD \/Zi \/MP%NUMBER_OF_PROCESSORS% %AVXSED%/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc
sed -i 's/LFLAGS     = \/nologo/LFLAGS     = \/nologo \/LTCG \/OPT:ICF/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc
sed -i 's/LNKLIB     = lib.exe/LNKLIB     = lib.exe \/LTCG/g' %CYGPATH_SRC%/%1/winbuild/MakefileBuild.vc
sed -i 's/(MAKE) \/NOLOGO/(MAKE) %NMAKE_OPTS:/=\/%/g' %CYGPATH_SRC%/%1/winbuild/Makefile.vc

	REM copyright symbol issue : verpatch doesn't work without any error output !!
for %%I in (lib/libcurl.rc src/curl.rc) do (
	sed -i -E 's/"LegalCopyright",.*/"LegalCopyright",   "%RC_COPYRIGHT:/=\/%\\\\0"/g' %CYGPATH_SRC%/%1/%%I
	sed -i -E 's/"InternalName",.*/"InternalName",     "%ARCH% %AVXECHO% MSVC %vcvars_ver%\\\\0"/g' %CYGPATH_SRC%/%1/%%I
)

	REM static dll
set CURL_MODE=dll
	REM static dll
set CURL_DEPS_MODE=dll
	REM openssl-ssh2 winssl
		REM ssh2 require opensll & zlib / don't work with winssl
		REM openssl-ssh2 : PHP / winssl : HTTPD
set CURL_SSLENGINE=openssl-ssh2 winssl

for %%s in (%CURL_SSLENGINE%) do (
	for %%m in (%CURL_MODE%) do (
		for %%d in (%CURL_DEPS_MODE%) do (
			call %PATH_MODULES%\curl-sub.bat %1 %%m %%d %%s
		)
	)
)