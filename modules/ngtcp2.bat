@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

REM /third-party/urlparse
cd /D %PATH_SRC%\%1
git submodule update --remote --merge
cd /D %PATH_BUILD%\%1

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DENABLE_WERROR=OFF ^
-DENABLE_DEBUG=OFF ^
-DENABLE_LIB_ONLY=ON ^
-DENABLE_ASAN=OFF ^
-DENABLE_GNUTLS=OFF ^
-DENABLE_OPENSSL=ON ^
-DENABLE_BORINGSSL=OFF ^
-DENABLE_PICOTLS=OFF ^
-DENABLE_WOLFSSL=OFF ^
-DENABLE_JEMALLOC=ON ^
-DENABLE_STATIC_LIB=OFF ^
-DENABLE_SHARED_LIB=ON ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% lib/install crypto/install

for %%X in (lib\ngtcp2.pdb crypto\ossl\ngtcp2_crypto_ossl.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%X %PATH_INSTALL%\bin\*)
for %%X in (ngtcp2 ngtcp2_crypto_ossl) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X.dll)