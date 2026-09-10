@echo off && call %PATH_UTILS%\init.bat %1 cmake

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_UNITY_BUILD=1 ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_DOCS=OFF ^
-DBUILD_DOCSONLY=OFF ^
-DBUILD_DOCS_HTML=OFF ^
-DBUILD_DOCS_MAN=OFF ^
-DBUILD_DOCS_MANGZ=OFF ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_TESTING=OFF ^
-DCLIENT_PREFIX=mem ^
-DENABLE_DTRACE=OFF ^
-DENABLE_HASH_FNV64=ON ^
-DENABLE_HASH_HSIEH=OFF ^
-DENABLE_HASH_MURMUR=ON ^
-DENABLE_MEMASLAP=ON ^
-DENABLE_OPENSSL_CRYPTO=ON ^
-DENABLE_SASL=OFF ^
-DCMAKE_DISABLE_FIND_PACKAGE_Backtrace=ON ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash --login -c '%CYGPATH_UTILS%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"'
%NINJA% install

call %PATH_UTILS%\fileutils rm %PATH_INSTALL%\lib\p9y.lib
for %%E in (libhashkit\hashkit libmemcachedprotocol\memcachedprotocol libmemcachedutil\memcachedutil libmemcached\memcached) do (
	call %PATH_UTILS%\fileutils cp %PATH_BUILD%\%1\src\%%E.pdb %PATH_INSTALL%\bin\*
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%~nE.dll
)
for %%E in (bin\memcapable bin\memcat bin\memcp bin\memdump bin\memerror bin\memexist bin\memflush bin\memparse bin\memping bin\memrm bin\memslap bin\memstat bin\memtouch) do (
	call %PATH_UTILS%\fileutils cp %PATH_BUILD%\%1\src\%%E.pdb %PATH_INSTALL%\bin\*
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%~nE.exe
)