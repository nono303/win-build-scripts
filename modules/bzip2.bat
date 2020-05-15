@echo off && call %PATH_MODULES_COMMON%\init.bat %1

sed -i 's/-DWIN32 -MD -Ox -D_FILE_OFFSET_BITS=64 -nologo/\/DWIN32 \/D_FILE_OFFSET_BITS=64 \/nologo \/O2 \/GL \/MD \/Zi \/w \/MP%NUMBER_OF_PROCESSORS% %AVXSED%/g' %CYGPATH_SRC%/%1/makefile.msc
sed -i 's/lib \/out/lib \/nologo \/ltcg \/out/g' %CYGPATH_SRC%/%1/makefile.msc
sed -i 's/-o bzip2/\/Fdbzip2.pdb/g' %CYGPATH_SRC%/%1/makefile.msc
sed -i 's/-o bzip2recover/\/Fdbzip2recover.pdb/g' %CYGPATH_SRC%/%1/makefile.msc
sed -i 's/-o \$\*\.obj/\/Fdlibbz2.pdb/g' %CYGPATH_SRC%/%1/makefile.msc

nmake %NMAKE_OPTS% /f Makefile.msc lib bzip2

xcopy /C /F /Y %PATH_SRC%\%1\*.lib %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_SRC%\%1\*.exe %PATH_INSTALL%\bin\
xcopy /C /F /Y %PATH_SRC%\%1\libbz2.pdb %PATH_INSTALL%\lib\
xcopy /C /F /Y %PATH_SRC%\%1\bzip2recover.pdb %PATH_INSTALL%\bin\
xcopy /C /F /Y %PATH_SRC%\%1\bzip2.pdb %PATH_INSTALL%\bin\
xcopy /C /F /Y %PATH_SRC%\%1\bzlib.h %PATH_INSTALL%\include\*
for %%X in (bzip2recover bzip2) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X.exe)