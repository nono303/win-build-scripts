REM dirty build cause apr-util\Makefile.win sucks with VS2019
REM      USEMAK=1 erreur without log
REM      USEDSW=1 KO
REM      USESLN=1 KO

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

	REM *** APR-ICONV en 1er pour XLATE ***

	REM si en 2eme position
REM copy /Y %PATH_INSTALL%\include\apr_escape_test_char.h %PATH_SRC%\apr\include\
cd /D %PATH_SRC%\apr\tools
cl gen_test_char.c
gen_test_char.exe > %PATH_SRC%\apr\include\apr_escape_test_char.h
REM rm -f *.exe *.obj

cd /D %PATH_SRC%\apr-iconv
nmake %NMAKE_OPTS% -f libapriconv.mak CFG="libapriconv - %archmsbuild% Release"

copy /y %PATH_SRC%\apr-iconv\%outmsbuild%\libapriconv-1.pdb %PATH_INSTALL%\bin\libapriconv-1.pdb
copy /y %PATH_SRC%\apr-iconv\%outmsbuild%\libapriconv-1.dll %PATH_INSTALL%\bin\libapriconv-1.dll
copy /y %PATH_SRC%\apr-iconv\%outmsbuild%\libapriconv-1.lib %PATH_INSTALL%\lib\libapriconv-1.lib
copy /y %PATH_SRC%\apr\%outmsbuild%\libapr-1.pdb %PATH_INSTALL%\bin\libapr-1.pdb
copy /y %PATH_SRC%\apr\%outmsbuild%\libapr-1.dll %PATH_INSTALL%\bin\libapr-1.dll
copy /y %PATH_SRC%\apr\%outmsbuild%\libapr-1.lib %PATH_INSTALL%\lib\libapr-1.lib

	REM *** APR & APR-UTIL ***

cd /D %PATH_BUILD%\apr-util

	REM "dirty" XLATE ON
sed -i 's/apu_have_apr_iconv_10 0/apu_have_apr_iconv_10 1/g' %CYGPATH_SRC%/apr-util/CMakeLists.txt
sed -i 's/\${XMLLIB_LIBRARIES}/\${XMLLIB_LIBRARIES} c:\/httpd-sdk\/install\/lib\/libapriconv-1.lib/g' %CYGPATH_SRC%/apr-util/CMakeLists.txt
mklink /h C:\src\apr-util\include\apr_iconv.h C:\src\apr-iconv\include\apr_iconv.h

cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DAPU_HAVE_CRYPTO=ON -DAPU_HAVE_ODBC=ON -DAPR_BUILD_TESTAPR=OFF -DTEST_STATIC_LIBS=OFF -DINSTALL_PDB=ON %PATH_SRC%\apr-util
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/apr-util" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

	REM *** include ***

mkdir %PATH_INSTALL%\include\arch\
copy /Y %PATH_SRC%\apr\include\arch\apr_private_common.h %PATH_INSTALL%\include\arch\apr_private_common.h

mkdir %PATH_INSTALL%\include\arch\win32\
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_proc_mutex.h %PATH_INSTALL%\include\arch\win32\apr_arch_proc_mutex.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_thread_cond.h %PATH_INSTALL%\include\arch\win32\apr_arch_thread_cond.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_thread_mutex.h %PATH_INSTALL%\include\arch\win32\apr_arch_thread_mutex.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_thread_rwlock.h %PATH_INSTALL%\include\arch\win32\apr_arch_thread_rwlock.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_threadproc.h %PATH_INSTALL%\include\arch\win32\apr_arch_threadproc.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_utf8.h %PATH_INSTALL%\include\arch\win32\apr_arch_utf8.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_dbg_win32_handles.h %PATH_INSTALL%\include\arch\win32\apr_dbg_win32_handles.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_private.h %PATH_INSTALL%\include\arch\win32\apr_private.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_atime.h %PATH_INSTALL%\include\arch\win32\apr_arch_atime.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_dso.h %PATH_INSTALL%\include\arch\win32\apr_arch_dso.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_file_io.h %PATH_INSTALL%\include\arch\win32\apr_arch_file_io.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_inherit.h %PATH_INSTALL%\include\arch\win32\apr_arch_inherit.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_misc.h %PATH_INSTALL%\include\arch\win32\apr_arch_misc.h
copy /Y %PATH_SRC%\apr\include\arch\win32\apr_arch_networkio.h %PATH_INSTALL%\include\arch\win32\apr_arch_networkio.h

copy /Y %PATH_SRC%\apr-iconv\include\apr_iconv.h %PATH_INSTALL%\include\apr_iconv.h

