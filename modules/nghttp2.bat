@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

sed -i 's/_EVENT_/EVENT__/g' %CYGPATH_SRC%/%1/cmake/FindLibevent.cmake
	:: fix useless cmake warning when ENABLE_HTTP3=OFF and openssl doesn't support QUIC
sed -i 's/WARNING "OpenSSL/"   OpenSSL/g' %CYGPATH_SRC%/%1/CMakeLists.txt

if %QUIC_BUILD% == 1 (
	set QUIC=-DENABLE_HTTP3=ON -DLIBNGTCP2_INCLUDE_DIR=%PATH_INSTALL:\=/%/include
) else (
	set QUIC=-DENABLE_HTTP3=OFF
)

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DENABLE_LIB_ONLY=ON ^
-DENABLE_APP=OFF ^
-DENABLE_EXAMPLES=OFF ^
-DENABLE_DOC=OFF ^
-DENABLE_STATIC_CRT=OFF ^
-DLIBCARES_LIBRARY=%PATH_INSTALL:\=/%/lib/cares.lib ^
-DLIBCARES_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DLIBEV_LIBRARY=%PATH_INSTALL:\=/%/lib/libev.lib ^
-DLIBEVENT_INCLUDE_DIR=%PATH_INSTALL:\=/%/include/event2 ^
-DJANSSON_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DJANSSON_LIBRARIES=%PATH_INSTALL:\=/%/lib/jansson.lib ^
-DJEMALLOC_LIBRARY=%PATH_INSTALL:\=/%/lib/jemalloc.lib ^
-DLIBEVENT_OPENSSL_LIBRARY=%PATH_INSTALL:\=/%/lib/event_openssl.lib ^
-DJEMALLOC_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DOPENSSL_ROOT_DIR=%PATH_INSTALL_OSSL% ^
-DOPENSSL_INCLUDE_DIR=%PATH_INSTALL_OSSL%\include ^
-DENABLE_WERROR=OFF ^
-DENABLE_DEBUG=OFF ^
-DENABLE_THREADS=ON ^
-DENABLE_FAILMALLOC=OFF ^
-DWITH_LIBXML2=ON ^
-DWITH_JEMALLOC=ON ^
-DENABLE_HPACK_TOOLS=OFF ^
-DWITH_MRUBY=OFF ^
-DWITH_LIBBPF=OFF ^
-DWITH_NEVERBLEED=OFF ^
-DENABLE_STATIC_LIB=NO ^
-DENABLE_SHARED_LIB=YES ^
-DCMAKE_DISABLE_FIND_PACKAGE_CUnit=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_Systemd=1 ^
%QUIC% ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\lib\nghttp2.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\nghttp2.dll