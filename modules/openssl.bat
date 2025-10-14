@echo off
	REM warning: failed to remove NUL: Invalid argument
if exist %PATH_SRC%\%1\NUL rm -fv  /S /Q %PATH_BUILD%\%PATH_SRC%\%1\NUL
call %PATH_MODULES_COMMON%\init.bat %1
	REM https://wiki.openssl.org/index.php/Compilation_and_Installation
	REM no-deprecated / -DOPENSSL_NO_DEPRECATED_3_0 (https://github.com/openssl/openssl/pull/13866) : failed for libssh2 / apr

set CONFIGURE_OPENSSL=--with-brotli-include=%PATH_INSTALL:\=/%/include ^
--with-brotli-lib=brotlicommon ^
--with-zstd-include=%PATH_INSTALL:\=/%/include ^
--with-zstd-lib=libzstd
if "%2"=="svn" (set CONFIGURE_OPENSSL=no-brotli no-zstd)

	REM !! --with-zlib-lib require the full path or name in PATH of zlib DLL without dll extension !!
perl Configure %perlbuild% ^
--prefix=%PATH_INSTALL% ^
--openssldir=%PATH_INSTALL%\conf ^
shared ^
no-asan ^
no-tests ^
no-unit-test ^
no-external-tests ^
no-ssl3 ^
no-weak-ssl-ciphers ^
no-docs ^
threads ^
enable-hqinterop ^
zlib ^
zlib-dynamic ^
--with-zlib-include=%PATH_INSTALL:\=/%/include ^
--with-zlib-lib=zlib ^
-DOPENSSL_USE_IPV6=1 ^
-DOPENSSL_NO_HEARTBEATS=1 ^
-DMD5_ASM=1 ^
-DSHA1_ASM=1 ^
-DRMD160_ASM=1 ^
-DSHA256_ASM=1 ^
-DSHA512_ASM=1 ^
-DAES_ASM=1 ^
%CONFIGURE_OPENSSL%

if NOT "%C_STD_VER%"=="" (
	set __CNFC=\/std:c%C_STD_VER%
	set __CNFCXX=\/std:c++%C_STD_VER%
)
sed -i 's/ARFLAGS= \/nologo/ARFLAGS= \/nologo \/LTCG/g' %CYGPATH_SRC%/%1/makefile
sed -i 's/CFLAGS=\/W3 \/wd4090 \/nologo \/O2/CFLAGS=\/nologo \/DWIN32 \/D_WINDOWS \/w \/MD \/Zi \/Gs0 \/GF \/Gy \/O2 \/Ob3 \/GL \/Gw \/Zc:inline \/Zf \/FS \/MP%NUMBER_OF_PROCESSORS% \/cgthreads8 %__CNFC%%AVX_SED%/g' %CYGPATH_SRC%/%1/makefile
sed -i 's/CNF_CFLAGS=\/Gs0 \/GF \/Gy \/MD/CNF_CFLAGS=/g' %CYGPATH_SRC%/%1/makefile
sed -i 's/CNF_CXXFLAGS=/CNF_CXXFLAGS=\/nologo \/DWIN32 \/D_WINDOWS \/w \/MD \/Zi \/Gs0 \/GF \/Gy \/O2 \/Ob3 \/GL \/Gw \/Zc:inline \/Zf \/FS \/MP%NUMBER_OF_PROCESSORS% \/cgthreads8 %__CNFCXX%%AVX_SED%/g' %CYGPATH_SRC%/%1/makefile
sed -i 's/LDFLAGS=\/nologo \/debug/LDFLAGS=\/nologo \/debug \/OPT:ICF,REF \/LTCG/g' %CYGPATH_SRC%/%1/makefile

REM perl configdata.pm --dump

	REM install_sw > no docs
nmake %NMAKE_OPTS% install_sw
 	REM move & version for engines - https://github.com/openssl/openssl/issues/7185
for %%M in (engines-3 ossl-modules) do (
	for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\lib\%%M\*.dll /b') do (
		call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\lib\%%M\%%G
	)
	if not exist %PATH_INSTALL%\bin\%%M\. mkdir %PATH_INSTALL%\bin\%%M
	move /y %PATH_INSTALL%\lib\%%M\*.* %PATH_INSTALL%\bin\%%M
	rmdir /S /Q %PATH_INSTALL%\lib\%%M
)

for %%M in (libcrypto-3-x64.dll libssl-3-x64.dll openssl.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%M
)
rm -fv %PATH_INSTALL%\bin\c_rehash.pl