@echo off && call %PATH_MODULES_COMMON%\init.bat %1 

CD %PATH_SRC%\%1\apache2
if %AVXECHO% == sse2 (set AVXSED=) else (set AVXSED= \/arch:AVX)
sed -i 's/DNDEBUG/DNDEBUG \/MP%NUMBER_OF_PROCESSORS%%AVXSED%/g' %CYGPATH_SRC%/%1/apache2/Makefile.win
NMAKE %NMAKE_OPTS% -f Makefile.win ^
	APACHE=%PATH_INSTALL% ^
	PCRE2=%PATH_INSTALL% ^
	LIBXML2=%PATH_INSTALL% ^
	LUA=%PATH_INSTALL% ^
	CURL=%PATH_INSTALL% ^
	YAJL=%PATH_INSTALL% ^
	dll
for %%X in (so pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\apache2\mod_security2.%%X %PATH_INSTALL%\modules\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\modules\mod_security2.so