REM patch -i C:\httpd-sdk\src\mod_md\patches\mod_ssl_md-2.4.x-v5.diff

cd ..
rmdir /S /Q C:\httpd-sdk\build\zlib
mkdir C:\httpd-sdk\build\zlib
cd /D C:\httpd-sdk\build\zlib
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON ..\..\src\zlib
nmake /B /NOLOGO clean install
move /Y C:\src\zlib\zconf.h.included C:\src\zlib\zconf.h

cd ..
rmdir /S /Q C:\httpd-sdk\build\brotli
mkdir C:\httpd-sdk\build\brotli
cd /D C:\httpd-sdk\build\brotli
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON ..\..\src\brotli
nmake /B /NOLOGO clean install

cd ..
rmdir /S /Q C:\httpd-sdk\build\jansson
mkdir C:\httpd-sdk\build\jansson
cd /D C:\httpd-sdk\build\jansson
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DUSE_URANDOM=OFF -DJANSSON_EXAMPLES=OFF -DJANSSON_BUILD_DOCS=OFF -DJANSSON_BUILD_SHARED_LIBS=ON ..\..\src\jansson
nmake /B /NOLOGO clean install

cd /D c:\httpd-sdk\src\bzip2-1.0.6
nmake /f Makefile.msc clean lib bzip2 
copy /Y c:\httpd-sdk\src\bzip2-1.0.6\bzlib.h c:\httpd-sdk\install\include\bzlib.h
	REM libbz2 => bzip2
copy /Y C:\httpd-sdk\src\bzip2-1.0.6\libbz2.lib c:\httpd-sdk\install\lib\bzip2.lib
copy /Y C:\httpd-sdk\src\bzip2-1.0.6\bzip2.exe c:\httpd-sdk\install\bin\bzip2.exe
copy /Y C:\httpd-sdk\src\bzip2-1.0.6\bzip2recover.exe c:\httpd-sdk\install\bin\bzip2recover.exe

cd ..
rmdir /S /Q C:\httpd-sdk\build\libiconv
mkdir C:\httpd-sdk\build\libiconv
cd /D C:\httpd-sdk\build\libiconv
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON ..\..\src\libiconv
nmake /NOLOGO /A /B clean install
	REM pour libxml2 2.9.7
copy /Y C:\httpd-sdk\src\libiconv\include\iconv.h C:\httpd-sdk\install\include\iconv.h
	REM pour libxml2 & httpd
copy /Y C:\httpd-sdk\install\lib\libiconv.lib C:\httpd-sdk\install\lib\iconv.lib

cd /D C:\httpd-sdk\src\libxml2\win32
cscript configure.js compiler=nmakemsvc prefix=C:\httpd-sdk\install include=C:\httpd-sdk\install\include lib=C:\httpd-sdk\install\lib debug=no zlib=yes
nmake /NOLOGO /A /B /f Makefile.msvc clean install

cd ..
rmdir /S /Q C:\httpd-sdk\build\pcre
mkdir C:\httpd-sdk\build\pcre
cd /D C:\httpd-sdk\build\pcre
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DPCRE_BUILD_TESTS=OFF -DPCRE_BUILD_PCRECPP=OFF -DPCRE_BUILD_PCREGREP=OFF -DPCRE_SUPPORT_PCREGREP_JIT=OFF -DPCRE_SUPPORT_UTF=ON -DPCRE_SUPPORT_UNICODE_PROPERTIES=ON -DPCRE_NEWLINE=CRLF -DINSTALL_MSVC_PDB=OFF -DBZIP2_INCLUDE_DIR=C:\httpd-sdk\install\inculde ..\..\src\pcre
nmake /NOLOGO /A /B clean install

cd /D C:\httpd-sdk\src\openssl
perl Configure %perlbuild% --prefix=C:\httpd-sdk\install --openssldir=C:\httpd-sdk\install\conf --with-zlib-include=C:/httpd-sdk/install/include --with-zlib-lib=C:/httpd-sdk/install/lib/zlib.lib no-tests
nmake /B /NOLOGO clean install

cd ..
rmdir /S /Q C:\httpd-sdk\build\libssh2
mkdir C:\httpd-sdk\build\libssh2
cd /D C:\httpd-sdk\build\libssh2
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ..\..\src\libssh2
nmake /B /NOLOGO clean install

cd ..
rmdir /S /Q C:\httpd-sdk\build\curl
mkdir C:\httpd-sdk\build\curl
cd /D C:\httpd-sdk\build\curl
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON ..\..\src\curl
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
	REM -- Jemalloc:       FALSE (LIBS='')
	REM -- Zlib:           TRUE (LIBS='C:/httpd-sdk/install/lib/zlib.lib')
