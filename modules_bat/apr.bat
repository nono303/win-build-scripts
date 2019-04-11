cd /D C:\src\apr\
git clean -f -d
cd /D C:\src\apr-util\
git clean -f -d
cd /D C:\src\apr-iconv\
git clean -f -d

cd /D C:\src\apr\tools
cl gen_test_char.c
gen_test_char.exe > C:\src\apr\include\apr_escape_test_char.h
REM rm -f *.exe *.obj

REM apr_crypto_nss;apr_dbd_mysql;apr_dbd_oracle;apr_dbd_pgsql;apr_dbd_sqlite2;apr_dbd_sqlite3;apr_dbm_db;apr_dbm_gdbm;
cd /D C:\src\apr-util
MSBuild.exe aprutil.sln /nowarn:msb4011 /nowarn:C4244 /nowarn:C4098 /nowarn:C4267 /nowarn:C4311 /nowarn:C4018 /nowarn:C4133 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:apr;apr_crypto_openssl;apr_dbd_odbc;apr_ldap;aprapp;apriconv;aprutil;libapr;libaprapp;libapriconv;libapriconv_ccs_modules;libapriconv_ces_modules;libaprutil;preaprapp;preapriconv;preaprutil;prelibaprapp /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%ARCH%"

cd /D C:\httpd-sdk\modules_bat

move /Y C:\src\apr\%ARCH%\Release\libapr-1.dll c:\httpd-sdk\install\bin\libapr-1.dll
move /Y C:\src\apr\%ARCH%\Release\libapr-1.pdb c:\httpd-sdk\install\bin\libapr-1.pdb
move /Y C:\src\apr\%ARCH%\LibR\apr-1.lib c:\httpd-sdk\install\lib\apr-1.lib
move /Y C:\src\apr\%ARCH%\LibR\aprapp-1.lib c:\httpd-sdk\install\lib\aprapp-1.lib
move /Y C:\src\apr\%ARCH%\Release\libapr-1.lib c:\httpd-sdk\install\lib\libapr-1.lib
move /Y C:\src\apr\%ARCH%\Release\libaprapp-1.lib c:\httpd-sdk\install\lib\libaprapp-1.lib

move /Y C:\src\apr-iconv\%ARCH%\Release\libapriconv-1.dll c:\httpd-sdk\install\bin\libapriconv-1.dll
move /Y C:\src\apr-iconv\%ARCH%\Release\libapriconv-1.pdb c:\httpd-sdk\install\bin\libapriconv-1.pdb
move /Y C:\src\apr-iconv\%ARCH%\Release\libapriconv-1.lib c:\httpd-sdk\install\lib\libapriconv-1.lib
move /Y C:\src\apr-iconv\%ARCH%\LibR\apriconv-1.lib c:\httpd-sdk\install\lib\apriconv-1.lib

move /Y C:\src\apr-util\crypto\%ARCH%\Release\apr_crypto_openssl-1.dll c:\httpd-sdk\install\bin\apr_crypto_openssl-1.dll
move /Y C:\src\apr-util\%ARCH%\Release\libaprutil-1.dll c:\httpd-sdk\install\bin\libaprutil-1.dll
move /Y C:\src\apr-util\ldap\%ARCH%\Release\apr_ldap-1.dll c:\httpd-sdk\install\bin\apr_ldap-1.dll
move /Y C:\src\apr-util\dbd\%ARCH%\Release\apr_dbd_odbc-1.dll c:\httpd-sdk\install\bin\apr_dbd_odbc-1.dll
move /Y C:\src\apr-util\crypto\%ARCH%\Release\apr_crypto_openssl-1.pdb c:\httpd-sdk\install\bin\apr_crypto_openssl-1.pdb
move /Y C:\src\apr-util\%ARCH%\Release\libaprutil-1.pdb c:\httpd-sdk\install\bin\libaprutil-1.pdb
move /Y C:\src\apr-util\ldap\%ARCH%\Release\apr_ldap-1.pdb c:\httpd-sdk\install\bin\apr_ldap-1.pdb
move /Y C:\src\apr-util\dbd\%ARCH%\Release\apr_dbd_odbc-1.pdb c:\httpd-sdk\install\bin\apr_dbd_odbc-1.pdb
move /Y C:\src\apr-util\%ARCH%\LibR\aprutil-1.lib c:\httpd-sdk\install\lib\aprutil-1.lib
move /Y C:\src\apr-util\%ARCH%\Release\libaprutil-1.lib c:\httpd-sdk\install\lib\libaprutil-1.lib
move /Y C:\src\apr-util\ldap\%ARCH%\Release\apr_ldap-1.lib c:\httpd-sdk\install\lib\apr_ldap-1.lib
move /Y C:\src\apr-util\dbd\%ARCH%\Release\apr_dbd_odbc-1.lib c:\httpd-sdk\install\lib\apr_dbd_odbc-1.lib

