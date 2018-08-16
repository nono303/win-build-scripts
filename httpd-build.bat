cd /D C:\httpd-sdk\build
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
cd /D C:\httpd-sdk\install
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

cd /D C:\httpd-sdk\src\jemalloc-cmake\
sh -c "CC=cl ./autogen.sh"
C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe msvc\jemalloc_vc2015.sln /m:8 /t:Clean,jemalloc /p:Configuration=Release /p:DebugSymbols=false /p:DebugType=None /p:Plateform="%ARCH%"
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.dll c:\httpd-sdk\install\bin\jemalloc.dll
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.exp c:\httpd-sdk\install\lib\jemalloc.exp
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.iobj
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.ipdb
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.lib c:\httpd-sdk\install\lib\jemalloc.lib
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.pdb c:\httpd-sdk\install\bin\jemalloc.pdb
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\test_threads.exe c:\httpd-sdk\install\bin\test_threads.exe
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\test_threads.iobj
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\test_threads.ipdb
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\test_threads.pdb c:\httpd-sdk\install\bin\test_threads.pdb
mkdir c:\httpd-sdk\install\include\jemalloc\
copy /Y C:\httpd-sdk\src\jemalloc-cmake\include\jemalloc\jemalloc.h c:\httpd-sdk\install\include\jemalloc\jemalloc.h

cd ..
rmdir /S /Q C:\httpd-sdk\build\zlib
mkdir C:\httpd-sdk\build\zlib
cd /D C:\httpd-sdk\build\zlib
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON ..\..\src\zlib
nmake /B /NOLOGO clean install
move /Y C:\src\zlib\zconf.h.included C:\src\zlib\zconf.h
copy /Y C:\httpd-sdk\build\zlib\zlib.pdb c:\httpd-sdk\install\bin\zlib1.pdb

cd ..
rmdir /S /Q C:\httpd-sdk\build\brotli
mkdir C:\httpd-sdk\build\brotli
cd /D C:\httpd-sdk\build\brotli
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON ..\..\src\brotli
nmake /B /NOLOGO clean install
copy /Y C:\httpd-sdk\build\brotli\brotlicommon.pdb c:\httpd-sdk\install\bin\brotlicommon.pdb
copy /Y C:\httpd-sdk\build\brotli\brotli.pdb c:\httpd-sdk\install\bin\brotli.pdb 
copy /Y C:\httpd-sdk\build\brotli\brotlidec.pdb c:\httpd-sdk\install\bin\brotlidec.pdb
copy /Y C:\httpd-sdk\build\brotli\brotlienc.pdb c:\httpd-sdk\install\bin\brotlienc.pdb

cd ..
rmdir /S /Q C:\httpd-sdk\build\jansson
mkdir C:\httpd-sdk\build\jansson
cd /D C:\httpd-sdk\build\jansson
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DUSE_URANDOM=OFF -DJANSSON_EXAMPLES=OFF -DJANSSON_BUILD_DOCS=OFF -DJANSSON_BUILD_SHARED_LIBS=ON ..\..\src\jansson
nmake /B /NOLOGO clean install
copy /Y C:\httpd-sdk\build\jansson\bin\jansson.pdb C:\httpd-sdk\install\bin\jansson.pdb

rmdir /S /Q C:\httpd-sdk\build\bzip2-1.0.6
mkdir C:\httpd-sdk\build\bzip2-1.0.6
cd /D c:\httpd-sdk\src\bzip2-1.0.6
nmake /f Makefile.msc clean lib bzip2
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.lib C:\httpd-sdk\build\bzip2-1.0.6
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.exe C:\httpd-sdk\build\bzip2-1.0.6
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.obj C:\httpd-sdk\build\bzip2-1.0.6
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.pdb C:\httpd-sdk\build\bzip2-1.0.6
move /Y C:\httpd-sdk\src\bzip2-1.0.6\*.idb C:\httpd-sdk\build\bzip2-1.0.6
copy /Y c:\httpd-sdk\src\bzip2-1.0.6\bzlib.h c:\httpd-sdk\install\include\bzlib.h
REM libbz2 => bzip2
copy /Y C:\httpd-sdk\build\bzip2-1.0.6\libbz2.lib c:\httpd-sdk\install\lib\bzip2.lib
copy /Y C:\httpd-sdk\build\bzip2-1.0.6\libbz2.pdb c:\httpd-sdk\install\lib\bzip2.pdb

