@echo off
for %%X in (32 64) do (call %PATH_ROOT_CYGWIN%%%X\bin\bash --login -c '%CYGPATH_MODULES%/memcached.sh %CYGPATH_SRC%/memcached %CYGPATH_MODULES% %PATH_RELEASE_MEMCACHED%')
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -m %PATH_RELEASE_MEMCACHED%`) do (set WINPATH_RELEASE_MEMCACHED=%%F)
	REM version
CD /D %PATH_SRC%\%1 
for /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set VERSION=%%F)
for /f "tokens=*" %%G in ('dir "%WINPATH_RELEASE_MEMCACHED%\*.exe" /s/b') do (call %PATH_MODULES_COMMON%\version.bat %%G "%VERSION%")
call do_php %PATH_UTILS%\sub\bininfo.php %WINPATH_RELEASE_MEMCACHED% null recurse