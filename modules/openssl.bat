@echo off && call %PATH_MODULES_COMMON%\init.bat %1

	REM https://wiki.openssl.org/index.php/Compilation_and_Installation

	REM https://github.com/openssl/openssl/pull/13866
		REM no-deprecated / -DOPENSSL_NO_DEPRECATED_3_0 / -DOPENSSL_NO_DEPRECATED
	REM deprecated required for libssh2 APR
		REM apr_crypto_openssl.obj : error LNK2001: unresolved external symbol 
		REM ERR_load_crypto_strings EVP_cleanup ENGINE_cleanup ERR_free_strings OpenSSL_add_all_algorithms
	
perl Configure %perlbuild% ^
shared no-unit-test no-external-tests no-ssl3 no-weak-ssl-ciphers no-tests zlib zlib-dynamic ^
-threads ^
--prefix=%PATH_INSTALL% ^
--with-zlib-include=%PATH_INSTALL:\=/%/include ^
--openssldir=%PATH_INSTALL%\conf ^
-DOPENSSL_USE_IPV6=1 ^
-DOPENSSL_NO_HEARTBEATS ^
-L"/OPT:ICF,REF /LTCG " +"/w /O2 /GL /MD /Zi /MP%NUMBER_OF_PROCESSORS% %AVX%"


sed -i 's/\/W3 \/wd4090 \/nologo \/O2 -threads +/\/nologo /g' %CYGPATH_SRC%/%1/makefile
sed -i 's/\/nologo \/debug -L/\/nologo \/debug /g' %CYGPATH_SRC%/%1/makefile
sed -i 's/ARFLAGS= \/nologo/ARFLAGS= \/nologo \/LTCG/g' %CYGPATH_SRC%/%1/makefile

REM if %ARCH% == x64 (set sslarch=-x64)
REM if %ARCH% == x86 (set sslarch=)
REM sed -i -E 's/LDOUTFLAG(.+)(\\\.+)\.dll/LDOUTFLAG\1\2-%OPENSSL_SUF%%sslarch%\.dll/g' /cygdrive/c/sdk/src/openssl/makefile
REM sed -i -E 's/--name ([[:alpha:]]+)\\\/--name /g' %CYGPATH_SRC%/%1/makefile
REM sed -i -E 's/INSTALL_ENGINES="engines..capi.dll" "engines..loader_attic.dll" "engines..padlock.dll"/INSTALL_ENGINES="engines\\\capi-%OPENSSL_SUF%%sslarch%.dll" "engines\\\loader_attic-%OPENSSL_SUF%%sslarch%.dll" "engines\\\padlock-%OPENSSL_SUF%%sslarch%.dll"/g' %CYGPATH_SRC%/%1/makefile
REM sed -i -E 's/INSTALL_ENGINEPDBS="engines..capi.pdb" "engines..loader_attic.pdb" "engines..padlock.pdb"/INSTALL_ENGINEPDBS="engines\\\capi-%OPENSSL_SUF%%sslarch%.pdb" "engines\\\loader_attic-%OPENSSL_SUF%%sslarch%.pdb" "engines\\\padlock-%OPENSSL_SUF%%sslarch%.pdb"/g' %CYGPATH_SRC%/%1/makefile
REM sed -i -E 's/INSTALL_MODULES="providers..legacy.dll"/INSTALL_MODULES="providers\\\legacy-%OPENSSL_SUF%%sslarch%.dll"/g' %CYGPATH_SRC%/%1/makefile
REM sed -i -E 's/INSTALL_MODULEPDBS="providers..legacy.pdb"/INSTALL_MODULEPDBS="providers\\\legacy-%OPENSSL_SUF%%sslarch%.pdb"/g' %CYGPATH_SRC%/%1/makefile

	REM install_sw > no docs
nmake %NMAKE_OPTS% install_sw

 	REM move & version for engines - https://github.com/openssl/openssl/issues/7185
for %%M in (engines-%OPENSSL_SUF% ossl-modules) do (
	for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\lib\%%M\*.dll /b') do (
		call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\lib\%%M\%%G
	)
	if not exist %PATH_INSTALL%\bin\%%M\. mkdir %PATH_INSTALL%\bin\%%M
	move /y %PATH_INSTALL%\lib\%%M\*.* %PATH_INSTALL%\bin\%%M
	rmdir /S /Q %PATH_INSTALL%\lib\%%M
)