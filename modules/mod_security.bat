@echo off && call %PATH_MODULES_COMMON%\init.bat %1 

sed -i 's/DNDEBUG/DNDEBUG \/w \/Gw \/Gy \/Zc:inline \/O2 \/Ob3 \/Zf \/Zi \/FS \/GL \/MD \/MP%NUMBER_OF_PROCESSORS% \/cgthreads8%AVX_SED% \/std:c%C_STD_VER%/g' %CYGPATH_SRC%/%1/apache2/Makefile.win
sed -i 's/LDFLAGS =\/nologo/LDFLAGS =\/nologo \/machine:%ARCH% \/DEBUG \/NOLOGO \/LTCG \/OPT:REF,ICF \/CGTHREADS:8/g' %CYGPATH_SRC%/%1/apache2/Makefile.win

CD %PATH_SRC%\%1\apache2
NMAKE %NMAKE_OPTS% -f Makefile.win ^
	APACHE=%PATH_INSTALL% ^
	PCRE=%PATH_INSTALL% ^
	LIBXML2=%PATH_INSTALL% ^
	LUA=%PATH_INSTALL% ^
	CURL=%PATH_INSTALL% ^
	YAJL=%PATH_INSTALL% ^
	dll
for %%X in (so pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\apache2\mod_security2.%%X %PATH_INSTALL%\modules\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\modules\mod_security2.so