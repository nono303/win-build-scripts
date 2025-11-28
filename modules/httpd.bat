@echo off
set mod_suffix=.so

	REM ~~~~~~~~~~~ external modules
if NOT "%2"=="svn" (
	for %%M in (mod_maxminddb mod_fcgid mod_h2 mod_md mod_wku_bt mod_h264_streaming mod_qos mod_evasive mod_zstd) do (call %PATH_MODULES_COMMON%\init.bat %%M)
	if not exist %PATH_SRC%\mod_evasive\mod_evasive.c mklink /h %PATH_SRC%\mod_evasive\mod_evasive.c %PATH_SRC%\mod_evasive\mod_evasive24win.c
)

call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx
if "%2"=="svn" (sed -i 's/mod_dav_install_lib 0/mod_dav_install_lib 1/g' %CYGPATH_SRC%/%1/CMakeLists.txt)
set HTTPD_VERSION=%SCM_TAG%

	REM EXTRA_INCLUDES for patched /support/ab.c(192): include: 'ms/applink.c'
set CMAKE_HTTPD_COMMON=%CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL:\=/% ^
	-DINSTALL_PDB=ON ^
	-DINSTALL_MANUAL=OFF ^
	-DEXTRA_INCLUDES=%PATH_SRC:\=/%/openssl
if "%2"=="svn" (
	cmake %CMAKE_HTTPD_COMMON% ^
	-DENABLE_MODULES=O ^
	%PATH_SRC%\%1
) else (
	cmake %CMAKE_HTTPD_COMMON% ^
	-DENABLE_MODULES=A ^
	-DLIBXML2_ICONV_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
	-DLIBXML2_ICONV_LIBRARIES=%PATH_INSTALL:\=/%/lib/libiconv.lib ^
	-DMAXMIND_LIBRARIES=%PATH_INSTALL:\=/%/lib/maxminddb.lib ^
	-DZSTD_LIBRARIES=%PATH_INSTALL:\=/%/lib/libzstd.lib ^
	-DCURL_LIBRARIES=%PATH_INSTALL:\=/%/%DIR_LIB_STATIC%/%LIBCURL_STATIC_NAME%.lib ^
	%PATH_SRC%\%1
)

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

	REM delete unused exp in /lib
rm -fv %PATH_INSTALL:\=/%/lib/*.exp

for %%X in (ab.exe abs.exe ApacheMonitor.exe htcacheclean.exe htdbm.exe htdigest.exe htpasswd.exe httpd.exe httxt2dbm.exe libhttpd.dll logresolve.exe rotatelogs.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)
for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\modules\*%mod_suffix% /b') do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\modules\%%G)

	REM ~~~~~~~~~~~ external modules
if NOT "%2"=="svn" (
	for %%X in (mod_maxminddb mod_fcgid mod_h264_streaming mod_md mod_qos mod_evasive mod_zstd mod_bikeshed) do (
		call %PATH_MODULES_COMMON%\init.bat %%X varonly
		call do_php %PATH_UTILS%\sub\version.php %%X %PATH_INSTALL%\modules\%%X%mod_suffix% "httpd:%HTTPD_VERSION%"
	)
	call %PATH_MODULES_COMMON%\init.bat mod_h2 varonly
	for %%X in (mod_http2 mod_proxy_http2) do (call do_php %PATH_UTILS%\sub\version.php mod_h2 %PATH_INSTALL%\modules\%%X%mod_suffix% "httpd:%HTTPD_VERSION%")
	call %PATH_MODULES_COMMON%\init.bat mod_wku_bt varonly
	for %%X in (mod_backtrace mod_whatkilledus) do (call do_php %PATH_UTILS%\sub\version.php mod_wku_bt %PATH_INSTALL%\modules\%%X%mod_suffix% "httpd:%HTTPD_VERSION%")
)