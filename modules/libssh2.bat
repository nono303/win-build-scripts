@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM NO : static / YES : shared
for %%S in (YES NO) do (
	cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DBUILD_SHARED_LIBS=%%S ^
	-DBUILD_EXAMPLES=OFF ^
	-DBUILD_TESTING=OFF ^
	-DOPENSSL_ROOT_DIR=%PATH_INSTALL% ^
	-DZLIB_LIBRARY=%PATH_INSTALL:\=/%/lib/zlib.lib ^
	-DZLIB_INCLUDE_DIR=%PATH_INSTALL%\include ^
	-DCRYPTO_BACKEND=OpenSSL ^
	-DENABLE_ZLIB_COMPRESSION=ON ^
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX:/=\/%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	if %%S == NO (
		sed -i 's/libssh2.lib/libssh2_static.lib/g' %CYGPATH_BUILD%/%1/build.ninja
		sed -i 's/libssh2.pdb/libssh2_static.pdb/g' %CYGPATH_BUILD%/%1/build.ninja
		sed -i 's/libssh2.lib/libssh2_static.lib/g' %CYGPATH_BUILD%/%1/src/cmake_install.cmake
	) else (
		REM force lib generation in shared '__declspec(dllexport)' cf. /sdk/src/libssh2/include/libssh2.h
		sed -i 's/\/D_WINDOWS/\/D_WINDOWS \/DLIBSSH2_WIN32 \/D_WINDLL \/D_LIBSSH2_LIBRARY/g' %CYGPATH_BUILD%/%1/build.ninja
	)
	%NINJA% install

	if %%S == YES (
		for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\src\libssh2.%%X %PATH_INSTALL%\bin\*)
		xcopy /C /F /Y %PATH_BUILD%\%1\src\libssh2.lib %PATH_INSTALL%\lib\*
		call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libssh2.dll
	) else (
		xcopy /C /F /Y %PATH_BUILD%\%1\src\libssh2_static.lib %PATH_INSTALL%\lib\*
		xcopy /C /F /Y %PATH_BUILD%\%1\src\CMakeFiles\libssh2.dir\libssh2_static.pdb %PATH_INSTALL%\lib\*
	)
)