copy /Y %PATH_SRC%\apr-util\include\apr_crypto.h %PATH_INSTALL%\include\apr_crypto.h
copy /Y %PATH_SRC%\apr-util\include\apr_date.h %PATH_INSTALL%\include\apr_date.h
copy /Y %PATH_SRC%\apr-util\include\apr_dbd.h %PATH_INSTALL%\include\apr_dbd.h
copy /Y %PATH_SRC%\apr-util\include\apr_dbm.h %PATH_INSTALL%\include\apr_dbm.h
copy /Y %PATH_SRC%\apr-util\include\apr_hooks.h %PATH_INSTALL%\include\apr_hooks.h
copy /Y %PATH_SRC%\apr-util\include\apr_ldap.h %PATH_INSTALL%\include\apr_ldap.h
copy /Y %PATH_SRC%\apr-util\include\apr_ldap_init.h %PATH_INSTALL%\include\apr_ldap_init.h
copy /Y %PATH_SRC%\apr-util\include\apr_ldap_option.h %PATH_INSTALL%\include\apr_ldap_option.h
copy /Y %PATH_SRC%\apr-util\include\apr_ldap_rebind.h %PATH_INSTALL%\include\apr_ldap_rebind.h
copy /Y %PATH_SRC%\apr-util\include\apr_ldap_url.h %PATH_INSTALL%\include\apr_ldap_url.h
copy /Y %PATH_SRC%\apr-util\include\apr_md4.h %PATH_INSTALL%\include\apr_md4.h
copy /Y %PATH_SRC%\apr-util\include\apr_md5.h %PATH_INSTALL%\include\apr_md5.h
copy /Y %PATH_SRC%\apr-util\include\apr_memcache.h %PATH_INSTALL%\include\apr_memcache.h
copy /Y %PATH_SRC%\apr-util\include\apr_optional.h %PATH_INSTALL%\include\apr_optional.h
copy /Y %PATH_SRC%\apr-util\include\apr_optional_hooks.h %PATH_INSTALL%\include\apr_optional_hooks.h
copy /Y %PATH_SRC%\apr-util\include\apr_queue.h %PATH_INSTALL%\include\apr_queue.h
copy /Y %PATH_SRC%\apr-util\include\apr_redis.h %PATH_INSTALL%\include\apr_redis.h
copy /Y %PATH_SRC%\apr-util\include\apr_reslist.h %PATH_INSTALL%\include\apr_reslist.h
copy /Y %PATH_SRC%\apr-util\include\apr_rmm.h %PATH_INSTALL%\include\apr_rmm.h
copy /Y %PATH_SRC%\apr-util\include\apr_sdbm.h %PATH_INSTALL%\include\apr_sdbm.h
copy /Y %PATH_SRC%\apr-util\include\apr_sha1.h %PATH_INSTALL%\include\apr_sha1.h
copy /Y %PATH_SRC%\apr-util\include\apr_siphash.h %PATH_INSTALL%\include\apr_siphash.h
copy /Y %PATH_SRC%\apr-util\include\apr_strmatch.h %PATH_INSTALL%\include\apr_strmatch.h
copy /Y %PATH_SRC%\apr-util\include\apr_thread_pool.h %PATH_INSTALL%\include\apr_thread_pool.h
copy /Y %PATH_SRC%\apr-util\include\apr_uri.h %PATH_INSTALL%\include\apr_uri.h
copy /Y %PATH_SRC%\apr-util\include\apr_uuid.h %PATH_INSTALL%\include\apr_uuid.h
copy /Y %PATH_SRC%\apr-util\include\apr_xlate.h %PATH_INSTALL%\include\apr_xlate.h
copy /Y %PATH_SRC%\apr-util\include\apr_xml.h %PATH_INSTALL%\include\apr_xml.h
copy /Y %PATH_SRC%\apr-util\include\apu.h %PATH_INSTALL%\include\apu.h
copy /Y %PATH_SRC%\apr-util\include\apu_errno.h %PATH_INSTALL%\include\apu_errno.h
copy /Y %PATH_SRC%\apr-util\include\apu_version.h %PATH_INSTALL%\include\apu_version.h
copy /Y %PATH_SRC%\apr-util\include\apu_want.h %PATH_INSTALL%\include\apu_want.h
copy /Y %PATH_SRC%\apr-util\include\apr_anylock.h %PATH_INSTALL%\include\apr_anylock.h
copy /Y %PATH_SRC%\apr-util\include\apr_base64.h %PATH_INSTALL%\include\apr_base64.h
copy /Y %PATH_SRC%\apr-util\include\apr_buckets.h %PATH_INSTALL%\include\apr_buckets.h