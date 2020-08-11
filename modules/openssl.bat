@echo off && call %PATH_MODULES_COMMON%\init.bat %1

	REM https://wiki.openssl.org/index.php/Compilation_and_Installation
	REM no-deprecated : errors with APR
		REM apr_crypto_openssl.obj : error LNK2001: unresolved external symbol 
		REM ERR_load_crypto_strings EVP_cleanup ENGINE_cleanup ERR_free_strings OpenSSL_add_all_algorithms

perl Configure %perlbuild% ^
shared no-unit-test no-external-tests no-ssl3 no-weak-ssl-ciphers no-tests zlib zlib-dynamic ^
-threads zlib-dynamic ^
--prefix=%PATH_INSTALL% ^
--with-zlib-include=%SLASHPATH_INSTALL%/include ^
--openssldir=%PATH_INSTALL%\conf ^
-DOPENSSL_USE_IPV6=1 ^
-DOPENSSL_NO_HEARTBEATS ^
-DOPENSSL_NO_DEPRECATED ^
-L"/OPT:ICF,REF /LTCG /DEBUG" +"/w /O2 /GL /MD /Zi /MP%NUMBER_OF_PROCESSORS% %AVX%"

sed -i 's/\/W3 \/wd4090 \/nologo \/O2 -threads +/\/nologo /g' %CYGPATH_SRC%/%1/makefile
sed -i 's/\/nologo \/debug -L/\/nologo \/debug /g' %CYGPATH_SRC%/%1/makefile
sed -i 's/ARFLAGS= \/nologo/ARFLAGS= \/nologo \/LTCG/g' %CYGPATH_SRC%/%1/makefile

	REM install_sw > no docs
nmake %NMAKE_OPTS% install_sw

for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\lib\engines-1_1\*.dll /b') do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\lib\engines-1_1\%%G)
	REM move & version for engines - https://github.com/openssl/openssl/issues/7185
if not exist %PATH_INSTALL%\bin\engines-1_1\. mkdir %PATH_INSTALL%\bin\engines-1_1
move /y %PATH_INSTALL%\lib\engines-1_1\*.* %PATH_INSTALL%\bin\engines-1_1
rmdir /S /Q %PATH_INSTALL%\lib\engines-1_1