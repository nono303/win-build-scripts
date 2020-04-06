rmdir /S /Q %PATH_BUILD%\bzip2-1.0.6
mkdir %PATH_BUILD%\bzip2-1.0.6
cd /D %PATH_SRC%\bzip2-1.0.6
git reset --hard
git clean -fdx
sed -i 's/MP%MTPROC%/MP%MTPROC% %AVXSED%/g' %CYGPATH_SRC%/bzip2-1.0.6/makefile.msc
nmake %NMAKE_OPTS% /f Makefile.msc clean lib bzip2
move /Y %PATH_SRC%\bzip2-1.0.6\*.lib %PATH_INSTALL%\lib
move /Y %PATH_SRC%\bzip2-1.0.6\*.exe %PATH_INSTALL%\bin
move /Y %PATH_SRC%\bzip2-1.0.6\libbz2.pdb %PATH_INSTALL%\lib\libbz2.pdb 
move /Y %PATH_SRC%\bzip2-1.0.6\bzip2recover.pdb %PATH_INSTALL%\bin\bzip2recover.pdb
move /Y %PATH_SRC%\bzip2-1.0.6\bzip2.pdb %PATH_INSTALL%\bin\bzip2.pdb
copy /Y %PATH_SRC%\bzip2-1.0.6\bzlib.h %PATH_INSTALL%\include\bzlib.h
	REM libbz2 => bzip2  [pcre]
mklink /h %PATH_INSTALL%\lib\bzip2.lib %PATH_INSTALL%\lib\libbz2.lib
mklink /h %PATH_INSTALL%\lib\bzip2.pdb %PATH_INSTALL%\lib\libbz2.pdb
	REM libbz2 => bzip2 [PHP]
mklink /h %PATH_INSTALL%\lib\libbz2_a.lib %PATH_INSTALL%\lib\libbz2.lib
mklink /h %PATH_INSTALL%\lib\libbz2_a.pdb %PATH_INSTALL%\lib\libbz2.pdb
cd /D %PATH_MODULE_BAT%