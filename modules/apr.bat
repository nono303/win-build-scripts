@echo off

set LIB=%LIB%;%PATH_INSTALL%\lib;%PATH_INSTALL_OSSL%\lib
set INCLUDE=%INCLUDE%;%PATH_INSTALL%\include;%PATH_INSTALL%\include\sqlite3;%PATH_INSTALL_OSSL%\include
set SSLCRP=libcrypto
set SSLLIB=libssl

for %%X in (apr apr-iconv apr-util) do (
	call %PATH_MODULES_COMMON%\init.bat %%X
	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/apr.sh "%AVX%" "%CYGPATH_SRC%/%%X" "%NUMBER_OF_PROCESSORS%" "%CYGPATH_SRC%"
)
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/apr_once.sh "%OPENSSL_SCM%" "%CYGPATH_SRC%" "%NMAKE_OPTS:/=\\/%"

if not exist %PATH_SRC%\apr-util\xml\expat\. mklink /J %PATH_SRC%\apr-util\xml\expat %PATH_SRC%\libexpat\expat
cd /D %PATH_SRC%\apr-util

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

REM pdb & lib are not build in same folder according to ARCH...
for %%D in (apr\apr-1.pdb apr-util\aprutil-1.pdb apr-iconv\apriconv-1.pdb apr-iconv\apriconv-1.lib apr-util\crypto\apr_crypto_openssl-1.lib apr-util\dbd\apr_dbd_odbc-1.lib apr-util\dbd\apr_dbd_sqlite3-1.lib apr-util\ldap\apr_ldap-1.lib apr-iconv\libapriconv-1.lib) do (
	for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\%%D') do (xcopy /C /F /Y %%I %PATH_INSTALL%\lib\*)
)

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
for %%D in (apr-1.lib apr-1.pdb apriconv-1.lib apriconv-1.pdb aprutil-1.lib aprutil-1.pdb) do (
	move /Y %PATH_INSTALL%\lib\%%D %PATH_INSTALL%\%DIR_LIB_UNUSED%
)