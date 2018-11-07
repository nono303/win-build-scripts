REM rmdir /S /Q C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\build%outdir%\%BUILDDIR%
mkdir C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\build%outdir%\%BUILDDIR%

cd /d C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\php-src
call buildconf
call configure --with-mp=8 --enable-object-out-dir=../build%outdir%/ --disable-embed --disable-phpdbgs --disable-phpdbg --disable-cli-win32 --disable-test-ini --disable-debug --disable-debug-pack --disable-ipv6 --disable-phpdbg-webhelper --disable-crt-debug --disable-security-flags --without-enchant --without-imap --without-snmp --without-xmlrpc --without-xsl --without-gmp --without-wddx --without-libwebp --without-interbase --without-ldap --without-oci8 --without-pgsql --without-uncritical-warn-choke --enable-mysql-xdevapi=shared --with-boost=C:\php72-sdk\phpmaster\deps-boost\ --with-protobuf=C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\deps\ --enable-sockets --enable-mbstring --enable-exif --enable-memcache=shared --enable-pdo --enable-opcache --enable-soap --enable-fileinfo --enable-com-dotnet --enable-fd-setsize=2048 --enable-sanitizer --enable-intl --enable-phar-native-ssl --without-analyzer --with-curl --with-gd --with-tidy --with-openssl --with-mysqli --with-pdo-mysql --with-bz2 --with-sqlite3 --with-pdo-sqlite --with-extra-includes="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Include\um";"C:\Program Files (x86)\Windows Kits\10\Include\10.0.17134.0\um" --with-extra-libs="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Lib\um\%PHP_SDK_ARCH%";"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.17134.0\um\%PHP_SDK_ARCH%" --with-xdebug=shared %ZTS%
if %LTCG% == 1 (
	sed -i 's/LDFLAGS=\/nologo/LDFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/ARFLAGS=\/nologo/ARFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GL \/GS- \/Oy- \/w%SED_AVX%/g' /cygdrive/c/src/php-src/Makefile
) else (
	sed -i 's/LDFLAGS=\/nologo/LDFLAGS=\/nologo \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/ARFLAGS=\/nologo/ARFLAGS=\/nologo \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GS- \/Oy- \/w%SED_AVX%/g' /cygdrive/c/src/php-src/Makefile
)
sed -i 's/ \/W3 / /g' /cygdrive/c/src/php-src/Makefile
sed -i 's/ \/wd4996 / /g' /cygdrive/c/src/php-src/Makefile
nmake %NMAKE_OPTS%