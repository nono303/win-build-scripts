call %PATH_MODULES_COMMON%\init.bat %1

cd /D %PATH_SRC%/%1/win32
cscript configure.js compiler=nmakemsvc prefix=%PATH_INSTALL% include=%PATH_INSTALL%\include lib=%PATH_INSTALL%\lib debug=no zlib=yes
git apply %PATH_MODULES%\libxml2.patch
sed -i 's/Zc:inline/Zc:inline \/MP%NUMBER_OF_PROCESSORS% %AVXSED%/g' %CYGPATH_SRC%/%1/win32/Makefile.msvc
nmake %NMAKE_OPTS% /f Makefile.msvc clean install-libs

copy /Y %PATH_SRC%\%1\win32\bin.msvc\libxml2.pdb %PATH_INSTALL%\bin\libxml2.pdb
	REM pour PHP
if not exist %PATH_INSTALL%\include\libxml\. mklink /J %PATH_INSTALL%\include\libxml %PATH_INSTALL%\include\%1\libxml