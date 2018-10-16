cd /D C:\httpd-sdk\src\openssl
REM https://wiki.openssl.org/index.php/Compilation_and_Installation#Configure_Options
perl Configure %perlbuild% --prefix=C:\httpd-sdk\install --openssldir=C:\httpd-sdk\install\conf --with-zlib-include=C:/httpd-sdk/install/include --with-zlib-lib=C:/httpd-sdk/install/lib/zlib.lib -no-unit-test -no-external-tests -no-ssl3 -no-weak-ssl-ciphers -no-tests -threads -DOPENSSL_USE_IPV6=0 -DOPENSSL_NO_HEARTBEATS -L"/OPT:ICF /LTCG" +"/GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox %AVX%"
sed -i 's/\/O2 -threads +/\/wd4267 \/wd4244 /g' /cygdrive/c/src/openssl/makefile
sed -i 's/\/nologo \/debug -L/\/nologo \/debug /g' /cygdrive/c/src/openssl/makefile
sed -i 's/ARFLAGS= \/nologo/ARFLAGS= \/nologo \/LTCG/g' /cygdrive/c/src/openssl/makefile
nmake %NMAKE_OPTS% clean install_sw
if %perlbuild% == VC-WIN64A-masm (
	move /Y C:\httpd-sdk\install\bin\libcrypto-1_1.dll C:\httpd-sdk\install\bin\libcrypto-1_1-x64.dll
	move /Y C:\httpd-sdk\install\bin\libcrypto-1_1.pdb C:\httpd-sdk\install\bin\libcrypto-1_1-x64.pdb
	move /Y C:\httpd-sdk\install\bin\libssl-1_1.dll C:\httpd-sdk\install\bin\libssl-1_1-x64.dll
	move /Y C:\httpd-sdk\install\bin\libssl-1_1.pdb C:\httpd-sdk\install\bin\libssl-1_1-x64.pdb
)
cd /D C:\httpd-sdk\modules_bat