"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\src\libiconv\MSVC15\libiconv.sln /nowarn:C4090 /nowarn:C4244 /nowarn:C4267 /nowarn:c4018 /nowarn:MSB8012 /m:8 /t:Clean,libiconv_dll /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y C:\src\libiconv\MSVC15\%archmsbuild%\bin\libiconv.dll C:\httpd-sdk\install\bin\libiconv.dll 
copy /Y C:\src\libiconv\MSVC15\%archmsbuild%\bin\libiconv.pdb C:\httpd-sdk\install\bin\libiconv.pdb 
copy /Y C:\src\libiconv\MSVC15\%archmsbuild%\lib\libiconv.lib C:\httpd-sdk\install\lib\iconv.lib 
copy /Y C:\src\libiconv\source\include\iconv.h C:\httpd-sdk\install\include\iconv.h

cd /D C:\httpd-sdk\src\libxml2\win32\
cscript configure.js compiler=nmakemsvc prefix=C:\httpd-sdk\install include=C:\httpd-sdk\install\include lib=C:\httpd-sdk\install\lib debug=no zlib=yes
nmake /NOLOGO /A /B /f Makefile.msvc clean install-libs
copy /Y C:\httpd-sdk\src\libxml2\win32\bin.msvc\libxml2.pdb C:\httpd-sdk\install\bin\libxml2.pdb
nmake /NOLOGO /A /B /f Makefile.msvc distclean

cd ..
rmdir /S /Q C:\httpd-sdk\build\pcre
mkdir C:\httpd-sdk\build\pcre
cd /D C:\httpd-sdk\build\pcre
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DPCRE_BUILD_TESTS=OFF -DPCRE_BUILD_PCRECPP=OFF -DPCRE_BUILD_PCREGREP=OFF -DPCRE_SUPPORT_PCREGREP_JIT=OFF -DPCRE_SUPPORT_UTF=ON -DPCRE_SUPPORT_UNICODE_PROPERTIES=ON -DPCRE_NEWLINE=CRLF -DINSTALL_MSVC_PDB=ON -DBZIP2_INCLUDE_DIR=C:\httpd-sdk\install\inculde ..\..\src\pcre
nmake /NOLOGO /A /B clean install

cd /D C:\httpd-sdk\src\openssl
perl Configure %perlbuild% --prefix=C:\httpd-sdk\install --openssldir=C:\httpd-sdk\install\conf --with-zlib-include=C:/httpd-sdk/install/include --with-zlib-lib=C:/httpd-sdk/install/lib/zlib.lib
nmake /B /NOLOGO clean install

cd ..
rmdir /S /Q C:\httpd-sdk\build\libevent
mkdir C:\httpd-sdk\build\libevent
cd /D C:\httpd-sdk\build\libevent
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DGIT_EXECUTABLE=c:\PROGRA~1\Git\bin\git.exe -DEVENT__DISABLE_DEBUG_MODE=ON -DEVENT__DISABLE_THREAD_SUPPORT=OFF -DEVENT__DISABLE_OPENSSL=OFF -DEVENT__DISABLE_BENCHMARK=ON -DEVENT__DISABLE_TESTS=ON -DEVENT__DISABLE_REGRESS=ON -DEVENT__DISABLE_SAMPLES=ON -DEVENT__COVERAGE=OFF ..\..\src\libevent
nmake /B /NOLOGO clean install

	REM -- OpenSSL:        TRUE (LIBS='C:/httpd-sdk/install/lib/libssl.lib;C:/httpd-sdk/install/lib/libcrypto.lib')
	REM -- Libxml2:        TRUE (LIBS='C:/httpd-sdk/install/lib/libxml2.lib')
	REM -- Libev:          FALSE (LIBS='')
	REM -- Libc-ares:      FALSE (LIBS='')
	REM -- Libevent(SSL):  TRUE (LIBS='C:/httpd-sdk/install/lib/event.lib;C:/httpd-sdk/install/lib/event_openssl.lib')
	REM -- Spdylay:        FALSE (LIBS='')
	REM -- Jansson:        TRUE (LIBS='C:/httpd-sdk/install/lib/jansson.lib')
	REM -- Jemalloc:       TRUE (LIBS='C:/httpd-sdk/install/lib/jemalloc.lib')
	REM -- Zlib:           TRUE (LIBS='C:/httpd-sdk/install/lib/zlib.lib')
