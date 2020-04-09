call %PATH_MODULES_COMMON%\init.bat %1 cmake

sed -i 's/_EVENT_/EVENT__/g' %CYGPATH_SRC%/%1/cmake/FindLibevent.cmake

	REM lib static
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DENABLE_LIB_ONLY=ON -DENABLE_PYTHON_BINDINGS=OFF -DENABLE_EXAMPLES=OFF -DENABLE_STATIC_LIB=YES -DLIBCARES_LIBRARY=C:/httpd-sdk/install/lib/cares_static.lib -DLIBCARES_INCLUDE_DIR=C:/httpd-sdk/install/include -DLIBEV_LIBRARY=C:/httpd-sdk/install/lib/libev_static.lib -DLIBEVENT_INCLUDE_DIR=C:/httpd-sdk/install/include/event2 -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DJEMALLOC_LIBRARY=C:/httpd-sdk/install/lib/jemalloc.lib -DLIBEVENT_OPENSSL_LIBRARY=C:/httpd-sdk/install/lib/event_openssl.lib -DJEMALLOC_INCLUDE_DIR=C:/httpd-sdk/install/include -DENABLE_WERROR=OFF -DENABLE_DEBUG=OFF -DENABLE_THREADS=ON -DENABLE_FAILMALLOC=OFF -DWITH_LIBXML2=ON -DWITH_JEMALLOC=ON -DENABLE_HPACK_TOOLS=ON -DWITH_SPDYLAY=OFF -DWITH_MRUBY=OFF -DWITH_NEVERBLEED=OFF -DCYTHON_EXECUTABLE=C:\python27\Scripts %PATH_SRC%\%1
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/out:nghttp2.lib/LTCG \/out:nghttp2.lib/g' %CYGPATH_BUILD%/%1/lib/CMakeFiles/nghttp2_static.dir/build.make
nmake %NMAKE_OPTS% clean install
copy /Y %PATH_BUILD%\%1\lib\CMakeFiles\nghttp2_static.dir\nghttp2_static.pdb %PATH_INSTALL%\lib\nghttp2_static.pdb
move /Y %PATH_INSTALL%\lib\nghttp2.lib %PATH_INSTALL%\lib\nghttp2_static.lib

	REM dll shared
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DENABLE_LIB_ONLY=ON -DENABLE_PYTHON_BINDINGS=OFF -DENABLE_EXAMPLES=OFF -DENABLE_STATIC_LIB=NO -DLIBCARES_LIBRARY=C:/httpd-sdk/install/lib/cares_static.lib -DLIBCARES_INCLUDE_DIR=C:/httpd-sdk/install/include -DLIBEV_LIBRARY=C:/httpd-sdk/install/lib/libev_static.lib -DLIBEVENT_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DJEMALLOC_LIBRARY=C:/httpd-sdk/install/lib/jemalloc.lib -DLIBEVENT_OPENSSL_LIBRARY=C:/httpd-sdk/install/lib/event_openssl.lib -DJEMALLOC_INCLUDE_DIR=C:/httpd-sdk/install/include -DENABLE_WERROR=OFF -DENABLE_DEBUG=OFF -DENABLE_THREADS=ON -DENABLE_FAILMALLOC=OFF -DWITH_LIBXML2=ON -DWITH_JEMALLOC=ON -DENABLE_HPACK_TOOLS=ON -DWITH_SPDYLAY=OFF -DWITH_MRUBY=OFF -DWITH_NEVERBLEED=OFF -DCYTHON_EXECUTABLE=C:\python27\Scripts %PATH_SRC%\%1
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install
copy %PATH_BUILD%\%1\lib\nghttp2.pdb %PATH_INSTALL%\bin\nghttp2.pdb