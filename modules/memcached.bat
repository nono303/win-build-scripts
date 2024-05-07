@echo off && call %PATH_MODULES_COMMON%\init.bat %1
	REM 2024-02-29: libevent-2.0 discontinued
set EVENT_VER=2.1

call %PATH_BIN_CYGWIN%\bash --login -c '%CYGPATH_MODULES%/%1.sh %CYGPATH_SRC%/%1 %CYGPATH_MODULES% %PATH_RELEASE_MEMCACHED%/libevent-%EVENT_VER% %AVX_GCC% %AVXB% %CUR_DEBUG%'
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -m %PATH_RELEASE_MEMCACHED%`) do (set WINPATH_RELEASE_MEMCACHED=%%F)

for %%X in (memcached%AVXB%.exe memcached%AVXB%-tls.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %1 %WINPATH_RELEASE_MEMCACHED%\libevent-%EVENT_VER%\%ARCH%\%%X memcached %ARCH% %AVXECHO%
)
call do_php %PATH_UTILS%\sub\bininfo.php %WINPATH_RELEASE_MEMCACHED%/libevent-%EVENT_VER%/%ARCH% null recurse checkavx updaterc ext:exe
