@echo off && call %PATH_MODULES_COMMON%\init.bat %1 

	REM result: CL -MD /nologo /DWIN32 /DWINNT /D_WINDOWS /w /Zf /Zi /FS /O2 /GL /MD /DNDEBUG /std:clatest /Gw /Gy /Zc:inline /arch:AVX2
sed -i 's/DNDEBUG/DNDEBUG \/std:clatest \/Gw \/Gy \/Zc:inline%AVX_SED%/g' %CYGPATH_SRC%/%1/apache2/Makefile.win
CD %PATH_SRC%\%1\apache2
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