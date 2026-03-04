@echo off && call %PATH_UTILS%\init.bat %1 

sed -i 's/DNDEBUG/DNDEBUG \/w \/Gw \/Gy \/Zc:inline \/O2 \/Ob3 \/Zf \/Zi \/FS \/GL \/MD \/MP%NUMBER_OF_PROCESSORS% \/cgthreads8%AVX_SED% \/std:c%C_STD_VER%/g' %CYGPATH_SRC%/%1/Makefile.win
sed -i 's/ldflags = \/nologo/ldflags =\/nologo \/machine:%ARCH% \/DEBUG \/NOLOGO \/LTCG \/OPT:REF,ICF \/CGTHREADS:8/g' %CYGPATH_SRC%/%1/Makefile.win

NMAKE %NMAKE_OPTS% -f Makefile.win ^
	APR=%PATH_INSTALL% ^
	APRUTIL=%PATH_INSTALL% ^
	exe

for %%X in (exe pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\modsec-sdbm-util.%%X %PATH_INSTALL%\bin\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\modsec-sdbm-util.exe