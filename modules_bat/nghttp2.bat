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
cd /D C:\httpd-sdk\modules_bat