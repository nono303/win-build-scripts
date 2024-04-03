@echo off
set mod_suffix=.dll
	REM ~~~~~~~~~~~ external modules
for %%M in (mod_maxminddb mod_fcgid mod_h2 mod_md mod_wku_bt mod_h264_streaming mod_qos) do (call %PATH_MODULES_COMMON%\init.bat %%M)

call %PATH_MODULES_COMMON%\init.bat %1 cmake
set HTTPD_VERSION=%SCM_TAG%
set CMAKE_HTTPD_COMMON=%CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DINSTALL_PDB=ON ^
	-DINSTALL_MANUAL=OFF ^
	-DENABLE_MODULES=O ^
	-DZLIB_LIBRARIES=%PATH_INSTALL:\=/%/lib/zlib.lib ^
	-DOPENSSL_ROOT_DIR=%PATH_INSTALL_OSSL:\=/% ^
	-DEXTRA_INCLUDES=%PATH_SRC:\=/%/%OPENSSL_SCM%
if "%2"=="svn" (
	cmake %CMAKE_HTTPD_COMMON% ^
	-DENABLE_MODULES=O ^	
	%PATH_SRC%\%1
) else (
	cmake %CMAKE_HTTPD_COMMON% ^
	-DENABLE_MODULES=A ^
	-DLUA_LIBRARIES=%PATH_INSTALL:\=/%/lib/liblua.lib ^
	-DLUA_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
	-DLIBXML2_INCLUDE_DIR=%PATH_INSTALL:\=/%/include/libxml2 ^
	-DLIBXML2_LIBRARIES=%PATH_INSTALL:\=/%/lib/libxml2.lib ^
	-DLIBXML2_ICONV_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
	-DLIBXML2_ICONV_LIBRARIES=%PATH_INSTALL:\=/%/lib/libiconv.lib ^
	-DJANSSON_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
	-DJANSSON_LIBRARIES=%PATH_INSTALL:\=/%/lib/jansson.lib ^
	-DMAXMIND_LIBRARIES=%PATH_INSTALL%/lib/maxminddb.lib ^
	%PATH_SRC%\%1
)
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

	REM delete unused exp in /lib
del /Q /F "%PATH_INSTALL%\lib\*.exp"

for %%X in (ab.exe abs.exe ApacheMonitor.exe htcacheclean.exe htdbm.exe htdigest.exe htpasswd.exe httpd.exe httxt2dbm.exe libhttpd.dll logresolve.exe rotatelogs.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)
for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\modules\*%mod_suffix% /b') do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\modules\%%G)

	REM ~~~~~~~~~~~ external modules
if NOT "%2"=="svn" (
	for %%X in (mod_maxminddb mod_fcgid mod_h264_streaming mod_md mod_qos) do (
		call %PATH_MODULES_COMMON%\init.bat %%X varonly
		call do_php %PATH_UTILS%\sub\version.php %%X %PATH_INSTALL%\modules\%%X%mod_suffix% "httpd:%HTTPD_VERSION%"
	)
	call %PATH_MODULES_COMMON%\init.bat mod_h2 varonly
	for %%X in (mod_http2 mod_proxy_http2) do (call do_php %PATH_UTILS%\sub\version.php mod_h2 %PATH_INSTALL%\modules\%%X%mod_suffix% "httpd:%HTTPD_VERSION%")
	call %PATH_MODULES_COMMON%\init.bat mod_wku_bt varonly
	for %%X in (mod_backtrace mod_whatkilledus) do (call do_php %PATH_UTILS%\sub\version.php mod_wku_bt %PATH_INSTALL%\modules\%%X%mod_suffix% "httpd:%HTTPD_VERSION%")
)