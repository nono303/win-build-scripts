@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_STATIC_LIBS=NO ^
-DBUILD_SHARED_LIBS=YES ^
-DBUILD_EXAMPLES=OFF ^
-DBUILD_TESTING=OFF ^
-DHIDE_SYMBOLS=OFF ^
-DENABLE_DEBUG_LOGGING=OFF ^
-DLINT=OFF ^
-DOPENSSL_ROOT_DIR=%PATH_INSTALL_OSSL% ^
-DCRYPTO_BACKEND=OpenSSL ^
-DENABLE_ZLIB_COMPRESSION=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	REM force lib generation in shared '__declspec(dllexport)' cf. /sdk/src/libssh2/include/libssh2.h
sed -i 's/\/D_WINDOWS/\/D_WINDOWS \/DLIBSSH2_WIN32 \/D_WINDLL \/D_LIBSSH2_LIBRARY/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install

for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\src\libssh2.%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_BUILD%\%1\src\libssh2.lib %PATH_INSTALL%\lib\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libssh2.dll