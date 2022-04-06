@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DENABLE_WERROR=OFF ^
-DENABLE_DEBUG=OFF ^
-DENABLE_ASAN=OFF ^
-DENABLE_GNUTLS=OFF ^
-DENABLE_OPENSSL=ON ^
-DENABLE_BORINGSSL=OFF ^
-DLIBEV_LIBRARY=%PATH_INSTALL%\lib\libev.lib ^
-DLIBNGHTTP3_LIBRARY=%PATH_INSTALL%\lib\nghttp3.lib ^
-DLIBNGHTTP3_INCLUDE_DIR=%PATH_INSTALL%\include ^
-DENABLE_STATIC_LIB=OFF ^
-DENABLE_SHARED_LIB=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% lib/install crypto/install

for %%X in (lib\ngtcp2.pdb crypto\openssl\ngtcp2_crypto_openssl.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%X %PATH_INSTALL%\bin\*)
for %%X in (ngtcp2 ngtcp2_crypto_openssl) do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X.dll
)