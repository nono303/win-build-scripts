@echo off 
REM warning: failed to remove NUL: Invalid argument
cd %PATH_SRC%\%1
rm -f NUL
call %PATH_MODULES_COMMON%\init.bat %OPENSSL_SCM%

	REM https://wiki.openssl.org/index.php/Compilation_and_Installation
	REM no-deprecated / -DOPENSSL_NO_DEPRECATED_3_0 (https://github.com/openssl/openssl/pull/13866) : failed for libssh2 / apr
perl Configure %perlbuild% ^
shared no-unit-test no-external-tests no-ssl3 no-weak-ssl-ciphers no-tests zlib zlib-dynamic enable-tls1_3 ^
-threads ^
--prefix=%PATH_INSTALL% ^
--with-zlib-include=%PATH_INSTALL:\=/%/include ^
--openssldir=%PATH_INSTALL%\conf ^
-DOPENSSL_USE_IPV6=1 ^
-DOPENSSL_NO_HEARTBEATS ^
-L"/OPT:ICF,REF /LTCG " +"/w /O2 /GL /MD /Zi /MP%NUMBER_OF_PROCESSORS% %AVX%"
REM perl configdata.pm --dump

sed -i 's/\/W3 \/wd4090 \/nologo \/O2 -threads +/\/nologo /g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile
sed -i 's/\/nologo \/debug -L/\/nologo \/debug /g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile
sed -i 's/ARFLAGS= \/nologo/ARFLAGS= \/nologo \/LTCG/g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile

if %ARCH% == x64 (set sslarch=-x64)
if %ARCH% == x86 (set sslarch=)
sed -i -E 's/LDOUTFLAG(.+)(\\\.+)\.dll/LDOUTFLAG\1\2-%OPENSSL_SUF%%sslarch%\.dll/g' /cygdrive/c/sdk/src/%OPENSSL_SCM%/makefile
sed -i -E 's/--name ([[:alpha:]]+)\\\/--name /g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile
sed -i -E 's/INSTALL_ENGINES="engines..capi.dll" "engines..loader_attic.dll" "engines..padlock.dll"/INSTALL_ENGINES="engines\\\capi-%OPENSSL_SUF%%sslarch%.dll" "engines\\\loader_attic-%OPENSSL_SUF%%sslarch%.dll" "engines\\\padlock-%OPENSSL_SUF%%sslarch%.dll"/g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile
sed -i -E 's/INSTALL_ENGINEPDBS="engines..capi.pdb" "engines..loader_attic.pdb" "engines..padlock.pdb"/INSTALL_ENGINEPDBS="engines\\\capi-%OPENSSL_SUF%%sslarch%.pdb" "engines\\\loader_attic-%OPENSSL_SUF%%sslarch%.pdb" "engines\\\padlock-%OPENSSL_SUF%%sslarch%.pdb"/g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile
sed -i -E 's/INSTALL_MODULES="providers..legacy.dll"/INSTALL_MODULES="providers\\\legacy-%OPENSSL_SUF%%sslarch%.dll"/g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile
sed -i -E 's/INSTALL_MODULEPDBS="providers..legacy.pdb"/INSTALL_MODULEPDBS="providers\\\legacy-%OPENSSL_SUF%%sslarch%.pdb"/g' %CYGPATH_SRC%/%OPENSSL_SCM%/makefile

	REM install_sw > no docs
nmake %NMAKE_OPTS% install_sw

 	REM move & version for engines - https://github.com/openssl/openssl/issues/7185
for %%M in (engines-%OPENSSL_SUF% ossl-modules) do (
	for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\lib\%%M\*.dll /b') do (
		call do_php %PATH_UTILS%\sub\version.php %OPENSSL_SCM% %PATH_INSTALL%\lib\%%M\%%G
	)
	if not exist %PATH_INSTALL%\bin\%%M\. mkdir %PATH_INSTALL%\bin\%%M
	move /y %PATH_INSTALL%\lib\%%M\*.* %PATH_INSTALL%\bin\%%M
	rmdir /S /Q %PATH_INSTALL%\lib\%%M
)

for %%M in (libcrypto-%OPENSSL_SUF%%sslarch%.dll libssl-%OPENSSL_SUF%%sslarch%.dll openssl.exe) do (
	call do_php %PATH_UTILS%\sub\version.php %OPENSSL_SCM% %PATH_INSTALL%\bin\%%M
)