@echo off
	REM ensure openssl native is set & build
call quic 0
if not exist %PATH_INSTALL_OSSL%\lib\libssl.lib (call go openssl NOLOG)
if not exist %PATH_INSTALL%\lib\zlib.lib (call go zlib NOLOG)
if not exist %PATH_INSTALL%\lib\libcurl.lib (call go curl mod_md NOLOG)
if not exist %PATH_INSTALL%\lib\jansson.lib (call go jansson NOLOG)
if not exist %PATH_INSTALL%\lib\libapr-1.lib (call go apr NOLOG)
if not exist %PATH_INSTALL%\lib\libhttpd.lib (call go httpd svn NOLOG)

call %PATH_MODULES_COMMON%\init.bat httpd varonly nocxx
set HTTPD_VERSION=%SCM_TAG%

	REM -DCURL_*: https://stackoverflow.com/a/75666113/6343707
call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\ ^
-DJANSSON_ROOT_DIR=%PATH_INSTALL% ^
-DAPACHE_ROOT_DIR=%PATH_INSTALL% ^
-DAPR_ROOT_DIR=%PATH_INSTALL% ^
-DAPRUTIL_ROOT_DIR=%PATH_INSTALL% ^
-DOPENSSL_ROOT_DIR=%PATH_INSTALL_OSSL% ^
-DCURL_LIBRARIES=%PATH_INSTALL%/lib/libcurl.lib ^
-DCURL_INCLUDE_DIR=%PATH_INSTALL%/include ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA%

if not "%PATH_GITHUB_MODMD%"=="" (
	for %%X in (so pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\modules\%1.%%X %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\*)
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\%1.so "httpd:%HTTPD_VERSION%"
)
FOR /F "tokens=* USEBACKQ" %%F in (`dumpbin /DEPENDENTS %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\%1.so ^| grep crypto`) do (set MD_CRYPTO=%%F)
if not %MD_CRYPTO%==libcrypto-3-x64.dll (echo !! ERROR mo_md depends on '%MD_CRYPTO%')
echo ^>^>^> go bininfo %PATH_GITHUB_MODMD% recurse checkavx ^> %PATH_GITHUB_MODMD%\bininfo.txt