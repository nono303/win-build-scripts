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
set INCLUDE=%INCLUDE%;%PATH_INSTALL%\include;%PATH_INSTALL%\include\sqlite3

cd /D %PATH_SRC%\apr-util
	REM patch install
git apply --verbose %PATH_MODULES%\%1.patch
sed -i 's/_WIN32_WINNT 0x0501/_WIN32_WINNT 0x0601/g' %PATH_SRC%/apr/include/apr.hw
	REM patch libcrypto path...
sed -i 's/..\\\\openssl\\\\libcrypto.lib/%PATH_INSTALL:\=\\\\%\\\\lib\\\\libcrypto.lib/g' %PATH_SRC%/apr-util/Makefile.win
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

if not exist %PATH_INSTALL%\include\arch\. mkdir %PATH_INSTALL%\include\arch
copy /Y %PATH_SRC%\apr\include\arch\apr_private_common.h %PATH_INSTALL%\include\arch\apr_private_common.h
if not exist %PATH_INSTALL%\include\arch\win32\. mkdir %PATH_INSTALL%\include\arch\win32
copy /Y %PATH_SRC%\apr\include\arch\win32\*.h %PATH_INSTALL%\include\arch\win32

	REM version apr_dbd_odbc-1.dll
CD /D %PATH_SRC%\apr-util 
for /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set VERSION=%%F)
call %PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\bin\apr_dbd_odbc-1.dll "%VERSION%"