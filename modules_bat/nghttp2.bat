set EXTCFLAGS=%EXTCFLAGSNGHTTP2%
cd ..
rmdir /S /Q C:\httpd-sdk\build\nghttp2
mkdir C:\httpd-sdk\build\nghttp2
cd /D C:\httpd-sdk\build\nghttp2
	REM -DENABLE_ASIO_LIB=ON -DBOOST_ROOT=C:\src\boost -DBOOST_LIBRARYDIR=C:\src\boost\libs
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DENABLE_LIB_ONLY=ON -DENABLE_STATIC_LIB=NO -DLIBCARES_LIBRARY=C:/httpd-sdk/install/lib/cares_static.lib -DLIBCARES_INCLUDE_DIR=C:/httpd-sdk/install/include -DLIBEV_LIBRARY=C:/httpd-sdk/install/lib/libev_static.lib -DLIBEVENT_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DJEMALLOC_LIBRARY=C:/httpd-sdk/install/lib/jemalloc.lib -DLIBEVENT_OPENSSL_LIBRARY=C:/httpd-sdk/install/lib/event_openssl.lib -DJEMALLOC_INCLUDE_DIR=C:/httpd-sdk/install/include -DENABLE_WERROR=OFF -DENABLE_DEBUG=OFF -DENABLE_THREADS=ON -DENABLE_FAILMALLOC=OFF -DWITH_LIBXML2=ON -DWITH_JEMALLOC=ON -DWITH_SPDYLAY=OFF -DWITH_MRUBY=OFF -DWITH_NEVERBLEED=OFF -DCYTHON_EXECUTABLE=C:\python27\Scripts -DCMAKE_C_FLAGS="%EXTCFLAGS%" -DCMAKE_CXX_FLAGS="%EXTCFLAGS%" ..\..\src\nghttp2
sed -i 's/INCREMENTAL/LTCG/g' /cygdrive/c/httpd-sdk/build/nghttp2/lib/CMakeFiles/nghttp2.dir/build.make
	REM si -DENABLE_STATIC_LIB=NO 
	REM sed -i 's/out:nghttp2.lib/LTCG \/out:nghttp2.lib/g' /cygdrive/c/httpd-sdk/build/nghttp2/lib/CMakeFiles/nghttp2_static.dir/build.make
nmake %NMAKE_OPTS% clean install
copy /Y C:\httpd-sdk\build\nghttp2\lib\nghttp2.pdb C:\httpd-sdk\install\bin\nghttp2.pdb
cd /D C:\httpd-sdk\modules_bat
set EXTCFLAGS=/GL %EXTCFLAGSNGHTTP2%