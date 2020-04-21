for %%X in (apr apr-util apr-iconv) do (
	call %PATH_MODULES_COMMON%\init.bat %%X
	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/%1.sh "%AVXSED%" "%CYGPATH_SRC%/%%X" "%NUMBER_OF_PROCESSORS%" "%CYGPATH_SRC%"
)

if not exist %PATH_SRC%\apr-util\xml\expat\. mkdir %PATH_SRC%\apr-util\xml\expat
if not exist %PATH_SRC%\apr-util\xml\expat\lib\. mklink /j %PATH_SRC%\apr-util\xml\expat\lib C:\src\libexpat\expat\lib

REM cd /D %PATH_SRC%\apr\tools
REM cl gen_test_char.c
REM gen_test_char.exe > %PATH_SRC%\apr\include\apr_escape_test_char.h
	REM rm -f *.exe *.obj

cd /D %PATH_SRC%\apr-util
	REM DBD_LIST="sqlite3 pgsql oracle mysql freetds" CRYPTO_LIST="openssl"
	REM LIB=C:/httpd-sdk/install/lib/ INCLUDE=C:/httpd-sdk/install/include/
	REM PREFIX=C:\httpd-sdk\install
	REM install clean
nmake -a -f Makefile.win USEMAK=1 buildall clean ARCH="x64 Release" XML_PARSER="libexpat" PREFIX=C:\httpd-sdk\install APR_PATH=%PATH_SRC%\apr API_PATH=%PATH_SRC%\apr-iconv APU_PATH=%PATH_SRC%\apr-util

exit /B

REM apr_crypto_nss;apr_dbd_mysql;apr_dbd_oracle;apr_dbd_pgsql;apr_dbd_sqlite2;apr_dbd_sqlite3;apr_dbm_db;apr_dbm_gdbm;
cd /D %PATH_SRC%\apr-util
MSBuild.exe aprutil.sln /nowarn:msb4011 /nowarn:C4244 /nowarn:C4098 /nowarn:C4267 /nowarn:C4311 /nowarn:C4018 /nowarn:C4133 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:apr;apr_crypto_openssl;apr_dbd_odbc;apr_ldap;aprapp;apriconv;aprutil;libapr;libaprapp;libapriconv;libapriconv_ccs_modules;libapriconv_ces_modules;libaprutil;preaprapp;preapriconv;preaprutil;prelibaprapp /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%ARCH%"

cd /D %PATH_MODULES%

move /Y %PATH_SRC%\apr\%ARCH%\Release\libapr-1.dll %PATH_INSTALL%\bin\libapr-1.dll
move /Y %PATH_SRC%\apr\%ARCH%\Release\libapr-1.pdb %PATH_INSTALL%\bin\libapr-1.pdb
move /Y %PATH_SRC%\apr\%ARCH%\LibR\apr-1.lib %PATH_INSTALL%\lib\apr-1.lib
move /Y %PATH_SRC%\apr\%ARCH%\LibR\aprapp-1.lib %PATH_INSTALL%\lib\aprapp-1.lib
move /Y %PATH_SRC%\apr\%ARCH%\Release\libapr-1.lib %PATH_INSTALL%\lib\libapr-1.lib
move /Y %PATH_SRC%\apr\%ARCH%\Release\libaprapp-1.lib %PATH_INSTALL%\lib\libaprapp-1.lib

move /Y %PATH_SRC%\apr-iconv\%ARCH%\Release\libapriconv-1.dll %PATH_INSTALL%\bin\libapriconv-1.dll
move /Y %PATH_SRC%\apr-iconv\%ARCH%\Release\libapriconv-1.pdb %PATH_INSTALL%\bin\libapriconv-1.pdb
move /Y %PATH_SRC%\apr-iconv\%ARCH%\Release\libapriconv-1.lib %PATH_INSTALL%\lib\libapriconv-1.lib
move /Y %PATH_SRC%\apr-iconv\%ARCH%\LibR\apriconv-1.lib %PATH_INSTALL%\lib\apriconv-1.lib

move /Y %PATH_SRC%\apr-util\crypto\%ARCH%\Release\apr_crypto_openssl-1.dll %PATH_INSTALL%\bin\apr_crypto_openssl-1.dll
move /Y %PATH_SRC%\apr-util\%ARCH%\Release\libaprutil-1.dll %PATH_INSTALL%\bin\libaprutil-1.dll
move /Y %PATH_SRC%\apr-util\ldap\%ARCH%\Release\apr_ldap-1.dll %PATH_INSTALL%\bin\apr_ldap-1.dll
move /Y %PATH_SRC%\apr-util\dbd\%ARCH%\Release\apr_dbd_odbc-1.dll %PATH_INSTALL%\bin\apr_dbd_odbc-1.dll
move /Y %PATH_SRC%\apr-util\crypto\%ARCH%\Release\apr_crypto_openssl-1.pdb %PATH_INSTALL%\bin\apr_crypto_openssl-1.pdb
move /Y %PATH_SRC%\apr-util\%ARCH%\Release\libaprutil-1.pdb %PATH_INSTALL%\bin\libaprutil-1.pdb
move /Y %PATH_SRC%\apr-util\ldap\%ARCH%\Release\apr_ldap-1.pdb %PATH_INSTALL%\bin\apr_ldap-1.pdb
move /Y %PATH_SRC%\apr-util\dbd\%ARCH%\Release\apr_dbd_odbc-1.pdb %PATH_INSTALL%\bin\apr_dbd_odbc-1.pdb
move /Y %PATH_SRC%\apr-util\%ARCH%\LibR\aprutil-1.lib %PATH_INSTALL%\lib\aprutil-1.lib
move /Y %PATH_SRC%\apr-util\%ARCH%\Release\libaprutil-1.lib %PATH_INSTALL%\lib\libaprutil-1.lib
move /Y %PATH_SRC%\apr-util\ldap\%ARCH%\Release\apr_ldap-1.lib %PATH_INSTALL%\lib\apr_ldap-1.lib
move /Y %PATH_SRC%\apr-util\dbd\%ARCH%\Release\apr_dbd_odbc-1.lib %PATH_INSTALL%\lib\apr_dbd_odbc-1.lib

