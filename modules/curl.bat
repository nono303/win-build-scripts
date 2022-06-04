@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM https://github.com/curl/curl/blob/master/GIT-INFO
copy /Y %PATH_SRC%\%1\src\tool_hugehelp.c.cvs %PATH_SRC%\%1\src\tool_hugehelp.c

	REM set LIBCURL_TIMESTAMP
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\date -u`) do (set LIBCURL_TIMESTAMP=%%F)
sed -i 's/\[unreleased\]/%LIBCURL_TIMESTAMP%/g' %CYGPATH_SRC%/%1/include/curl/curlver.h

set QUIC=
if %QUIC_BUILD% == 1 (
	set QUIC=-DUSE_NGTCP2=ON ^
		 -DNGTCP2_INCLUDE_DIR=%PATH_INSTALL%\include ^
		 -DNGTCP2_LIBRARY=%PATH_INSTALL%\lib\ngtcp2_crypto_openssl.lib;%PATH_INSTALL%\lib\ngtcp2.lib ^
		 -DNGHTTP3_INCLUDE_DIR=%PATH_INSTALL%\include ^
		 -DNGHTTP3_LIBRARY=%PATH_INSTALL%\lib\nghttp3.lib
)

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DCURL_WERROR=OFF ^
-DBUILD_CURL_EXE=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DCURL_LTO=ON ^
-DENABLE_THREADED_RESOLVER=ON ^
-DENABLE_MANUAL=OFF ^
-DBUILD_TESTING=OFF ^
-DUSE_WIN32_LDAP=ON ^
-DCURL_ZLIB=ON ^
-DZLIB_LIBRARY=%PATH_INSTALL%\lib\zlib.lib ^
-DZLIB_INCLUDE_DIR=%PATH_INSTALL%\include ^
-DCURL_BROTLI=ON ^
-DBROTLIDEC_LIBRARY=%PATH_INSTALL%\lib\brotlidec.lib ^
-DBROTLICOMMON_LIBRARY=%PATH_INSTALL%\lib\brotlicommon.lib ^
-DBROTLI_INCLUDE_DIR=%PATH_INSTALL%\include ^
-DENABLE_ARES=ON ^
-DCARES_LIBRARY=%PATH_INSTALL%\lib\cares.lib ^
-DCARES_INCLUDE_DIR=%PATH_INSTALL%\include ^
-DUSE_NGHTTP2=ON ^
-DNGHTTP2_LIBRARY=%PATH_INSTALL%\lib\nghttp2.lib ^
-DNGHTTP2_INCLUDE_DIR=%PATH_INSTALL%\include ^
-DCURL_USE_OPENSSL=ON ^
-DCURL_USE_LIBSSH2=ON ^
-DCURL_USE_SCHANNEL=ON ^
-DCURL_WINDOWS_SSPI=ON ^
-DOPENSSL_ROOT_DIR=%PATH_INSTALL_OSSL% ^
-DOPENSSL_INCLUDE_DIR=%PATH_INSTALL_OSSL%\include ^
-DLIBSSH2_LIBRARY=%PATH_INSTALL%\lib\libssh2.lib ^
-DLIBSSH2_INCLUDE_DIR=%PATH_INSTALL%\include ^
-DHAVE_LDAP_SSL=ON ^
-DCURL_STATIC_CRT=OFF ^
%QUIC% ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
for %%Y in (libcurl-target.cmake lib\cmake_install.cmake build.ninja) do (sed -i 's/libcurl_imp\.lib/libcurl\.lib/g' %CYGPATH_BUILD%/%1/%%Y)
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\lib\libcurl.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\curl.pdb %PATH_INSTALL%\bin\*

for %%E in (libcurl.dll curl.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%E "ssl_backend: !CURL_SSL_ENGINE!"
)
	REM for http cmake find
	REM KO -- Found CURL: C:/sdk/release/vs17_x64-avx/lib/cmake/CURL/CURLConfig.cmake (found version "7.81.0-DEV")
	REM OK -- Found CURL: C:/sdk/release/vs17_x64-avx/lib/libcurl_imp.lib (found version "7.81.0-DEV")
rmdir /S /Q %PATH_INSTALL%\lib\cmake\CURL
DEL /Q /F %PATH_INSTALL%\bin\curl-config
curl https://curl.se/ca/cacert.pem -o %PATH_INSTALL%\bin\curl-ca-bundle.crt