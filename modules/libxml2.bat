@echo off && call %PATH_MODULES_COMMON%\init.bat %1

cd /D %PATH_SRC%/%1/win32
cscript configure.js ^
	compiler=msvc ^
	vcmanifest=yes ^
	prefix=%PATH_INSTALL% ^
	include=%PATH_INSTALL%\include ^
	lib=%PATH_INSTALL%\lib ^
	debug=no ^
	zlib=yes ^
	lzma=no
sed -i 's/Zc:inline/Zc:inline \/MP%NUMBER_OF_PROCESSORS% %AVXSED%/g' %CYGPATH_SRC%/%1/win32/Makefile.msvc
nmake %NMAKE_OPTS% /f Makefile.msvc clean install-libs
xcopy /C /F /Y %PATH_SRC%\%1\win32\bin.msvc\libxml2.pdb %PATH_INSTALL%\bin\*
