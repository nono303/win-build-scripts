@echo off && call %PATH_MODULES_COMMON%\init.bat %1 

sed -i 's/DNDEBUG/DNDEBUG \/MP%NUMBER_OF_PROCESSORS%%AVX_SED%/g' %CYGPATH_SRC%/%1/Makefile.win
NMAKE %NMAKE_OPTS% -f Makefile.win ^
	APR=%PATH_INSTALL% ^
	APRUTIL=%PATH_INSTALL% ^
	exe

for %%X in (exe pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\modsec-sdbm-util.%%X %PATH_INSTALL%\bin\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\modsec-sdbm-util.exe