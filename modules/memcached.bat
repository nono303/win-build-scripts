@echo off && call %PATH_MODULES_COMMON%\init.bat %1
for %%X in (32 64) do (call %PATH_ROOT_CYGWIN%%%X\bin\bash --login -c '%CYGPATH_MODULES%/%1.sh %CYGPATH_SRC%/%1 %CYGPATH_MODULES% %PATH_RELEASE_MEMCACHED%/libevent-2.1')
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -m %PATH_RELEASE_MEMCACHED%`) do (set WINPATH_RELEASE_MEMCACHED=%%F)
for /f "tokens=*" %%G in ('dir "%WINPATH_RELEASE_MEMCACHED%\memcached*.exe" /s/b') do (call do_php %PATH_UTILS%\sub\version.php %1 %%G memcached)
call do_php %PATH_UTILS%\sub\bininfo.php %WINPATH_RELEASE_MEMCACHED% null recurse checkavx updaterc ext:exe