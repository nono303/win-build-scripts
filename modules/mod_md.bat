@echo off
	REM ensure openssl native is set & build
call quic 0
if not exist %PATH_INSTALL_OSSL%\lib\libssl.lib call go openssl

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
	for %%X in (so pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\modules\mod_md.%%X %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\*)
	call do_php %PATH_UTILS%\sub\version.php mod_md %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\mod_md.so
	xcopy /C /F /Y %PATH_INSTALL%\bin\libcurl.* %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\*
)
FOR /F "tokens=* USEBACKQ" %%F in (`dumpbin /DEPENDENTS D:\github\NONO_mod_md\vs17\x64-avx\mod_md.so ^| grep crypto`) do (set MD_CRYPTO=%%F)
if not %MD_CRYPTO%==libcrypto-3-x64.dll (echo !! ERROR mo_md depends on '%MD_CRYPTO%')
