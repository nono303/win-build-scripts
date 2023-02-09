@echo off 

if exist %PATH_INSTALL_OSSL% rmdir /S /Q %PATH_INSTALL_OSSL%
mkdir %PATH_INSTALL_OSSL%

call %PATH_MODULES_COMMON%\init.bat %OPENSSL_SCM%
	REM https://wiki.openssl.org/index.php/Compilation_and_Installation
	REM no-deprecated / -DOPENSSL_NO_DEPRECATED_3_0 (https://github.com/openssl/openssl/pull/13866) : failed for libssh2 / apr

	REM !! --with-zlib-lib require the full path or name in PATH of zlib DLL without dll extension !!
perl Configure %perlbuild% ^
shared no-unit-test no-external-tests no-ssl3 no-weak-ssl-ciphers no-tests zlib zlib-dynamic enable-tls1_3 ^
-threads ^
--prefix=%PATH_INSTALL_OSSL% ^
--with-zlib-include=%PATH_INSTALL:\=/%/include ^
--with-zlib-lib=zlib ^
--openssldir=%PATH_INSTALL_OSSL%\conf ^
-DOPENSSL_USE_IPV6=1 ^
-DOPENSSL_NO_HEARTBEATS ^
-L"/OPT:ICF,REF /LTCG " +"/w /O2 /GL /MD /Zi /MP%NUMBER_OF_PROCESSORS% %AVX%"

REM perl configdata.pm --dump

sed -i 's/\/W3 \/wd4090 \/nologo \/O2 -threads +/\/nologo /g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile
sed -i 's/\/nologo \/debug -L/\/nologo \/debug /g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile
sed -i 's/ARFLAGS= \/nologo/ARFLAGS= \/nologo \/LTCG/g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile

if %ARCH% == x64 (set sslarch=-x64)
if %ARCH% == x86 (set sslarch=)

	REM install_sw > no docs
nmake %NMAKE_OPTS% install_sw

 	REM move & version for engines - https://github.com/openssl/openssl/issues/7185
for %%M in (engines-%OPENSSL_SUF% ossl-modules) do (
	for /f "tokens=*" %%G in ('dir %PATH_INSTALL_OSSL%\lib\%%M\*.dll /b') do (
		call do_php %PATH_UTILS%\sub\version.php %OPENSSL_SCM% %PATH_INSTALL_OSSL%\lib\%%M\%%G
	)
	if not exist %PATH_INSTALL_OSSL%\bin\%%M\. mkdir %PATH_INSTALL_OSSL%\bin\%%M
	move /y %PATH_INSTALL_OSSL%\lib\%%M\*.* %PATH_INSTALL_OSSL%\bin\%%M
	rmdir /S /Q %PATH_INSTALL_OSSL%\lib\%%M
)

for %%M in (libcrypto-%OPENSSL_SUF%%sslarch%.dll libssl-%OPENSSL_SUF%%sslarch%.dll openssl.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %OPENSSL_SCM% %PATH_INSTALL_OSSL%\bin\%%M
)
DEL /Q /F %PATH_INSTALL_OSSL%\bin\c_rehash.pl