copy /Y %PATH_SRC%\apr\include\apr.h %PATH_INSTALL%\include\apr.h
copy /Y %PATH_SRC%\apr\include\apr_allocator.h %PATH_INSTALL%\include\apr_allocator.h
copy /Y %PATH_SRC%\apr\include\apr_atomic.h %PATH_INSTALL%\include\apr_atomic.h
copy /Y %PATH_SRC%\apr\include\apr_cstr.h %PATH_INSTALL%\include\apr_cstr.h
copy /Y %PATH_SRC%\apr\include\apr_dso.h %PATH_INSTALL%\include\apr_dso.h
copy /Y %PATH_SRC%\apr\include\apr_env.h %PATH_INSTALL%\include\apr_env.h
copy /Y %PATH_SRC%\apr\include\apr_errno.h %PATH_INSTALL%\include\apr_errno.h
copy /Y %PATH_SRC%\apr\include\apr_escape.h %PATH_INSTALL%\include\apr_escape.h
copy /Y %PATH_SRC%\apr\include\apr_escape_test_char.h %PATH_INSTALL%\include\apr_escape_test_char.h
copy /Y %PATH_SRC%\apr\include\apr_file_info.h %PATH_INSTALL%\include\apr_file_info.h
copy /Y %PATH_SRC%\apr\include\apr_file_io.h %PATH_INSTALL%\include\apr_file_io.h
copy /Y %PATH_SRC%\apr\include\apr_fnmatch.h %PATH_INSTALL%\include\apr_fnmatch.h
copy /Y %PATH_SRC%\apr\include\apr_general.h %PATH_INSTALL%\include\apr_general.h
copy /Y %PATH_SRC%\apr\include\apr_getopt.h %PATH_INSTALL%\include\apr_getopt.h
copy /Y %PATH_SRC%\apr\include\apr_global_mutex.h %PATH_INSTALL%\include\apr_global_mutex.h
copy /Y %PATH_SRC%\apr\include\apr_hash.h %PATH_INSTALL%\include\apr_hash.h
copy /Y %PATH_SRC%\apr\include\apr_inherit.h %PATH_INSTALL%\include\apr_inherit.h
copy /Y %PATH_SRC%\apr\include\apr_lib.h %PATH_INSTALL%\include\apr_lib.h
copy /Y %PATH_SRC%\apr\include\apr_mmap.h %PATH_INSTALL%\include\apr_mmap.h
copy /Y %PATH_SRC%\apr\include\apr_network_io.h %PATH_INSTALL%\include\apr_network_io.h
copy /Y %PATH_SRC%\apr\include\apr_perms_set.h %PATH_INSTALL%\include\apr_perms_set.h
copy /Y %PATH_SRC%\apr\include\apr_poll.h %PATH_INSTALL%\include\apr_poll.h
copy /Y %PATH_SRC%\apr\include\apr_pools.h %PATH_INSTALL%\include\apr_pools.h
copy /Y %PATH_SRC%\apr\include\apr_portable.h %PATH_INSTALL%\include\apr_portable.h
copy /Y %PATH_SRC%\apr\include\apr_proc_mutex.h %PATH_INSTALL%\include\apr_proc_mutex.h
copy /Y %PATH_SRC%\apr\include\apr_random.h %PATH_INSTALL%\include\apr_random.h
copy /Y %PATH_SRC%\apr\include\apr_ring.h %PATH_INSTALL%\include\apr_ring.h
copy /Y %PATH_SRC%\apr\include\apr_shm.h %PATH_INSTALL%\include\apr_shm.h
copy /Y %PATH_SRC%\apr\include\apr_signal.h %PATH_INSTALL%\include\apr_signal.h
copy /Y %PATH_SRC%\apr\include\apr_skiplist.h %PATH_INSTALL%\include\apr_skiplist.h
copy /Y %PATH_SRC%\apr\include\apr_strings.h %PATH_INSTALL%\include\apr_strings.h
copy /Y %PATH_SRC%\apr\include\apr_support.h %PATH_INSTALL%\include\apr_support.h
copy /Y %PATH_SRC%\apr\include\apr_tables.h %PATH_INSTALL%\include\apr_tables.h
copy /Y %PATH_SRC%\apr\include\apr_thread_cond.h %PATH_INSTALL%\include\apr_thread_cond.h
copy /Y %PATH_SRC%\apr\include\apr_thread_mutex.h %PATH_INSTALL%\include\apr_thread_mutex.h
copy /Y %PATH_SRC%\apr\include\apr_thread_proc.h %PATH_INSTALL%\include\apr_thread_proc.h
copy /Y %PATH_SRC%\apr\include\apr_thread_rwlock.h %PATH_INSTALL%\include\apr_thread_rwlock.h
copy /Y %PATH_SRC%\apr\include\apr_time.h %PATH_INSTALL%\include\apr_time.h
copy /Y %PATH_SRC%\apr\include\apr_user.h %PATH_INSTALL%\include\apr_user.h
copy /Y %PATH_SRC%\apr\include\apr_version.h %PATH_INSTALL%\include\apr_version.h
copy /Y %PATH_SRC%\apr\include\apr_want.h %PATH_INSTALL%\include\apr_want.h

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