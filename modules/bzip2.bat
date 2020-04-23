call %PATH_MODULES_COMMON%\init.bat %1

	REM php issue : request libbz2_a instead of libbz2
set BZIP_LIB_NAME=libbz2

sed -i 's/-DWIN32 -MD -Ox -D_FILE_OFFSET_BITS=64 -nologo/\/DWIN32 \/MD \/Ox \/D_FILE_OFFSET_BITS=64 \/nologo \/Zi \/GL \/GS- \/Oy- \/w \/guard:cf- \/FD \/GF \/Zc:inline \/MP%NUMBER_OF_PROCESSORS% %AVXSED%/g' %CYGPATH_SRC%/%1/makefile.msc
sed -i 's/lib \/out/lib \/nologo \/ltcg \/out/g' %CYGPATH_SRC%/%1/makefile.msc
sed -i 's/-o bzip2/\/Fdbzip2.pdb/g' %CYGPATH_SRC%/%1/makefile.msc
sed -i 's/-o bzip2recover/\/Fdbzip2recover.pdb/g' %CYGPATH_SRC%/%1/makefile.msc
sed -i 's/-o \$\*\.obj/\/Fdlibbz2.pdb/g' %CYGPATH_SRC%/%1/makefile.msc
sed -i 's/libbz2./%BZIP_LIB_NAME%./g' %CYGPATH_SRC%/%1/makefile.msc

nmake %NMAKE_OPTS% /f Makefile.msc lib bzip2

move /Y %PATH_SRC%\%1\*.lib %PATH_INSTALL%\lib
move /Y %PATH_SRC%\%1\*.exe %PATH_INSTALL%\bin
move /Y %PATH_SRC%\%1\%BZIP_LIB_NAME%.pdb %PATH_INSTALL%\lib\%BZIP_LIB_NAME%.pdb 
move /Y %PATH_SRC%\%1\bzip2recover.pdb %PATH_INSTALL%\bin\bzip2recover.pdb
move /Y %PATH_SRC%\%1\bzip2.pdb %PATH_INSTALL%\bin\bzip2.pdb
copy /Y %PATH_SRC%\%1\bzlib.h %PATH_INSTALL%\include\bzlib.h

	REM version
CD /D %PATH_SRC%\%1 
for /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set VERSION=%%F)
for %%X in (bzip2recover bzip2) do (call %PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\bin\%%X.exe "%VERSION:~6%")