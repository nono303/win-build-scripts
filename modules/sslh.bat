@echo off
call %PATH_MODULES_COMMON%\init.bat libconfig
call %PATH_BIN_CYGWIN%\bash --login -c '%CYGPATH_MODULES%/libconfig.sh %CYGPATH_SRC%/libconfig %CYGPATH_MODULES% %AVX_GCC% %CUR_DEBUG%'
xcopy /C /F /Y %PATH_BIN_CYGWIN%\..\usr\local\bin\cygconfig-11.dll %PATH_GITHUB_SSLH%\%ARCH%\%AVXECHO%\cygconfig-11.dll*
call do_php %PATH_UTILS%\sub\version.php libconfig %PATH_GITHUB_SSLH%\%ARCH%\%AVXECHO%\cygconfig-11.dll libconfig %ARCH% %AVXECHO%
set LIBCONFIG_VER=%SCM_TAG%

call %PATH_MODULES_COMMON%\init.bat %1
call %PATH_BIN_CYGWIN%\bash --login -c '%CYGPATH_MODULES%/%1.sh %CYGPATH_SRC%/%1 %AVX_GCC% %CUR_DEBUG%'
for %%A in (echosrv.exe sslh-ev.exe sslh-fork.exe sslh-select.exe) do (
	xcopy /C /F /Y %PATH_SRC%\%1\%%A %PATH_GITHUB_SSLH%\%ARCH%\%AVXECHO%\%%A*
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_GITHUB_SSLH%\%ARCH%\%AVXECHO%\%%A libconfig:%LIBCONFIG_VER% %ARCH% %AVXECHO%
)

if not "%PATH_GITHUB_SSLH%"=="" (
	for %%A in (cygwin1.dll cygev-4.dll cygpcre2-8-0.dll) do (
		xcopy /C /F /Y %PATH_BIN_CYGWIN%\%%A %PATH_GITHUB_SSLH%\%ARCH%\%%A*
	)
)

call do_php %PATH_UTILS%\sub\bininfo.php %PATH_GITHUB_SSLH% null recurse checkavx updaterc ext:exe,dll