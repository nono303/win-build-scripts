@echo off
for %%X in (apr apr-util apr-iconv) do (
	echo on
	call %PATH_MODULES_COMMON%\init.bat %%X cmake
	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/apr.sh "%AVXSED%" "%CYGPATH_SRC%/%%X" "%NUMBER_OF_PROCESSORS%" "%CYGPATH_SRC%"
)
echo on

	REM https://www.apachelounge.com/viewtopic.php?t=8260
	REM https://docs.microsoft.com/fr-fr/cpp/porting/modifying-winver-and-win32-winnt?view=vs-2019
sed -i 's/_WIN32_WINNT 0x0501/_WIN32_WINNT 0x0601/g' %CYGPATH_SRC%/apr/include/apr.hw

	REM *** APR & APR-UTIL ***
cd /D %PATH_BUILD%\apr-util
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DAPU_HAVE_CRYPTO=ON -DAPU_HAVE_ODBC=ON -DAPR_BUILD_TESTAPR=OFF -DTEST_STATIC_LIBS=OFF -DINSTALL_PDB=ON %PATH_SRC%\apr-util
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/apr-util" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

	REM *** APR-ICONV ***
copy /Y %PATH_INSTALL%\include\apr_escape_test_char.h %PATH_SRC%\apr\include\

cd /D %PATH_SRC%\apr-iconv
nmake %NMAKE_OPTS% -f libapriconv.mak CFG="libapriconv - %archmsbuild% Release"

copy /y %PATH_SRC%\apr-iconv\%outmsbuild%\libapriconv-1.pdb %PATH_INSTALL%\bin\libapriconv-1.pdb
copy /y %PATH_SRC%\apr-iconv\%outmsbuild%\libapriconv-1.dll %PATH_INSTALL%\bin\libapriconv-1.dll
copy /y %PATH_SRC%\apr-iconv\%outmsbuild%\libapriconv-1.lib %PATH_INSTALL%\lib\libapriconv-1.lib