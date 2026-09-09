@echo off && call %PATH_UTILS%\init.bat %1 cmake nocxx

	REM set LIBCURL_TIMESTAMP
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\date -u`) do (set LIBCURL_TIMESTAMP=%%F)
sed -i 's/\[unreleased\]/%LIBCURL_TIMESTAMP%/g' %CYGPATH_SRC%/%1/include/curl/curlver.h

set CURL_CMAKE_COMMON=-D_CURL_PREFILL=ON ^
-DBUILD_EXAMPLES=OFF ^
-DBUILD_LIBCURL_DOCS=OFF ^
-DBUILD_MISC_DOCS=OFF ^
-DBUILD_STATIC_CURL=OFF ^
-DBUILD_TESTING=OFF ^
-DCMAKE_UNITY_BUILD=1 ^
-DCURL_BUILD_EVERYTHING=OFF ^
-DCURL_CA_FALLBACK=OFF ^
-DCURL_CA_NATIVE=ON ^
-DCURL_CA_SEARCH_SAFE=OFF ^
-DCURL_CLANG_TIDY=OFF ^
-DCURL_CODE_COVERAGE=OFF ^
-DCURL_DISABLE_CA_SEARCH=OFF ^
-DCURL_DISABLE_OPENSSL_AUTO_LOAD_CONFIG=OFF ^
-DCURL_DROP_UNUSED=ON ^
-DCURL_ENABLE_EXPORT_TARGET=ON ^
-DCURL_ENABLE_SSL=ON ^
-DCURL_HIDDEN_SYMBOLS=ON ^
-DCURL_LINT=OFF ^
-DCURL_LTO=ON ^
-DCURL_STATIC_CRT=OFF ^
-DCURL_TARGET_WINDOWS_VERSION=0x0A00 ^
-DCURL_USE_CMAKECONFIG=ON ^
-DCURL_USE_GSASL=OFF ^
-DCURL_USE_GSSAPI=OFF ^
-DCURL_USE_LIBBACKTRACE=OFF ^
-DCURL_USE_LIBPSL=OFF ^
-DCURL_USE_LIBSSH=OFF ^
-DCURL_USE_LIBUV=OFF ^
-DCURL_USE_MBEDTLS=OFF ^
-DCURL_USE_PKGCONFIG=OFF ^
-DCURL_USE_RUSTLS=OFF ^
-DCURL_WERROR=OFF ^
-DCURL_WINDOWS_SSPI=CURL_USE_SCHANNEL ^
-DCURL_ZLIB=ON ^
-DCURL_ZSTD=ON ^
-DENABLE_CURL_MANUAL=OFF ^
-DENABLE_DEBUG=OFF ^
-DENABLE_IPV6=ON ^
-DENABLE_THREADED_RESOLVER=OFF ^
-DENABLE_UNICODE=ON ^
-DENABLE_UNIX_SOCKETS=ON ^
-DHTTP_ONLY=OFF ^
-DPICKY_COMPILER=OFF ^
-DUSE_ECH=OFF ^
-DUSE_HTTPSRR=ON ^
-DUSE_LIBIDN2=OFF ^
-DUSE_NGHTTP2=ON ^
-DUSE_NGTCP2=OFF ^
-DUSE_QUICHE=OFF ^
-DUSE_SSLS_EXPORT=ON ^
-DUSE_WIN32_IDN=ON ^
-DUSE_WIN32_LDAP=ON

if NOT "%ARG_CMOPTS%"=="1" (
REM static build for mod_md with backend schannel only. 
	REM disabled: LIBSSH2 ARES OPENSSL CURL_EXE SHARED_LIBS BROTLI
		REM Protocols: -scp -sftp
		REM Features: -AsynchDNS -brotli -HTTP3 -TLS-SRP
	REM -- Protocols: dict file ftp ftps gopher gophers http https imap imaps ipfs ipns ldap ldaps mqtt pop3 pop3s rtsp smb smbs smtp smtps telnet tftp ws wss
	REM -- Features: alt-svc HSTS HTTP2 HTTPS-proxy HTTPSRR IDN IPv6 Kerberos Largefile libz NTLM SPNEGO SSL SSLS-EXPORT SSPI threadsafe Unicode UnixSockets zstd
	REM -- Enabled SSL backends: Schannel
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% %CURL_CMAKE_COMMON% ^
-DBUILD_CURL_EXE=OFF ^
-DBUILD_SHARED_LIBS=OFF ^
-DBUILD_STATIC_LIBS=ON ^
-DCURL_BROTLI=OFF ^
-DCURL_DISABLE_INSTALL=ON ^
-DCURL_ENABLE_NTLM=OFF ^
-DCURL_ENABLE_SMB=OFF ^
-DCURL_USE_LIBSSH2=OFF ^
-DCURL_USE_OPENSSL=OFF ^
-DCURL_USE_SCHANNEL=ON ^
-DENABLE_ARES=OFF ^
-DLIBCURL_OUTPUT_NAME=%LIBCURL_STATIC_NAME% ^
-DUSE_PROXY_HTTP3=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash --login -c '%CYGPATH_UTILS%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"'
sed -i -E 's/TARGET_COMPILE_PDB.*/TARGET_COMPILE_PDB = lib\\\\%LIBCURL_STATIC_NAME%\.pdb/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% %LIBCURL_STATIC_NAME%.lib
for %%E in (lib pdb) do (call %PATH_UTILS%\fileutils cp %PATH_BUILD%\%1\lib\%LIBCURL_STATIC_NAME%.%%E %PATH_INSTALL%\%DIR_LIB_STATIC%\*)
)

REM CURL_USE_SCHANNEL - MultiSSL cannot be enabled with HTTP/3 and vice versa
REM ENABLE_THREADED_RESOLVER must be OFF cf. https://github.com/curl/curl/issues/16379
REM	-- Protocols: dict file ftp ftps gopher gophers http https imap imaps ipfs ipns ldap ldaps mqtt pop3 pop3s rtsp scp sftp smb smbs smtp smtps telnet tftp ws wss
REM	-- Features: alt-svc AsynchDNS brotli HSTS HTTP2 HTTP3 HTTPS-proxy HTTPSRR IDN IPv6 Kerberos Largefile libz NTLM SPNEGO SSL SSLS-EXPORT SSPI threadsafe TLS-SRP Unicode UnixSockets zstd
REM	-- Enabled SSL backends: OpenSSL v3+
if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% %CURL_CMAKE_COMMON% ^
-DBUILD_CURL_EXE=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_STATIC_LIBS=OFF ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCURL_BROTLI=ON ^
-DCURL_DISABLE_INSTALL=OFF ^
-DCURL_ENABLE_NTLM=ON ^
-DCURL_ENABLE_SMB=ON ^
-DCURL_USE_LIBSSH2=ON ^
-DCURL_USE_OPENSSL=ON ^
-DCURL_USE_SCHANNEL=OFF ^
-DENABLE_ARES=ON ^
-DIMPORT_LIB_SUFFIX= ^
-DLIBCURL_OUTPUT_NAME=libcurl ^
-DUSE_NGTCP2=ON ^
-DUSE_PROXY_HTTP3=ON ^
-DCURL_LIBCURL_SOVERSION=OFF ^
-DCURL_LIBCURL_VERSIONED_SYMBOLS=OFF ^
-DCURL_COMPLETION_FISH=OFF ^
-DCURL_COMPLETION_ZSH=OFF ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash --login -c '%CYGPATH_UTILS%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"'
%NINJA% install

call %PATH_UTILS%\fileutils cp %PATH_BUILD%\%1\lib\libcurl.pdb %PATH_INSTALL%\bin\*
call %PATH_UTILS%\fileutils cp %PATH_BUILD%\%1\src\curl.pdb %PATH_INSTALL%\bin\*

for %%E in (libcurl.dll curl.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%E "%CURL_DESC%")

REM curl https://curl.se/ca/cacert.pem -o %PATH_INSTALL%\bin\curl-ca-bundle.crt
cd /D %PATH_INSTALL%\bin
call perl %PATH_SRC%\%1\scripts\mk-ca-bundle.pl curl-ca-bundle.crt
for %%E in (certdata.txt curl-config wcurl) do (call %PATH_UTILS%\fileutils rm %PATH_INSTALL%\bin\%%E)
if %LOCAL_COPY% == 1 if %LOCAL_COPY_AVX_ECHO% == %AVXECHO%  if %LOCAL_COPY_MSVC_VER% == %MSVC_VER% (call %PATH_UTILS%\fileutils cp %PATH_INSTALL%\bin\curl-ca-bundle.crt %LOCAL_PATH_CURLCA%\*)