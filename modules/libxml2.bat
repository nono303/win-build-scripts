call %PATH_MODULES_COMMON%/init.bat %1

cd /D %PATH_SRC%\%1\win32\
cscript configure.js compiler=nmakemsvc prefix=%PATH_INSTALL% include=%PATH_INSTALL%\include lib=%PATH_INSTALL%\lib debug=no zlib=yes
sed -i 's/\/W3/\/W3 \/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/Zc:inline \/MP%NUMBER_OF_PROCESSORS% \/LD \/MD \/Ox \/wd4311 \/wd4090 \/wd4996 \/wd4789 %AVXSED%/g' %CYGPATH_SRC%/%1/win32/Makefile.msvc
sed -i 's/LDFLAGS = \/nologo/LDFLAGS = \/debug \/nologo \/LTCG \/OPT:ICF/g' %CYGPATH_SRC%/%1/win32/Makefile.msvc
sed -i 's/ARFLAGS = \/nologo/ARFLAGS = \/nologo \/LTCG/g' %CYGPATH_SRC%/%1/win32/Makefile.msvc

nmake %NMAKE_OPTS% /f Makefile.msvc clean install-libs
copy /Y %PATH_SRC%\%1\win32\bin.msvc\libxml2.pdb %PATH_INSTALL%\bin\libxml2.pdb
	REM pour PHP
mklink /J %PATH_INSTALL%\include\libxml %PATH_INSTALL%\include\%1\libxml