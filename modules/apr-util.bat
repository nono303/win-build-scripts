@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

if "%2"=="svn" (
	set CMAKE_APR_UTIL=-DAPU_USE_EXPAT=ON ^
	-DAPU_USE_LIBXML2=OFF ^
	-DAPU_HAVE_MYSQL=OFF
) else (
	set CMAKE_APR_UTIL=-DAPU_USE_EXPAT=OFF ^
	-DAPU_USE_LIBXML2=ON ^
	-DAPU_HAVE_MYSQL=ON
)

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DAPU_HAVE_ODBC=ON ^
-DAPU_USE_EXPAT=ON ^
-DAPU_USE_LIBXML2=OFF ^
-DAPU_HAVE_SQLITE3=ON ^
-DAPU_HAVE_CRYPTO=ON ^
-DAPR_HAS_LDAP=ON ^
-DINSTALL_PDB=ON ^
-DAPR_BUILD_TESTAPR=OFF ^
-DTEST_STATIC_LIBS=OFF ^
-DCMAKE_MODULE_PATH=cmake ^
%CMAKE_APR_UTIL% ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for %%D in (libaprutil-1 apr_ldap-1 apr_dbd_odbc-1 apr_dbd_sqlite3-1 apr_crypto_openssl-1) do (
	call do_php %PATH_UTILS%\sub\version.php apr-util %PATH_INSTALL%\bin\%%D.dll
)
if NOT "%2"=="svn" (
	call do_php %PATH_UTILS%\sub\version.php apr-util %PATH_INSTALL%\bin\apr_dbd_mysql-1.dll
)
for %%D in (aprutil-1) do (
	move /Y %PATH_INSTALL%\lib\%%D.lib %PATH_INSTALL%\%DIR_LIB_UNUSED%
	move /Y %PATH_BUILD%\%1\CMakeFiles\%%D.dir\%%D.pdb %PATH_INSTALL%\%DIR_LIB_UNUSED%
)