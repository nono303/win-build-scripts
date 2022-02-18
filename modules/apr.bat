@echo off
for %%X in (apr apr-iconv apr-util) do (
	call %PATH_MODULES_COMMON%\init.bat %%X
	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/apr.sh "%AVX:/=\/%" "%CYGPATH_SRC%/%%X" "%NUMBER_OF_PROCESSORS%" "%CYGPATH_SRC%"
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

	REM ICU shared sqlite3
for %%X in (mak dsp) do (sed -i 's/sqlite3.lib/sqlite3.lib %PATH_INSTALL:\=\\/%\/lib\/icuuc.lib %PATH_INSTALL:\=\\/%\/lib\/icuin.lib/g' %PATH_SRC%/apr-util/dbd/apr_dbd_sqlite3.%%X)

nmake %NMAKE_OPTS% /f Makefile.win ^
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

REM pdb are not build in same folder according to arch...
for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\apr\apr-1.pdb') do (xcopy /C /F /Y %%I %PATH_INSTALL%\lib\*)
for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\apr-util\aprutil-1.pdb') do (xcopy /C /F /Y %%I %PATH_INSTALL%\lib\*)
for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\apr-iconv\apriconv-1.pdb') do (xcopy /C /F /Y %%I %PATH_INSTALL%\lib\*)

if not exist %PATH_INSTALL%\include\arch\. mkdir %PATH_INSTALL%\include\arch
xcopy /C /F /Y %PATH_SRC%\apr\include\arch\apr_private_common.h %PATH_INSTALL%\include\arch\*
if not exist %PATH_INSTALL%\include\arch\win32\. mkdir %PATH_INSTALL%\include\arch\win32
xcopy /C /F /Y %PATH_SRC%\apr\include\arch\win32\*.h %PATH_INSTALL%\include\arch\win32\*

call %PATH_MODULES_COMMON%\init.bat apr varonly
call do_php %PATH_UTILS%\sub\version.php apr %PATH_INSTALL%\bin\libapr-1.dll

call %PATH_MODULES_COMMON%\init.bat apr-util varonly
for %%D in (libaprutil-1 apr_ldap-1 apr_dbd_odbc-1 apr_dbd_sqlite3-1 apr_crypto_openssl-1) do (
	call do_php %PATH_UTILS%\sub\version.php apr-util %PATH_INSTALL%\bin\%%D.dll
)

call %PATH_MODULES_COMMON%\init.bat apr-iconv varonly
call do_php %PATH_UTILS%\sub\version.php apr-iconv %PATH_INSTALL%\bin\libapriconv-1.dll
for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\bin\iconv\*.so /b') do (
	call do_php %PATH_UTILS%\sub\version.php apr-iconv %PATH_INSTALL%\bin\iconv\%%G
)