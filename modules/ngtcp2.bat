@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DENABLE_WERROR=OFF ^
-DENABLE_DEBUG=OFF ^
-DENABLE_ASAN=OFF ^
-DENABLE_GNUTLS=OFF ^
-DENABLE_OPENSSL=ON ^
-DENABLE_BORINGSSL=OFF ^
-DLIBEV_LIBRARY=%PATH_INSTALL%\lib\libev_static.lib ^
-DENABLE_STATIC_LIB=ON ^
-DENABLE_SHARED_LIB=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% lib/install crypto/install

xcopy /C /F /Y %PATH_BUILD%\%1\lib\CMakeFiles\ngtcp2_static.dir\ngtcp2_static.pdb %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_BUILD%\%1\crypto\openssl\CMakeFiles\ngtcp2_crypto_openssl_static.dir\ngtcp2_crypto_openssl_static.pdb %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_BUILD%\%1\crypto\openssl\ngtcp2_crypto_openssl.pdb %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_BUILD%\%1\lib\ngtcp2.pdb %PATH_INSTALL%\lib\*

for %%X in (ngtcp2 ngtcp2_crypto_openssl) do (
	move /Y %PATH_INSTALL%\lib\%%X.dll %PATH_INSTALL%\bin\%%X.dll
	xcopy /Y %PATH_INSTALL%\lib\%%X.pdb %PATH_INSTALL%\bin\*
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X.dll
)