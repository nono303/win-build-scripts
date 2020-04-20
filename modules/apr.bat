@echo off
for %%X in (apr apr-util apr-iconv) do (
	call %PATH_MODULES_COMMON%\init.bat %%X cmake
	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/apr.sh "%AVXSED%" "%CYGPATH_SRC%/%%X" "%NUMBER_OF_PROCESSORS%" "%CYGPATH_SRC%"
)
	REM https://www.apachelounge.com/viewtopic.php?t=8260 / https://docs.microsoft.com/fr-fr/cpp/porting/modifying-winver-and-win32-winnt?view=vs-2019
sed -i 's/_WIN32_WINNT 0x0501/_WIN32_WINNT 0x0601/g' %PATH_SRC%/apr/include/apr.hw

if not exist %PATH_SRC%\apr-util\xml\expat\. mklink /J %PATH_SRC%\apr-util\xml\expat %PATH_SRC%\libexpat\expat
if not exist %PATH_INSTALL%\lib\sqlite3.pdb mklink /H %PATH_INSTALL%\lib\sqlite3.pdb %PATH_INSTALL%\bin\sqlite3.pdb

set LIB=%LIB%;%PATH_INSTALL%\lib
set INCLUDE=%INCLUDE%;%PATH_INSTALL%\include

cd /D %PATH_SRC%\apr-util
	REM patch install
git apply --verbose %PATH_MODULES%\%1.patch
	REM	DBD_LIST="sqlite3 pgsql oracle mysql freetds"
	REM	DBM_LIST="db gdbm"
nmake  %NMAKE_OPTS% ^
	/f Makefile.win ^
	USEMAK=1 ^
	ARCH="%archmsbuild% Release" ^
	APU_PATH=%PATH_SRC%\apr-util ^
	API_PATH=%PATH_SRC%\apr-iconv ^
	APR_PATH=%PATH_SRC%\apr ^
	DBD_LIST="sqlite3" ^
	XML_PARSER="libexpat" ^
	CRYPTO_LIST="openssl" ^
	PREFIX=%PATH_INSTALL% ^
	buildall install
