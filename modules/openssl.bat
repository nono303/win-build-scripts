@echo off

if exist %PATH_INSTALL_OSSL% rmdir /S /Q %PATH_INSTALL_OSSL%
mkdir %PATH_INSTALL_OSSL%

	REM warning: failed to remove NUL: Invalid argument
if exist %PATH_SRC%\%1\NUL rm -fv  /S /Q %PATH_BUILD%\%PATH_SRC%\%1\NUL
call %PATH_MODULES_COMMON%\init.bat %OPENSSL_SCM%
	REM https://wiki.openssl.org/index.php/Compilation_and_Installation
	REM no-deprecated / -DOPENSSL_NO_DEPRECATED_3_0 (https://github.com/openssl/openssl/pull/13866) : failed for libssh2 / apr

set CONFIGURE_OPENSSL=--with-brotli-include=%PATH_INSTALL:\=/%/include ^
--with-brotli-lib=brotlicommon ^
--with-zstd-include=%PATH_INSTALL:\=/%/include ^
--with-zstd-lib=zstd
if "%2"=="svn" (set CONFIGURE_OPENSSL=no-brotli no-zstd)

if NOT "%C_STD_VER%"=="" (
	set __CNFC=/std:c%C_STD_VER%
	set __CNFCXX=/std:c++%C_STD_VER%
)
set LDFLAGS=/nologo /debug /OPT:ICF,REF /LTCG 
set CFLAGS=/nologo /w /Zi /Gs0 /GF /Gy /O2 /Ob3 /GL /Gw /Zc:inline /Zf /FS /MP%NUMBER_OF_PROCESSORS% /cgthreads8 %AVX% %__CNFC% 

	REM !! --with-zlib-lib require the full path or name in PATH of zlib DLL without dll extension !!
perl Configure %perlbuild% ^
shared ^
no-tests ^
no-unit-test ^
no-external-tests ^
no-ssl3 ^
no-weak-ssl-ciphers ^
no-docs ^
threads ^
--prefix=%PATH_INSTALL_OSSL% ^
zlib ^
zlib-dynamic ^
--with-zlib-include=%PATH_INSTALL:\=/%/include ^
--with-zlib-lib=zlib ^
--openssldir=%PATH_INSTALL_OSSL%\conf ^
-DOPENSSL_USE_IPV6=1 ^
-DOPENSSL_NO_HEARTBEATS=1 ^
-DMD5_ASM=1 ^
-DSHA1_ASM=1 ^
-DRMD160_ASM=1 ^
-DSHA256_ASM=1 ^
-DSHA512_ASM=1 ^
-DAES_ASM=1 ^
%CONFIGURE_OPENSSL%

	REM set ARFLAGS=/nologo /LTCG 'KO' must be change after configure by sed
sed -i 's/ARFLAGS= \/nologo/ARFLAGS= \/nologo \/LTCG/g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile

REM perl configdata.pm --dump

	REM install_sw > no docs
nmake %NMAKE_OPTS% install_sw

set LDFLAGS=
set CFLAGS=

 	REM move & version for engines - https://github.com/openssl/openssl/issues/7185
for %%M in (engines-%OPENSSL_SUF% ossl-modules) do (
	for /f "tokens=*" %%G in ('dir %PATH_INSTALL_OSSL%\lib\%%M\*.dll /b') do (
		call do_php %PATH_UTILS%\sub\version.php %OPENSSL_SCM% %PATH_INSTALL_OSSL%\lib\%%M\%%G
	)
	if not exist %PATH_INSTALL_OSSL%\bin\%%M\. mkdir %PATH_INSTALL_OSSL%\bin\%%M
	move /y %PATH_INSTALL_OSSL%\lib\%%M\*.* %PATH_INSTALL_OSSL%\bin\%%M
	rmdir /S /Q %PATH_INSTALL_OSSL%\lib\%%M
)

for %%M in (libcrypto-%OPENSSL_SUF%-x64.dll libssl-%OPENSSL_SUF%-x64.dll openssl.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %OPENSSL_SCM% %PATH_INSTALL_OSSL%\bin\%%M
)
rm -fv %PATH_INSTALL_OSSL%\bin\c_rehash.pl