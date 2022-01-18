set CURL_SSL_ENGINE=%2
if %CURL_SSL_ENGINE% == winssl (set CURL_SSLCMAKE=-DCURL_USE_OPENSSL=OFF -DCURL_USE_LIBSSH2=OFF -DCURL_USE_SCHANNEL=ON -DCURL_WINDOWS_SSPI=ON)
if %CURL_SSL_ENGINE% == openssl (set CURL_SSLCMAKE=-DCURL_USE_OPENSSL=ON -DCURL_USE_LIBSSH2=ON -DCURL_USE_SCHANNEL=ON -DOPENSSL_ROOT_DIR=%PATH_INSTALL% -DOPENSSL_INCLUDE_DIR=%PATH_INSTALL%\include -DLIBSSH2_LIBRARY=%PATH_INSTALL%\lib\libssh2.lib -DLIBSSH2_INCLUDE_DIR=%PATH_INSTALL%\include  -DCURL_WINDOWS_SSPI=OFF)

echo %CURL_SSLCMAKE%

if exist %PATH_INSTALL%\%FOLDER_RELEASE_CURL%\%CURL_SSL_ENGINE%\. rmdir /S /Q %PATH_INSTALL%\%FOLDER_RELEASE_CURL%\%CURL_SSL_ENGINE%
mkdir %PATH_INSTALL%\%FOLDER_RELEASE_CURL%\%CURL_SSL_ENGINE%

REM 	Waiting openssl QUIC support
REM	-DUSE_NGTCP2=ON ^
REM	-DNGTCP2_INCLUDE_DIR=%PATH_INSTALL%\include ^
REM	-DNGTCP2_LIBRARY=%PATH_INSTALL%\lib\ngtcp2.lib ^
REM	-DNGHTTP3_INCLUDE_DIR=%PATH_INSTALL%\include ^
REM	-DNGHTTP3_LIBRARY=%PATH_INSTALL%\lib\nghttp3.lib ^

cmake ^
	%CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL%\%FOLDER_RELEASE_CURL%\%CURL_SSL_ENGINE% ^
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
	%CURL_SSLCMAKE% ^
	%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\lib\libcurl.pdb %PATH_INSTALL%\%FOLDER_RELEASE_CURL%\%CURL_SSL_ENGINE%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\src\curl.pdb %PATH_INSTALL%\%FOLDER_RELEASE_CURL%\%CURL_SSL_ENGINE%\bin\*

for %%E in (libcurl.dll curl.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\%FOLDER_RELEASE_CURL%\%CURL_SSL_ENGINE%\bin\%%E "ssl_backend: %CURL_SSL_ENGINE%"
)