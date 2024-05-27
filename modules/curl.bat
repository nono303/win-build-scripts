@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

if %CURL_PATCH_WIN_OPENSSL% == 1 (
	if %ARG_KEEPSRC% == 0 (
		setlocal enabledelayedexpansion
		set CURL_DESC=openssl using Windows CA store patch
		cd /D %PATH_SRC%\%1
		echo     # apply curl_ca-win.patch
		git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\curl_ca-win.patch
		cd /D %PATH_BUILD%\%1
	)
	echo    ^>^>^> !CURL_DESC!
)

	REM set LIBCURL_TIMESTAMP
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\date -u`) do (set LIBCURL_TIMESTAMP=%%F)
sed -i 's/\[unreleased\]/%LIBCURL_TIMESTAMP%/g' %CYGPATH_SRC%/%1/include/curl/curlver.h

	REM CURL_USE_SCHANNEL - MultiSSL cannot be enabled with HTTP/3 and vice versa
set QUIC=-DCURL_USE_SCHANNEL=ON
if %QUIC_BUILD% == 1 (
	set QUIC=^
		-DCURL_USE_SCHANNEL=OFF ^
		-DUSE_NGTCP2=ON ^
		-DUSE_NGHTTP3=ON ^
		-DUSE_QUICHE=OFF ^
		-DUSE_MSH3=OFF ^
		-DUSE_OPENSSL_QUIC=OFF
)

	REM light build for mod_md
set CURLCMAKEBUILD=
if "%2"=="mod_md" (
	set CURLCMAKEBUILD=^
	-DCURL_USE_SCHANNEL=OFF ^
	-DCURL_BROTLI=OFF ^
	-DENABLE_ARES=OFF ^
	-DUSE_NGHTTP2=OFF ^
	-DCURL_USE_LIBSSH2=OFF ^
	-DCURL_ZSTD=OFF
) else (
	set CURLCMAKEBUILD=^
	-DCURL_BROTLI=ON ^
	-DENABLE_ARES=ON ^
	-DUSE_NGHTTP2=ON ^
	-DCURL_USE_LIBSSH2=ON ^
	-DCURL_ZSTD=ON ^
	%QUIC%
)

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_STATIC_LIBRARY_SUFFIX=_static ^
-DBUILD_CURL_EXE=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_STATIC_LIBS=OFF ^
-DBUILD_STATIC_CURL=OFF ^
-DBUILD_TESTING=OFF ^
-DCURL_DISABLE_INSTALL=OFF ^
-DBUILD_LIBCURL_DOCS=OFF ^
-DBUILD_MISC_DOCS=OFF ^
-DENABLE_CURL_MANUAL=OFF ^
-DPICKY_COMPILER=OFF ^
-DCURL_HIDDEN_SYMBOLS=ON ^
-DCURL_WERROR=OFF ^
-DCURL_ENABLE_EXPORT_TARGET=ON ^
-DCURL_STATIC_CRT=OFF ^
-DCURL_LTO=ON ^
-DCURL_ENABLE_SSL=ON ^
-DCURL_USE_BEARSSL=OFF ^
-DCURL_USE_GSSAPI=OFF ^
-DCURL_USE_LIBPSL=OFF ^
-DCURL_USE_LIBSSH=OFF ^
-DCURL_USE_MBEDTLS=OFF ^
-DCURL_USE_OPENSSL=ON ^
-DCURL_USE_SECTRANSP=OFF ^
-DCURL_USE_WOLFSSL=OFF ^
-DCURL_USE_GNUTLS=OFF ^
-DCURL_WINDOWS_SSPI=ON ^
-DHTTP_ONLY=OFF ^
-DCURL_DISABLE_OPENSSL_AUTO_LOAD_CONFIG=OFF ^
-DENABLE_CURLDEBUG=OFF ^
-DENABLE_DEBUG=OFF ^
-DENABLE_IPV6=ON ^
-DENABLE_THREADED_RESOLVER=ON ^
-DENABLE_UNIX_SOCKETS=ON ^
-DENABLE_WEBSOCKETS=ON ^
-DUSE_WIN32_IDN=ON ^
-DUSE_APPLE_IDN=OFF ^
-DUSE_WIN32_LDAP=ON ^
-DHAVE_LDAP_SSL=ON ^
-DENABLE_UNICODE=ON ^
-DUSE_LIBIDN2=OFF ^
-DUSE_LIBRTMP=OFF ^
-DUSE_HTTPSRR=ON ^
-DUSE_ECH=OFF ^
%CURLCMAKEBUILD% ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
for %%Y in (libcurl-target.cmake lib\cmake_install.cmake build.ninja) do (sed -i 's/libcurl_imp\.lib/libcurl\.lib/g' %CYGPATH_BUILD%/%1/%%Y)
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\lib\libcurl.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\curl.pdb %PATH_INSTALL%\bin\*

for %%E in (libcurl.dll curl.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%E "%CURL_DESC%"
)
curl https://curl.se/ca/cacert.pem -o %PATH_INSTALL%\bin\curl-ca-bundle.crt