@echo off
for %%X in (apr apr-iconv apr-util) do (
	call %PATH_MODULES_COMMON%\init.bat %%X cmake
	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/apr.sh "%AVXSED%" "%CYGPATH_SRC%/%%X" "%NUMBER_OF_PROCESSORS%" "%CYGPATH_SRC%"
)

if not exist %PATH_SRC%\apr-util\xml\expat\. mklink /J %PATH_SRC%\apr-util\xml\expat %PATH_SRC%\libexpat\expat
if not exist %PATH_INSTALL%\lib\sqlite3.pdb mklink /H %PATH_INSTALL%\lib\sqlite3.pdb %PATH_INSTALL%\bin\sqlite3.pdb

set LIB=%LIB%;%PATH_INSTALL%\lib
set INCLUDE=%INCLUDE%;%PATH_INSTALL%\include;%PATH_INSTALL%\include\sqlite3

	REM https://www.apachelounge.com/viewtopic.php?t=8260 / https://docs.microsoft.com/fr-fr/cpp/porting/modifying-winver-and-win32-winnt?view=vs-2019
sed -i 's/_WIN32_WINNT 0x0501/_WIN32_WINNT 0x0601/g' %PATH_SRC%/apr/include/apr.hw
sed -i 's/..\\\\openssl\\\\libcrypto.lib/%PATH_INSTALL:\=\\\\%\\\\lib\\\\libcrypto.lib/g' %PATH_SRC%/apr-util/Makefile.win
cd /D %PATH_SRC%\apr-util
echo # apply apr_post.patch && git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\apr_post.patch
sed -i 's/MAKEOPT=-nologo/MAKEOPT=%NMAKE_OPTS:/=\/%/g' %PATH_SRC%/apr-util/Makefile.win

nmake %NMAKE_OPTS% ^
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
	SystemRoot=%SystemRoot% ^
	buildall install

if not exist %PATH_INSTALL%\include\arch\. mkdir %PATH_INSTALL%\include\arch
xcopy /C /F /Y %PATH_SRC%\apr\include\arch\apr_private_common.h %PATH_INSTALL%\include\arch\*
if not exist %PATH_INSTALL%\include\arch\win32\. mkdir %PATH_INSTALL%\include\arch\win32
xcopy /C /F /Y %PATH_SRC%\apr\include\arch\win32\*.h %PATH_INSTALL%\include\arch\win32\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libapr-1.dll
for %%D in (apr_crypto_openssl-1 apr_dbd_odbc-1 apr_dbd_sqlite3-1 apr_ldap-1 libaprutil-1) do (call do_php %PATH_UTILS%\sub\version.php apr-util %PATH_INSTALL%\bin\%%D.dll)
