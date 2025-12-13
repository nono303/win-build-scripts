@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

if "%2"=="svn" (
	set CMAKE_APR_UTIL=^
	-DAPU_USE_EXPAT=ON ^
	-DAPU_USE_LIBXML2=OFF ^
	-DAPU_HAVE_MYSQL=OFF
) else (
	set CMAKE_APR_UTIL=^
	-DAPU_USE_EXPAT=OFF ^
	-DAPU_USE_LIBXML2=ON ^
	-DAPU_HAVE_MYSQL=ON
)

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_MODULE_PATH=cmake ^
-DBUILD_SHARED_LIBS=ON ^
-DAPU_DSO_BUILD=OFF ^
-DAPU_HAVE_CRYPTO=ON ^
-DAPU_HAVE_ICONV=ON ^
-DAPU_HAVE_ODBC=ON ^
-DAPU_HAVE_SQLITE3=ON ^
-DAPU_HAVE_PGSQL=OFF ^
-DAPR_HAS_LDAP=ON ^
-DINSTALL_PDB=ON ^
-DAPU_BUILD_TEST=OFF ^
%CMAKE_APR_UTIL% ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

REM missing include
REM for %%X in (%PATH_SRC%\%1\include\apr_ldap_common.h) do (xcopy /C /F /Y %%X %PATH_INSTALL%\include\*)
call do_php %PATH_UTILS%\sub\version.php apr-util %PATH_INSTALL%\bin\libaprutil-1.dll
