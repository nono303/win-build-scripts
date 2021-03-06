@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

sed -i 's/_EVENT_/EVENT__/g' %CYGPATH_SRC%/%1/cmake/FindLibevent.cmake

	REM YES : static / NO : shared
for %%S in (YES NO) do (
	cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DENABLE_LIB_ONLY=ON ^
	-DENABLE_PYTHON_BINDINGS=OFF ^
	-DENABLE_EXAMPLES=OFF ^
	-DENABLE_STATIC_LIB=%%S ^
	-DLIBCARES_LIBRARY=%SLASHPATH_INSTALL%/lib/cares_static.lib ^
	-DLIBCARES_INCLUDE_DIR=%SLASHPATH_INSTALL%/include ^
	-DLIBEV_LIBRARY=%SLASHPATH_INSTALL%/lib/libev_static.lib ^
	-DLIBEVENT_INCLUDE_DIR=%SLASHPATH_INSTALL%/include/event2 ^
	-DJANSSON_INCLUDE_DIR=%SLASHPATH_INSTALL%/include ^
	-DJANSSON_LIBRARIES=%SLASHPATH_INSTALL%/lib/jansson.lib ^
	-DJEMALLOC_LIBRARY=%SLASHPATH_INSTALL%/lib/jemalloc.lib ^
	-DLIBEVENT_OPENSSL_LIBRARY=%SLASHPATH_INSTALL%/lib/event_openssl.lib ^
	-DJEMALLOC_INCLUDE_DIR=%SLASHPATH_INSTALL%/include ^
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
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	if %%S == YES sed -i 's/out:nghttp2.lib/LTCG \/out:nghttp2.lib/g' %CYGPATH_BUILD%/%1/lib/CMakeFiles/nghttp2_static.dir/build.make
	
	nmake %NMAKE_OPTS% clean install
	if %%S == YES (
		xcopy /C /F /Y %PATH_BUILD%\%1\lib\CMakeFiles\nghttp2_static.dir\nghttp2_static.pdb %PATH_INSTALL%\lib\*
		move /Y %PATH_INSTALL%\lib\nghttp2.lib %PATH_INSTALL%\lib\nghttp2_static.lib
	) else (
		xcopy /C /F /Y %PATH_BUILD%\%1\lib\nghttp2.pdb %PATH_INSTALL%\bin\*
	)
)