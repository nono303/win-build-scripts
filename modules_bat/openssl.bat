cd /D C:\httpd-sdk\src\openssl
perl Configure %perlbuild% --prefix=C:\httpd-sdk\install -threads zlib-dynamic --openssldir=C:\httpd-sdk\install\conf shared no-unit-test no-external-tests no-ssl3 no-weak-ssl-ciphers no-tests zlib zlib-dynamic --with-zlib-include=C:/httpd-sdk/install/include -DOPENSSL_USE_IPV6=1 -DOPENSSL_NO_HEARTBEATS -DOPENSSL_NO_DEPRECATED -L"/OPT:ICF /LTCG" +"/GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP%MTPROC% /LD /MD /Zi /Ox %AVX%"
sed -i 's/\/W3 \/wd4090 \/nologo \/O2 -threads +/\/nologo \/wd4090 \/wd4267 \/wd4244 \/wd4133 \/wd4311 /g' /cygdrive/c/src/openssl/makefile
sed -i 's/\/nologo \/debug -L/\/nologo \/debug /g' /cygdrive/c/src/openssl/makefile
sed -i 's/ARFLAGS= \/nologo/ARFLAGS= \/nologo \/LTCG/g' /cygdrive/c/src/openssl/makefile
nmake %NMAKE_OPTS% clean install_sw
cd /D C:\httpd-sdk\modules_bat