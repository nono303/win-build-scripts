@echo off
	REM ensure openssl native is set & build
call quic 0
if not exist %PATH_INSTALL_OSSL%\lib\libssl.lib (
	@echo on
	echo ###########################
	echo # %PATH_INSTALL_OSSL%\lib\libssl.lib not found
	echo # building openssl
	echo ###########################
	@echo off
	call go openssl
)

call %PATH_MODULES_COMMON%\init.bat httpd varonly
set HTTPD_VERSION=%SCM_TAG%

call %PATH_MODULES_COMMON%\init.bat %1 cmake
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\ ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DJANSSON_ROOT_DIR=%PATH_INSTALL:\=/% ^
-DAPACHE_ROOT_DIR=%PATH_INSTALL:\=/% ^
-DAPR_ROOT_DIR=%PATH_INSTALL:\=/% ^
-DAPRUTIL_ROOT_DIR=%PATH_INSTALL:\=/% ^
-DOPENSSL_ROOT_DIR=%PATH_INSTALL_OSSL:\=/% ^
-DCURL_LIBRARY=%PATH_INSTALL:\=/%/lib/libcurl.lib ^
-DCURL_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA%

if not "%PATH_GITHUB_MODMD%"=="" (
	for %%X in (so pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\modules\%1.%%X %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\*)
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\%1.so "httpd:%HTTPD_VERSION%"
)
FOR /F "tokens=* USEBACKQ" %%F in (`dumpbin /DEPENDENTS %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\%1.so ^| grep crypto`) do (set MD_CRYPTO=%%F)

if ARCH==x64 (if not %MD_CRYPTO%==libcrypto-3-x64.dll (echo !! ERROR mo_md depends on '%MD_CRYPTO%'))
if ARCH==x86 (if not %MD_CRYPTO%==libcrypto-3.dll     (echo !! ERROR mo_md depends on '%MD_CRYPTO%'))

echo ^>^>^> go bininfo %PATH_GITHUB_MODMD% recurse checkavx ^> %PATH_GITHUB_MODMD%\bininfo.txt