cd ..
rmdir /S /Q C:\httpd-sdk\build\nghttp2
mkdir C:\httpd-sdk\build\nghttp2
cd /D C:\httpd-sdk\build\nghttp2
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DENABLE_LIB_ONLY=ON -DLIBEVENT_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DJEMALLOC_LIBRARY=C:/httpd-sdk/install/lib/jemalloc.lib -DLIBEVENT_OPENSSL_LIBRARY=C:/httpd-sdk/install/lib/event_openssl.lib -DJEMALLOC_INCLUDE_DIR=C:/httpd-sdk/install/include -DENABLE_WERROR=OFF -DENABLE_DEBUG=OFF -DENABLE_THREADS=ON -DENABLE_ASIO_LIB=OFF -DENABLE_FAILMALLOC=OFF -DWITH_LIBXML2=ON -DWITH_JEMALLOC=ON -DWITH_SPDYLAY=OFF -DWITH_MRUBY=OFF -DWITH_NEVERBLEED=OFF -DCYTHON_EXECUTABLE=C:\python27\Scripts ..\..\src\nghttp2
nmake /B /NOLOGO clean install
move /Y C:\httpd-sdk\install\lib\nghttp2.dll C:\httpd-sdk\install\bin\nghttp2.dll
copy /Y C:\httpd-sdk\build\nghttp2\lib\nghttp2.pdb C:\httpd-sdk\install\bin\nghttp2.pdb

cd ..
rmdir /S /Q C:\httpd-sdk\build\curl
mkdir C:\httpd-sdk\build\curl
cd /D C:\httpd-sdk\build\curl
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DCMAKE_USE_WINSSL=ON -DBUILD_SHARED_LIBS=ON -DENABLE_IPV6=OFF -DCMAKE_USE_LIBSSH2=OFF -DENABLE_UNIX_SOCKETS=OFF -DBUILD_CURL_EXE=OFF ..\..\src\curl
nmake /B /NOLOGO clean install
copy /Y C:\httpd-sdk\build\curl\lib\libcurl.pdb C:\httpd-sdk\install\bin\libcurl.pdb
rm -f C:\httpd-sdk\install\bin\curl-config

cd ..
rmdir /S /Q C:\httpd-sdk\build\libexpat
mkdir C:\httpd-sdk\build\libexpat
cd /D C:\httpd-sdk\build\libexpat
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_doc=OFF -DBUILD_tests=OFF -DBUILD_examples=OFF -DBUILD_tools=OFF -DEXTRA_COMPILE_FLAGS="/Zi" ..\..\src\libexpat\expat
nmake /B /NOLOGO clean install
copy /Y C:\httpd-sdk\build\libexpat\expat.pdb C:\httpd-sdk\install\bin\expat.pdb

rmdir /S /Q C:\httpd-sdk\src\libmaxminddb\projects\VS12\%ARCH%
cd /D C:\httpd-sdk\src\libmaxminddb\projects\VS12
"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" libmaxminddb.sln /m:8 /t:Clean,libmaxminddb /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y C:\httpd-sdk\src\libmaxminddb\projects\VS12\%outmsbuild%\libmaxminddb.lib C:\httpd-sdk\install\lib\libmaxminddb.lib
copy /Y C:\httpd-sdk\src\libmaxminddb\include\maxminddb.h C:\httpd-sdk\install\include\maxminddb.h 
copy /Y C:\httpd-sdk\src\libmaxminddb\include\maxminddb_config.h C:\httpd-sdk\install\include\maxminddb_config.h

rmdir /S /Q C:\src\apr-util\crypto\%ARCH%
rmdir /S /Q C:\src\apr-util\dbd\%ARCH%
rmdir /S /Q C:\src\apr-util\dbm\%ARCH%
rmdir /S /Q C:\src\apr-util\ldap\%ARCH%
rmdir /S /Q C:\src\apr-util\%ARCH%
rmdir /S /Q C:\src\apr-iconv\build\preapriconv\
rmdir /S /Q C:\src\apr-iconv\ccs\libapriconv_ccs_modules\
rmdir /S /Q C:\src\apr-iconv\%ARCH%
rmdir /S /Q C:\src\apr\build\%ARCH%
rmdir /S /Q C:\src\apr\%ARCH%
rm -f C:\src\apr\build\preaprapp.log

