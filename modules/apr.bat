REM dirty build cause apr-util\Makefile.win sucks with VS2019
REM      USEMAK=1 erreur without log
REM      USEDSW=1 KO
REM      USESLN=1 KO

@echo off
for %%X in (apr apr-util apr-iconv) do (
	call %PATH_MODULES_COMMON%\init.bat %%X cmake
	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/apr.sh "%AVXSED%" "%CYGPATH_SRC%/%%X" "%NUMBER_OF_PROCESSORS%" "%CYGPATH_SRC%"
)
echo on
	REM https://www.apachelounge.com/viewtopic.php?t=8260
	REM https://docs.microsoft.com/fr-fr/cpp/porting/modifying-winver-and-win32-winnt?view=vs-2019
sed -i 's/_WIN32_WINNT 0x0501/_WIN32_WINNT 0x0601/g' %CYGPATH_SRC%/apr/include/apr.hw

	REM *** APR-ICONV en 1er pour XLATE ***

	REM si en 2eme position
REM copy /Y %PATH_INSTALL%\include\apr_escape_test_char.h %PATH_SRC%\apr\include\
cd /D %PATH_SRC%\apr\tools
cl /nologo gen_test_char.c
gen_test_char.exe > %PATH_SRC%\apr\include\apr_escape_test_char.h
REM rm -f *.exe *.obj

cd /D %PATH_SRC%\apr-iconv
nmake %NMAKE_OPTS% -f libapriconv.mak CFG="libapriconv - %archmsbuild% Release"

for %%X in (dll pdb) do (copy /y %PATH_SRC%\apr-iconv\%outmsbuild%\libapriconv-1.%%X %PATH_INSTALL%\bin\libapriconv-1.%%X)
copy /y %PATH_SRC%\apr-iconv\%outmsbuild%\libapriconv-1.lib %PATH_INSTALL%\lib\libapriconv-1.lib
for %%X in (dll pdb) do (copy /y %PATH_SRC%\apr\%outmsbuild%\libapr-1.%%X %PATH_INSTALL%\bin\libapr-1.%%X)
copy /y %PATH_SRC%\apr\%outmsbuild%\libapr-1.lib %PATH_INSTALL%\lib\libapr-1.lib
copy /Y %PATH_SRC%\apr\include\*.h %PATH_INSTALL%\include

	REM *** APR & APR-UTIL ***

cd /D %PATH_BUILD%\apr-util

	REM "dirty" XLATE ON
sed -i 's/apu_have_apr_iconv_10 0/apu_have_apr_iconv_10 1/g' %CYGPATH_SRC%/apr-util/CMakeLists.txt
sed -i 's/\${XMLLIB_LIBRARIES}/\${XMLLIB_LIBRARIES} %PROTECTEDSLASHPATH_INSTALL%\/lib\/libapriconv-1.lib/g' %CYGPATH_SRC%/apr-util/CMakeLists.txt
if not exist %PATH_SRC%\apr-util\include\apr_iconv.h mklink /h %PATH_SRC%\apr-util\include\apr_iconv.h %PATH_SRC%\apr-iconv\include\apr_iconv.h
	REM apr_dbd_odbc.c.obj : warning LNK4197: export 'apr_dbd_odbc_driver' specified multiple times; using first specification
sed -i 's/SET_PROPERTY(TARGET apr_dbd_odbc-1/# SET_PROPERTY(TARGET apr_dbd_odbc-1/g' %CYGPATH_SRC%/apr-util/CMakeLists.txt

cmake ^
-Wno-dev ^
-G "NMake Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DAPU_HAVE_CRYPTO=ON ^
-DAPU_HAVE_ODBC=ON ^
-DAPR_BUILD_TESTAPR=OFF ^
-DTEST_STATIC_LIBS=OFF ^
-DINSTALL_PDB=ON ^
%PATH_SRC%\apr-util

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/apr-util" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

if not exist %PATH_INSTALL%\include\arch\. mkdir %PATH_INSTALL%\include\arch
copy /Y %PATH_SRC%\apr\include\arch\apr_private_common.h %PATH_INSTALL%\include\arch\apr_private_common.h
if not exist %PATH_INSTALL%\include\arch\win32\. mkdir %PATH_INSTALL%\include\arch\win32
copy /Y %PATH_SRC%\apr\include\arch\win32\*.h %PATH_INSTALL%\include\arch\win32
copy /Y %PATH_SRC%\apr-iconv\include\apr_iconv.h %PATH_INSTALL%\include\apr_iconv.h
copy /Y %PATH_SRC%\apr-util\include\*.h %PATH_INSTALL%\include