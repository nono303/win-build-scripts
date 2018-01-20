REM patch -i C:\httpd-sdk\src\mod_md\patches\mod_ssl_md-2.4.x-v5.diff

cd /D C:\httpd-sdk\src\jemalloc-cmake\
sh -c "CC=cl ./autogen.sh"
C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe msvc\jemalloc_vc2015.sln /m:8 /t:Clean,Build /p:Configuration=Release /p:DebugSymbols=false /p:DebugType=None /p:Plateform="x64"
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\x64\Release\jemalloc.dll c:\httpd-sdk\install\bin\jemalloc.dll
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\x64\Release\jemalloc.exp c:\httpd-sdk\install\lib\jemalloc.exp
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\x64\Release\jemalloc.iobj
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\x64\Release\jemalloc.ipdb
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\x64\Release\jemalloc.lib c:\httpd-sdk\install\lib\jemalloc.lib
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\x64\Release\jemalloc.pdb c:\httpd-sdk\install\bin\jemalloc.pdb
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\x64\Release\test_threads.exe c:\httpd-sdk\install\bin\test_threads.exe
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\x64\Release\test_threads.iobj
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\x64\Release\test_threads.ipdb
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\x64\Release\test_threads.pdb c:\httpd-sdk\install\bin\test_threads.pdb
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
copy /Y C:\httpd-sdk\build\libiconv\libcharset.pdb C:\httpd-sdk\install\bin\libcharset.pdb
copy /Y C:\httpd-sdk\build\libiconv\libiconv.pdb C:\httpd-sdk\install\bin\libiconv.pdb

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
perl Configure %perlbuild% --prefix=C:\httpd-sdk\install --openssldir=C:\httpd-sdk\install\conf --with-zlib-include=C:/httpd-sdk/install/include --with-zlib-lib=C:/httpd-sdk/install/lib/zlib.lib no-tests
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
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DENABLE_LIB_ONLY=ON -DLIBEVENT_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DJEMALLOC_LIBRARIES=C:/httpd-sdk/install/lib/jemalloc.lib -DLIBEVENT_OPENSSL_LIBRARY=C:/httpd-sdk/install/lib/event_openssl.lib -DJEMALLOC_INCLUDE_DIR=C:/httpd-sdk/install/include -DENABLE_WERROR=OFF -DENABLE_DEBUG=OFF -DENABLE_THREADS=ON -DENABLE_ASIO_LIB=OFF -DENABLE_FAILMALLOC=OFF -DWITH_LIBXML2=ON -DWITH_JEMALLOC=ON -DWITH_SPDYLAY=OFF -DWITH_MRUBY=OFF -DWITH_NEVERBLEED=OFF ..\..\src\nghttp2
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

cd ..
rmdir /S /Q C:\httpd-sdk\build\apr
mkdir C:\httpd-sdk\build\apr
cd /D C:\httpd-sdk\build\apr
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DMIN_WINDOWS_VER=0x0601 -DAPR_HAVE_IPV6=OFF -DAPR_INSTALL_PRIVATE_H=ON -DAPR_BUILD_TESTAPR=OFF -DINSTALL_PDB=ON  ..\..\src\apr
REM -DAPU_HAVE_CRYPTO=ON  pour trunk
nmake /B /NOLOGO clean install

cd ..
rmdir /S /Q C:\httpd-sdk\build\apr-util
mkdir C:\httpd-sdk\build\apr-util
cd /D C:\httpd-sdk\build\apr-util
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DAPR_HAS_LDAP=ON -DAPR_BUILD_TESTAPR=OFF -DAPU_HAVE_ODBC=ON -DINSTALL_PDB=ON -DAPU_HAVE_CRYPTO=ON -DOPENSSL_ROOT_DIR=C:\httpd-sdk\install\ ..\..\src\apr-util
nmake /B /NOLOGO clean install

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
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DINSTALL_PDB=ON -DENABLE_MODULES=i -DINSTALL_MANUAL=OFF -DLIBXML2_ICONV_INCLUDE_DIR=C:/httpd-sdk/install/include -DLIBXML2_ICONV_LIBRARIES=C:/httpd-sdk/install/lib/iconv.lib -DZLIB_LIBRARIES=C:/httpd-sdk/install/lib/zlib.lib -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DOPENSSL_ROOT_DIR=C:\httpd-sdk\install\ -DENABLE_SOCACHE_DC=O -DENABLE_CHARSET_LITE=O ..\..\src\httpd
REM -DEXTRA_COMPILE_FLAGS="/GL /GS- /Oy- /W0 /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox /wd9025" -DCMAKE_MODULE_LINKER_FLAGS=%EXTRA_LINK_FLAGS% -DCMAKE_SHARED_LINKER_FLAGS=%EXTRA_LINK_FLAGS% -DCMAKE_STATIC_LINKER_FLAGS=%EXTRA_LINK_FLAGS%
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/httpd_flags_%CMAKE_BUILD_TYPE%.sh
nmake /B /NOLOGO clean install
mt.exe -manifest C:\httpd-sdk\httpd.exe.manifest -outputresource:C:\httpd-sdk\install\bin\httpd.exe;1

cd /D C:\src\wku_bt
nmake -f makefile.win32 BUILD=%CYGV% HTTPD=C:\httpd-sdk\install clean all install install-mod-crash
copy /Y C:\src\wku_bt\testdiag.exe C:\httpd-sdk\install\bin\testdiag.exe
copy /Y C:\src\wku_bt\testcrash.exe C:\httpd-sdk\install\bin\testcrash.exe
copy /Y C:\src\wku_bt\testdiag.pdb C:\httpd-sdk\install\bin\testdiag.pdb
copy /Y C:\src\wku_bt\testcrash.pdb C:\httpd-sdk\install\bin\testcrash.pdb

cd /D C:\httpd-sdk\install\bin
openssl version
httpd -V

cd /D C:\httpd-sdk\