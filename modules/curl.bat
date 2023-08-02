@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

if %CURL_PATCH_WIN_OPENSSL% == 1 (
	if %ARG_KEEPSRC% == 0 (
		setlocal enabledelayedexpansion
		set CURL_DESC=patched for openssl backend using Windows CA store
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

	REM HTTP3
set QUIC=
if %QUIC_BUILD% == 1 (
	set QUIC=-DUSE_NGTCP2=ON ^
		-DUSE_NGHTTP3=ON ^
		-DUSE_QUICHE=OFF ^
		-DUSE_MSH3=OFF ^
		-DNGTCP2_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
		-DNGTCP2_LIBRARY=%PATH_INSTALL:\=/%/lib/ngtcp2_crypto_quictls.lib;%PATH_INSTALL:\=/%/lib/ngtcp2.lib ^
		-DNGHTTP3_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
		-DNGHTTP3_LIBRARY=%PATH_INSTALL:\=/%/lib/nghttp3.lib
)

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL:\=/% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DZLIB_LIBRARY=%PATH_INSTALL:\=/%/lib/zlib.lib ^
-DZLIB_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DBROTLIDEC_LIBRARY=%PATH_INSTALL:\=/%/lib/brotlidec.lib ^
-DBROTLICOMMON_LIBRARY=%PATH_INSTALL:\=/%/lib/brotlicommon.lib ^
-DBROTLI_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DCARES_LIBRARY=%PATH_INSTALL:\=/%/lib/cares.lib ^
-DCARES_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DNGHTTP2_LIBRARY=%PATH_INSTALL:\=/%/lib/nghttp2.lib ^
-DNGHTTP2_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DOPENSSL_ROOT_DIR=%PATH_INSTALL_OSSL% ^
-DOPENSSL_INCLUDE_DIR=%PATH_INSTALL_OSSL%/include ^
-DLIBSSH2_LIBRARY=%PATH_INSTALL:\=/%/lib/libssh2.lib ^
-DLIBSSH2_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DBUILD_CURL_EXE=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_TESTING=OFF ^
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
-DCURL_USE_LIBSSH2=ON ^
-DCURL_USE_MBEDTLS=OFF ^
-DCURL_USE_NSS=OFF ^
-DCURL_USE_OPENLDAP=OFF ^
-DCURL_USE_OPENSSL=ON ^
-DCURL_USE_SCHANNEL=ON ^
-DCURL_USE_SECTRANSP=OFF ^
-DCURL_USE_WOLFSSL=OFF ^
-DCURL_WINDOWS_SSPI=ON ^
-DENABLE_ARES=ON ^
-DENABLE_CURLDEBUG=OFF ^
-DENABLE_DEBUG=OFF ^
-DENABLE_IPV6=ON ^
-DENABLE_MANUAL=OFF ^
-DENABLE_THREADED_RESOLVER=ON ^
-DENABLE_UNICODE=ON ^
-DENABLE_UNIX_SOCKETS=ON ^
-DENABLE_WEBSOCKETS=ON ^
-DCURL_BROTLI=ON ^
-DCURL_ZSTD=ON ^
-DUSE_NGHTTP2=ON ^
-DUSE_WIN32_IDN=ON ^
-DUSE_LIBIDN2=OFF ^
-DUSE_WIN32_LDAP=ON ^
-DHAVE_LDAP_SSL=ON ^
-DHTTP_ONLY=OFF ^
-DCURL_DISABLE_OPENSSL_AUTO_LOAD_CONFIG=OFF ^
%QUIC% ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
for %%Y in (libcurl-target.cmake lib\cmake_install.cmake build.ninja) do (sed -i 's/libcurl_imp\.lib/libcurl\.lib/g' %CYGPATH_BUILD%/%1/%%Y)
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\lib\libcurl.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\curl.pdb %PATH_INSTALL%\bin\*

for %%E in (libcurl.dll curl.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%E "%CURL_DESC%"
)
	REM for http cmake find
	REM KO -- Found CURL: C:/sdk/release/vs17_x64-avx/lib/cmake/CURL/CURLConfig.cmake (found version "7.81.0-DEV")
	REM OK -- Found CURL: C:/sdk/release/vs17_x64-avx/lib/libcurl_imp.lib (found version "7.81.0-DEV")
rmdir /S /Q %PATH_INSTALL%\lib\cmake\CURL
DEL /Q /F %PATH_INSTALL%\bin\curl-config
curl https://curl.se/ca/cacert.pem -o %PATH_INSTALL%\bin\curl-ca-bundle.crt