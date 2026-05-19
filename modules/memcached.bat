@echo off && call %PATH_UTILS%\init.bat %1
set EVENT_VER=2.1

call %PATH_BIN_CYGWIN%\bash --login -c '%CYGPATH_MODULES%/%1.sh %CYGPATH_SRC%/%1 %CYGPATH_MODULES% %PATH_RELEASE_MEMCACHED%/libevent-%EVENT_VER% %AVX_GCC% "%AVXB%" %CUR_DEBUG%'
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -m %PATH_RELEASE_MEMCACHED%`) do (set WINPATH_RELEASE_MEMCACHED=%%F)

for %%X in (memcached%AVXB%.exe memcached%AVXB%-tls.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %WINPATH_RELEASE_MEMCACHED%\libevent-%EVENT_VER%\%ARCH%\%%X libevent:%EVENT_VER%)
if %AVXECHO%==avx2 (call go bininfo %WINPATH_RELEASE_MEMCACHED% recurse checkavx updaterc ext:exe-dll)