copy /Y C:\src\apr\include\apr.h C:\httpd-sdk\install\include\apr.h
copy /Y C:\src\apr\include\apr_allocator.h C:\httpd-sdk\install\include\apr_allocator.h
copy /Y C:\src\apr\include\apr_atomic.h C:\httpd-sdk\install\include\apr_atomic.h
copy /Y C:\src\apr\include\apr_cstr.h C:\httpd-sdk\install\include\apr_cstr.h
copy /Y C:\src\apr\include\apr_dso.h C:\httpd-sdk\install\include\apr_dso.h
copy /Y C:\src\apr\include\apr_env.h C:\httpd-sdk\install\include\apr_env.h
copy /Y C:\src\apr\include\apr_errno.h C:\httpd-sdk\install\include\apr_errno.h
copy /Y C:\src\apr\include\apr_escape.h C:\httpd-sdk\install\include\apr_escape.h
copy /Y C:\src\apr\include\apr_escape_test_char.h C:\httpd-sdk\install\include\apr_escape_test_char.h
copy /Y C:\src\apr\include\apr_file_info.h C:\httpd-sdk\install\include\apr_file_info.h
copy /Y C:\src\apr\include\apr_file_io.h C:\httpd-sdk\install\include\apr_file_io.h
copy /Y C:\src\apr\include\apr_fnmatch.h C:\httpd-sdk\install\include\apr_fnmatch.h
copy /Y C:\src\apr\include\apr_general.h C:\httpd-sdk\install\include\apr_general.h
copy /Y C:\src\apr\include\apr_getopt.h C:\httpd-sdk\install\include\apr_getopt.h
copy /Y C:\src\apr\include\apr_global_mutex.h C:\httpd-sdk\install\include\apr_global_mutex.h
copy /Y C:\src\apr\include\apr_hash.h C:\httpd-sdk\install\include\apr_hash.h
copy /Y C:\src\apr\include\apr_inherit.h C:\httpd-sdk\install\include\apr_inherit.h
copy /Y C:\src\apr\include\apr_lib.h C:\httpd-sdk\install\include\apr_lib.h
copy /Y C:\src\apr\include\apr_mmap.h C:\httpd-sdk\install\include\apr_mmap.h
copy /Y C:\src\apr\include\apr_network_io.h C:\httpd-sdk\install\include\apr_network_io.h
copy /Y C:\src\apr\include\apr_perms_set.h C:\httpd-sdk\install\include\apr_perms_set.h
copy /Y C:\src\apr\include\apr_poll.h C:\httpd-sdk\install\include\apr_poll.h
copy /Y C:\src\apr\include\apr_pools.h C:\httpd-sdk\install\include\apr_pools.h
copy /Y C:\src\apr\include\apr_portable.h C:\httpd-sdk\install\include\apr_portable.h
copy /Y C:\src\apr\include\apr_proc_mutex.h C:\httpd-sdk\install\include\apr_proc_mutex.h
copy /Y C:\src\apr\include\apr_random.h C:\httpd-sdk\install\include\apr_random.h
copy /Y C:\src\apr\include\apr_ring.h C:\httpd-sdk\install\include\apr_ring.h
copy /Y C:\src\apr\include\apr_shm.h C:\httpd-sdk\install\include\apr_shm.h
copy /Y C:\src\apr\include\apr_signal.h C:\httpd-sdk\install\include\apr_signal.h
copy /Y C:\src\apr\include\apr_skiplist.h C:\httpd-sdk\install\include\apr_skiplist.h
copy /Y C:\src\apr\include\apr_strings.h C:\httpd-sdk\install\include\apr_strings.h
copy /Y C:\src\apr\include\apr_support.h C:\httpd-sdk\install\include\apr_support.h
copy /Y C:\src\apr\include\apr_tables.h C:\httpd-sdk\install\include\apr_tables.h
copy /Y C:\src\apr\include\apr_thread_cond.h C:\httpd-sdk\install\include\apr_thread_cond.h
copy /Y C:\src\apr\include\apr_thread_mutex.h C:\httpd-sdk\install\include\apr_thread_mutex.h
copy /Y C:\src\apr\include\apr_thread_proc.h C:\httpd-sdk\install\include\apr_thread_proc.h
copy /Y C:\src\apr\include\apr_thread_rwlock.h C:\httpd-sdk\install\include\apr_thread_rwlock.h
copy /Y C:\src\apr\include\apr_time.h C:\httpd-sdk\install\include\apr_time.h
copy /Y C:\src\apr\include\apr_user.h C:\httpd-sdk\install\include\apr_user.h
copy /Y C:\src\apr\include\apr_version.h C:\httpd-sdk\install\include\apr_version.h
copy /Y C:\src\apr\include\apr_want.h C:\httpd-sdk\install\include\apr_want.h

