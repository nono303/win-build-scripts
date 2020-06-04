call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DENABLE_COMMONCRYPTO=OFF ^
	-DENABLE_GNUTLS=OFF ^
	-DENABLE_MBEDTLS=OFF ^
	-DENABLE_OPENSSL=ON ^
	-DENABLE_WINDOWS_CRYPTO=OFF ^
	-DENABLE_BZIP2=ON ^
	-DENABLE_LZMA=ON ^
	-DBUILD_TOOLS=ON ^
	-DBUILD_REGRESS=OFF ^
	-DBUILD_EXAMPLES=OFF ^
	-DBUILD_DOC=OFF ^
	-DLIBLZMA_INCLUDE_DIR=%PATH_INSTALL%\include ^
	%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"

nmake %NMAKE_OPTS% clean install

for %%D in (zip.dll zipcmp.exe zipmerge.exe ziptool.exe) do (call do_php %PATH_UTILS%\sub\version.php apr-util %PATH_INSTALL%\bin\%%D)