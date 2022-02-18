@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

sed -i 's/_EVENT_/EVENT__/g' %CYGPATH_SRC%/%1/cmake/FindLibevent.cmake

for %%C in ("-DENABLE_STATIC_LIB=YES -DENABLE_SHARED_LIB=NO" "-DENABLE_STATIC_LIB=NO -DENABLE_SHARED_LIB=YES") do (
		REM dirty !! https://stackoverflow.com/questions/9556676/batch-file-how-to-replace-equal-signs-and-a-string-variable
	set CUR=%%C
	setlocal enabledelayedexpansion
	set new=!CUR:"=!

	if %QUIC_BUILD% == 1 (set QUIC=-DENABLE_HTTP3=ON -DLIBNGTCP2_INCLUDE_DIR=%PATH_INSTALL:\=/%/include -DLIBNGTCP2_CRYPTO_OPENSSL_LIBRARY=%PATH_INSTALL:\=/%/lib/ngtcp2_static.lib -DLIBNGTCP2_CRYPTO_OPENSSL_INCLUDE_DIR=%PATH_INSTALL:\=/%/include)

	cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DENABLE_LIB_ONLY=ON ^
	-DENABLE_PYTHON_BINDINGS=OFF ^
	-DENABLE_EXAMPLES=OFF ^
	-DLIBCARES_LIBRARY=%PATH_INSTALL:\=/%/lib/cares_static.lib ^
	-DLIBCARES_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
	-DLIBEV_LIBRARY=%PATH_INSTALL:\=/%/lib/libev_static.lib ^
	-DLIBEVENT_INCLUDE_DIR=%PATH_INSTALL:\=/%/include/event2 ^
	-DJANSSON_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
	-DJANSSON_LIBRARIES=%PATH_INSTALL:\=/%/lib/jansson.lib ^
	-DJEMALLOC_LIBRARY=%PATH_INSTALL:\=/%/lib/jemalloc.lib ^
	-DLIBEVENT_OPENSSL_LIBRARY=%PATH_INSTALL:\=/%/lib/event_openssl.lib ^
	-DJEMALLOC_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
	-DENABLE_WERROR=OFF ^
	-DENABLE_DEBUG=OFF ^
	-DENABLE_THREADS=ON ^
	-DENABLE_FAILMALLOC=OFF ^
	-DWITH_LIBXML2=ON ^
	-DWITH_JEMALLOC=ON ^
	-DENABLE_HPACK_TOOLS=ON ^
	-DWITH_SPDYLAY=OFF ^
	-DWITH_MRUBY=OFF ^
	-DWITH_NEVERBLEED=OFF ^
	-DCYTHON_EXECUTABLE=%PATH_BIN_PYTHON%\Scripts ^
	!QUIC! !new! ^
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX:/=\/%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	%NINJA% install

	if %%C =="-DENABLE_STATIC_LIB=YES -DENABLE_SHARED_LIB=NO" (
		xcopy /C /F /Y %PATH_BUILD%\%1\lib\CMakeFiles\nghttp2_static.dir\nghttp2_static.pdb %PATH_INSTALL%\lib\*
		move /Y %PATH_INSTALL%\lib\nghttp2.lib %PATH_INSTALL%\lib\nghttp2_static.lib
	) else (
		xcopy /C /F /Y %PATH_BUILD%\%1\lib\nghttp2.pdb %PATH_INSTALL%\bin\*
		call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\nghttp2.dll
	)
)