cd ..
rmdir /S /Q C:\httpd-sdk\build\nghttp2
mkdir C:\httpd-sdk\build\nghttp2
cd /D C:\httpd-sdk\build\nghttp2
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DENABLE_LIB_ONLY=ON -DLIBEVENT_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DENABLE_WERROR=OFF -DENABLE_DEBUG=OFF -DENABLE_THREADS=ON -DENABLE_ASIO_LIB=OFF -DENABLE_FAILMALLOC=OFF -DWITH_LIBXML2=ON -DWITH_JEMALLOC=OFF -DWITH_SPDYLAY=OFF -DWITH_MRUBY=OFF -DWITH_NEVERBLEED=OFF ..\..\src\nghttp2
nmake /B /NOLOGO clean install
move /Y C:\httpd-sdk\install\lib\nghttp2.dll C:\httpd-sdk\install\bin\nghttp2.dll

cd ..
rmdir /S /Q C:\httpd-sdk\build\libexpat
mkdir C:\httpd-sdk\build\libexpat
cd /D C:\httpd-sdk\build\libexpat
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_doc=OFF -DBUILD_tests=OFF -DBUILD_examples=OFF -DBUILD_tools=OFF ..\..\src\libexpat\expat
nmake /B /NOLOGO clean install

	REM -- OPTIMISATION CFLAGS KO...
cd ..
rmdir /S /Q C:\httpd-sdk\build\apr
mkdir C:\httpd-sdk\build\apr
cd /D C:\httpd-sdk\build\apr
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DMIN_WINDOWS_VER=0x0600 -DAPR_HAVE_IPV6=OFF -DAPR_INSTALL_PRIVATE_H=ON -DAPR_BUILD_TESTAPR=OFF -DINSTALL_PDB=OFF ..\..\src\apr
nmake /B /NOLOGO clean install

	REM -- OPTIMISATION CFLAGS KO...
cd ..
rmdir /S /Q C:\httpd-sdk\build\apr-util
mkdir C:\httpd-sdk\build\apr-util
cd /D C:\httpd-sdk\build\apr-util
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DAPU_HAVE_CRYPTO=ON -DAPR_HAS_LDAP=ON -DAPR_BUILD_TESTAPR=OFF -DAPU_HAVE_ODBC=ON -DINSTALL_PDB=OFF -DOPENSSL_ROOT_DIR=C:\httpd-sdk\install\ ..\..\src\apr-util
nmake /B /NOLOGO clean install

cd ..
rmdir /S /Q C:\httpd-sdk\build\lua
mkdir C:\httpd-sdk\build\lua
cd /D C:\httpd-sdk\build\lua
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ..\..\src\lua
nmake /B /NOLOGO clean install

	REM -- OPTIMISATION CFLAGS KO...
cd ..
rmdir /S /Q C:\httpd-sdk\build\httpd
mkdir C:\httpd-sdk\build\httpd
cd /D C:\httpd-sdk\build\httpd
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DINSTALL_PDB=ON -DENABLE_MODULES=i -DINSTALL_MANUAL=OFF -DLIBXML2_ICONV_INCLUDE_DIR=C:/httpd-sdk/install/include -DLIBXML2_ICONV_LIBRARIES=C:/httpd-sdk/install/lib/iconv.lib -DZLIB_LIBRARIES=C:/httpd-sdk/install/lib/zlib.lib -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DOPENSSL_ROOT_DIR=C:\httpd-sdk\install\ -DENABLE_SOCACHE_DC=O -DENABLE_CHARSET_LITE=O ..\..\src\httpd
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/httpd_flags_%CMAKE_BUILD_TYPE%.sh
nmake /B /NOLOGO clean install
mt.exe -manifest C:\httpd-sdk\httpd.exe.manifest -outputresource:C:\httpd-sdk\install\bin\httpd.exe;1

cd /D C:\src\wku_bt-2.01
nmake -f makefile.win32 BUILD=%CYGV% HTTPD=C:\httpd-sdk\install clean all install install-mod-crash
copy /Y C:\src\wku_bt-2.01\testdiag.exe C:\httpd-sdk\install\bin\testdiag.exe
copy /Y C:\src\wku_bt-2.01\testcrash.exe C:\httpd-sdk\install\bin\testcrash.exe

cd /D C:\httpd-sdk\install\bin
openssl version
httpd -V

cd /D C:\httpd-sdk\