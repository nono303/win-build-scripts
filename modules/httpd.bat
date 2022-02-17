@echo off
	REM ~~~~~~~~~~~ external modules
for %%M in (mod_maxminddb mod_fcgid mod_h2 mod_md mod_wku_bt mod_h264_streaming) do (call %PATH_MODULES_COMMON%\init.bat %%M)

call %PATH_MODULES_COMMON%\init.bat %1 cmake
set HTTPD_VERSION=%SCM_TAG%

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DINSTALL_PDB=ON ^
-DINSTALL_MANUAL=OFF ^
-DENABLE_SOCACHE_DC=O ^
-DENABLE_CHARSET_LITE=O ^
-DENABLE_MODULES=i ^
-DLUA_LIBRARIES=%PATH_INSTALL:\=/%/lib/liblua.lib ^
-DLUA_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DLIBXML2_ICONV_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DLIBXML2_ICONV_LIBRARIES=%PATH_INSTALL:\=/%/lib/iconv.lib ^
-DZLIB_LIBRARIES=%PATH_INSTALL:\=/%/lib/zlib.lib ^
-DJANSSON_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DJANSSON_LIBRARIES=%PATH_INSTALL:\=/%/lib/jansson.lib ^
-DMAXMIND_LIBRARIES=%PATH_INSTALL%/lib/libmaxminddb.lib ^
-DOPENSSL_ROOT_DIR=%PATH_INSTALL:\=/% ^
-DCURL_LIBRARY=%PATH_INSTALL:\=/%/lib/libcurl_imp.lib ^
-DCURL_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DEXTRA_INCLUDES=%PATH_SRC:\=/%/openssl ^
%PATH_SRC%\%1 

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
REM mod_wku-bt
sed -i 's/DBIN_NAME=mod_backtrace.so/DBIN_NAME=mod_backtrace.so -DDIAG_BITS_%CYGV%/g' %CYGPATH_BUILD%/%1/build.ninja
sed -i 's/DBIN_NAME=mod_whatkilledus.so/DBIN_NAME=mod_whatkilledus.so -DDIAG_BITS_%CYGV%/g' %CYGPATH_BUILD%/%1/build.ninja
REM \/DBUILDING_H264_STREAMING : http://h264.code-shop.com/trac#H264StreamingModule
sed -i 's/DBIN_NAME=mod_h264_streaming.so/DBIN_NAME=mod_h264_streaming.so -DBUILDING_H264_STREAMING/g' %CYGPATH_BUILD%/%1/build.ninja
REM C:\sdk\src\httpd\support\win32\ApacheMonitor.rc(21) : warning RC4005: 'LONG_NAME' : redefinition
sed -i 's/-DLONG_NAME=ApacheMonitor //g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install

REM delete unused exp in /lib
del /Q /F "%PATH_INSTALL%\lib\*.exp"

	REM Targeting for Windows 10
mt.exe -manifest %PATH_MODULES%\httpd.exe.manifest -outputresource:%PATH_INSTALL%\bin\httpd.exe;1

for %%X in (ab.exe abs.exe ApacheMonitor.exe htcacheclean.exe htdbm.exe htdigest.exe htpasswd.exe httpd.exe httxt2dbm.exe libhttpd.dll logresolve.exe rotatelogs.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X
)
for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\modules\*.so /b') do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\modules\%%G
)

	REM ~~~~~~~~~~~ external modules -   mod_wku_bt 
for %%X in (mod_maxminddb mod_fcgid mod_h264_streaming mod_md) do (
	call %PATH_MODULES_COMMON%\init.bat %%X varonly
	call do_php %PATH_UTILS%\sub\version.php %%X %PATH_INSTALL%\modules\%%X.so "httpd:%HTTPD_VERSION%"
)
call %PATH_MODULES_COMMON%\init.bat mod_h2 varonly
call do_php %PATH_UTILS%\sub\version.php mod_h2 %PATH_INSTALL%\modules\mod_http2.so "httpd:%HTTPD_VERSION%"
call do_php %PATH_UTILS%\sub\version.php mod_h2 %PATH_INSTALL%\modules\mod_proxy_http2.so "httpd:%HTTPD_VERSION%"
call %PATH_MODULES_COMMON%\init.bat mod_wku_bt varonly
call do_php %PATH_UTILS%\sub\version.php mod_wku_bt %PATH_INSTALL%\modules\mod_backtrace.so "httpd:%HTTPD_VERSION%"
call do_php %PATH_UTILS%\sub\version.php mod_wku_bt %PATH_INSTALL%\modules\mod_whatkilledus.so "httpd:%HTTPD_VERSION%"

)
	REM ~~~~~~~~~~~~ mod_md
if not "%PATH_GITHUB_MODMD%"=="" (
	for %%X in (so pdb) do (xcopy /C /F /Y %PATH_INSTALL%\modules\mod_md.%%X %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\*)
		REM ~~~~~~~~~~~ curl for mod_md		dll WinSSL https://github.com/icing/mod_md/issues/14
		REM		2021-02-08		https://www.apachelounge.com/viewtopic.php?p=39826#39826
	xcopy /C /F /Y %PATH_INSTALL%\bin\libcurl.* %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\*
)