mkdir C:\httpd-sdk\install\include\arch\
copy /Y C:\src\apr\include\arch\apr_private_common.h C:\httpd-sdk\install\include\arch\apr_private_common.h

mkdir C:\httpd-sdk\install\include\arch\win32\
copy /Y C:\src\apr\include\arch\win32\apr_arch_proc_mutex.h C:\httpd-sdk\install\include\arch\win32\apr_arch_proc_mutex.h
copy /Y C:\src\apr\include\arch\win32\apr_arch_thread_cond.h C:\httpd-sdk\install\include\arch\win32\apr_arch_thread_cond.h
copy /Y C:\src\apr\include\arch\win32\apr_arch_thread_mutex.h C:\httpd-sdk\install\include\arch\win32\apr_arch_thread_mutex.h
copy /Y C:\src\apr\include\arch\win32\apr_arch_thread_rwlock.h C:\httpd-sdk\install\include\arch\win32\apr_arch_thread_rwlock.h
copy /Y C:\src\apr\include\arch\win32\apr_arch_threadproc.h C:\httpd-sdk\install\include\arch\win32\apr_arch_threadproc.h
copy /Y C:\src\apr\include\arch\win32\apr_arch_utf8.h C:\httpd-sdk\install\include\arch\win32\apr_arch_utf8.h
copy /Y C:\src\apr\include\arch\win32\apr_dbg_win32_handles.h C:\httpd-sdk\install\include\arch\win32\apr_dbg_win32_handles.h
copy /Y C:\src\apr\include\arch\win32\apr_private.h C:\httpd-sdk\install\include\arch\win32\apr_private.h
copy /Y C:\src\apr\include\arch\win32\apr_arch_atime.h C:\httpd-sdk\install\include\arch\win32\apr_arch_atime.h
copy /Y C:\src\apr\include\arch\win32\apr_arch_dso.h C:\httpd-sdk\install\include\arch\win32\apr_arch_dso.h
copy /Y C:\src\apr\include\arch\win32\apr_arch_file_io.h C:\httpd-sdk\install\include\arch\win32\apr_arch_file_io.h
copy /Y C:\src\apr\include\arch\win32\apr_arch_inherit.h C:\httpd-sdk\install\include\arch\win32\apr_arch_inherit.h
copy /Y C:\src\apr\include\arch\win32\apr_arch_misc.h C:\httpd-sdk\install\include\arch\win32\apr_arch_misc.h
copy /Y C:\src\apr\include\arch\win32\apr_arch_networkio.h C:\httpd-sdk\install\include\arch\win32\apr_arch_networkio.h

copy /Y C:\src\apr-iconv\include\apr_iconv.h C:\httpd-sdk\install\include\apr_iconv.h

