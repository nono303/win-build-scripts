@echo off && call %PATH_MODULES_COMMON%\init.bat %1 
REM https://github.com/SpiderLabs/ModSecurity/blob/v2.9.6/README_WINDOWS.md
REM https://www.apachelounge.com/viewtopic.php?p=40844
set INCLUDE=%INCLUDE%;%PATH_INSTALL%\include;%PATH_INSTALL%\include\libxml2;%PATH_INSTALL_OSSL%\include

CD %PATH_SRC%\%1\apache2
if %AVXECHO% == sse2 (set AVXSED=) else (set AVXSED= \/arch:AVX)
sed -i 's/DNDEBUG/DNDEBUG \/MP%NUMBER_OF_PROCESSORS%%AVXSED%/g' %CYGPATH_SRC%/%1/apache2/Makefile.win
NMAKE %NMAKE_OPTS% -f Makefile.win APACHE=%PATH_INSTALL% PCRE2=%PATH_INSTALL%\lib LIBXML2=%PATH_INSTALL%\lib LUA=%PATH_INSTALL%\lib CURL=%PATH_INSTALL%\lib YAJL=%PATH_INSTALL%\lib dll
for %%X in (so pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\apache2\mod_security2.%%X %PATH_INSTALL%\modules\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\modules\mod_security2.so