cd /D C:\httpd-sdk\src\apr\tools
cl gen_test_char.c
gen_test_char.exe > C:\src\apr\include\apr_escape_test_char.h
rm -f *.exe *.obj

REM apr_crypto_nss;apr_dbd_mysql;apr_dbd_oracle;apr_dbd_pgsql;apr_dbd_sqlite2;apr_dbd_sqlite3;apr_dbm_db;apr_dbm_gdbm;
cd /D C:\src\apr-util
"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" aprutil.sln /nowarn:msb4011 /nowarn:C4244 /nowarn:C4098 /nowarn:C4267 /nowarn:C4311 /m:8 /t:apr;apr_crypto_openssl;apr_dbd_odbc;apr_ldap;aprapp;apriconv;aprutil;libapr;libaprapp;libapriconv;libapriconv_ccs_modules;libapriconv_ces_modules;libaprutil;preaprapp;preapriconv;preaprutil;prelibaprapp /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%ARCH%"

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

cd ..
rmdir /S /Q C:\httpd-sdk\build\lua
mkdir C:\httpd-sdk\build\lua
cd /D C:\httpd-sdk\build\lua
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DLUA_BUILD_WLUA=OFF -DLUA_BUILD_AS_DLL=ON ..\..\src\lua
nmake /B /NOLOGO clean install
copy /Y C:\httpd-sdk\build\lua\lua.pdb C:\httpd-sdk\install\bin\lua.pdb

cd ..
rmdir /S /Q C:\httpd-sdk\build\httpd
mkdir C:\httpd-sdk\build\httpd
cd /D C:\httpd-sdk\build\httpd
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DINSTALL_PDB=ON -DENABLE_MODULES=i -DINSTALL_MANUAL=OFF -DLIBXML2_ICONV_INCLUDE_DIR=C:/httpd-sdk/install/include -DLIBXML2_ICONV_LIBRARIES=C:/httpd-sdk/install/lib/iconv.lib -DZLIB_LIBRARIES=C:/httpd-sdk/install/lib/zlib.lib -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DMAXMIND_LIBRARIES=C:/httpd-sdk/install/lib/libmaxminddb.lib -DOPENSSL_ROOT_DIR=C:\httpd-sdk\install\ -DENABLE_SOCACHE_DC=O -DENABLE_CHARSET_LITE=O ..\..\src\httpd -DEXTRA_COMPILE_FLAGS="/arch:AVX /GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox"
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/httpd_flags_%CMAKE_BUILD_TYPE%.sh
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/httpd_flags.sh %CYGV%
nmake /B /NOLOGO clean install
mt.exe -manifest C:\httpd-sdk\httpd.exe.manifest -outputresource:C:\httpd-sdk\install\bin\httpd.exe;1

REM http://uppod.ru/talk_2008
cd ..
rmdir /S /Q C:\httpd-sdk\build\mod_h264_streaming
mkdir C:\httpd-sdk\build\mod_h264_streaming
cd /D C:\httpd-sdk\build\mod_h264_streaming
cl /nologo -D HAVE_CONFIG_H -D WIN32 /GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/mod_h264_streaming.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 /GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/output_mp4.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 /GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/output_bucket.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 /GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/moov.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 /GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/mp4_process.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 /GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/mp4_writer.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 /GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/mp4_reader.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 /GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/mp4_io.c
link /nologo kernel32.lib "C:/httpd-sdk/install/lib/libhttpd.lib" "C:/httpd-sdk/install/lib/libapr-1.lib" "C:/httpd-sdk/install/lib/libaprutil-1.lib" -Dll /machine:%ARCH% /LTCG /OPT:ICF /debug /out:mod_h264_streaming.so output_mp4.obj output_bucket.obj mp4_writer.obj mp4_reader.obj mp4_process.obj mp4_io.obj moov.obj mod_h264_streaming.obj
copy /Y C:\httpd-sdk\build\mod_h264_streaming\mod_h264_streaming.so C:\httpd-sdk\install\modules\mod_h264_streaming.so
copy /Y C:\httpd-sdk\build\mod_h264_streaming\mod_h264_streaming.pdb C:\httpd-sdk\install\modules\mod_h264_streaming.pdb

cd /D C:\httpd-sdk\