copy /Y C:\src\apr-util\include\apr_crypto.h C:\httpd-sdk\install\include\apr_crypto.h
copy /Y C:\src\apr-util\include\apr_date.h C:\httpd-sdk\install\include\apr_date.h
copy /Y C:\src\apr-util\include\apr_dbd.h C:\httpd-sdk\install\include\apr_dbd.h
copy /Y C:\src\apr-util\include\apr_dbm.h C:\httpd-sdk\install\include\apr_dbm.h
copy /Y C:\src\apr-util\include\apr_hooks.h C:\httpd-sdk\install\include\apr_hooks.h
copy /Y C:\src\apr-util\include\apr_ldap.h C:\httpd-sdk\install\include\apr_ldap.h
copy /Y C:\src\apr-util\include\apr_ldap_init.h C:\httpd-sdk\install\include\apr_ldap_init.h
copy /Y C:\src\apr-util\include\apr_ldap_option.h C:\httpd-sdk\install\include\apr_ldap_option.h
copy /Y C:\src\apr-util\include\apr_ldap_rebind.h C:\httpd-sdk\install\include\apr_ldap_rebind.h
copy /Y C:\src\apr-util\include\apr_ldap_url.h C:\httpd-sdk\install\include\apr_ldap_url.h
copy /Y C:\src\apr-util\include\apr_md4.h C:\httpd-sdk\install\include\apr_md4.h
copy /Y C:\src\apr-util\include\apr_md5.h C:\httpd-sdk\install\include\apr_md5.h
copy /Y C:\src\apr-util\include\apr_memcache.h C:\httpd-sdk\install\include\apr_memcache.h
copy /Y C:\src\apr-util\include\apr_optional.h C:\httpd-sdk\install\include\apr_optional.h
copy /Y C:\src\apr-util\include\apr_optional_hooks.h C:\httpd-sdk\install\include\apr_optional_hooks.h
copy /Y C:\src\apr-util\include\apr_queue.h C:\httpd-sdk\install\include\apr_queue.h
copy /Y C:\src\apr-util\include\apr_redis.h C:\httpd-sdk\install\include\apr_redis.h
copy /Y C:\src\apr-util\include\apr_reslist.h C:\httpd-sdk\install\include\apr_reslist.h
copy /Y C:\src\apr-util\include\apr_rmm.h C:\httpd-sdk\install\include\apr_rmm.h
copy /Y C:\src\apr-util\include\apr_sdbm.h C:\httpd-sdk\install\include\apr_sdbm.h
copy /Y C:\src\apr-util\include\apr_sha1.h C:\httpd-sdk\install\include\apr_sha1.h
copy /Y C:\src\apr-util\include\apr_siphash.h C:\httpd-sdk\install\include\apr_siphash.h
copy /Y C:\src\apr-util\include\apr_strmatch.h C:\httpd-sdk\install\include\apr_strmatch.h
copy /Y C:\src\apr-util\include\apr_thread_pool.h C:\httpd-sdk\install\include\apr_thread_pool.h
copy /Y C:\src\apr-util\include\apr_uri.h C:\httpd-sdk\install\include\apr_uri.h
copy /Y C:\src\apr-util\include\apr_uuid.h C:\httpd-sdk\install\include\apr_uuid.h
copy /Y C:\src\apr-util\include\apr_xlate.h C:\httpd-sdk\install\include\apr_xlate.h
copy /Y C:\src\apr-util\include\apr_xml.h C:\httpd-sdk\install\include\apr_xml.h
copy /Y C:\src\apr-util\include\apu.h C:\httpd-sdk\install\include\apu.h
copy /Y C:\src\apr-util\include\apu_errno.h C:\httpd-sdk\install\include\apu_errno.h
copy /Y C:\src\apr-util\include\apu_version.h C:\httpd-sdk\install\include\apu_version.h
copy /Y C:\src\apr-util\include\apu_want.h C:\httpd-sdk\install\include\apu_want.h
copy /Y C:\src\apr-util\include\apr_anylock.h C:\httpd-sdk\install\include\apr_anylock.h
copy /Y C:\src\apr-util\include\apr_base64.h C:\httpd-sdk\install\include\apr_base64.h
copy /Y C:\src\apr-util\include\apr_buckets.h C:\httpd-sdk\install\include\apr_buckets.h