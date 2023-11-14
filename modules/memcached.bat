REM 1>	tr606
REM	q: <> \\jupiter8.lan\c$
REM	/cygdrive/q/sdk/batch/modules/memcached.sh /cygdrive/q/sdk/src/memcached /cygdrive/q/sdk/batch/modules /cygdrive/d/github/NONO_memcached/libevent-2.0
REM old>	tb303
REM	q: <> \\jupiter8.vpnu\c$
REM	r: <> \\tr606.vpnu\d$
REM	fecth / checkout / clean / reset D:\git\github.memcached
REM	/cygdrive/q/sdk/batch/modules/memcached.sh /cygdrive/d/git/github.memcached/ /cygdrive/q/sdk/batch/modules /cygdrive/r/github/NONO_memcached/libevent-2.0
REM 2>	jupiter8
@echo off && call %PATH_MODULES_COMMON%\init.bat %1
set SSLH_TARGET_ARCH=64

call %PATH_ROOT_CYGWIN%%SSLH_TARGET_ARCH%\bin\bash --login -c '%CYGPATH_MODULES%/%1.sh %CYGPATH_SRC%/%1 %CYGPATH_MODULES% %PATH_RELEASE_MEMCACHED%/libevent-2.1'
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -m %PATH_RELEASE_MEMCACHED%`) do (set WINPATH_RELEASE_MEMCACHED=%%F)
for %%X in (0 1) do (
	for /f "tokens=*" %%G in ('dir "%WINPATH_RELEASE_MEMCACHED%\libevent-2.%%X\x%SSLH_TARGET_ARCH%\memcached*.exe" /s/b') do (call do_php %PATH_UTILS%\sub\version.php %1 %%G memcached)
	call do_php %PATH_UTILS%\sub\bininfo.php %WINPATH_RELEASE_MEMCACHED%/libevent-2.%%X/x%SSLH_TARGET_ARCH% null recurse checkavx updaterc ext:exe
)
