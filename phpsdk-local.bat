REM ** uniquement sur init
REM phpsdk_buildtree phpmaster
REM rmdir /S /Q C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\build
REM mkdir C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\build
cd /d C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\php-src
call phpsdk_deps -u -b 7.2 -a %PHP_SDK_ARCH% -d C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\deps -t vc15
call buildconf
set ZTS=--disable-zts
call configure --with-mp=8 --enable-object-out-dir=../build/ --disable-embed --disable-phpdbgs --disable-phpdbg --disable-cli-win32 --disable-test-ini --disable-debug --disable-debug-pack --disable-ipv6 --disable-phpdbg-webhelper --disable-intl --disable-crt-debug --disable-security-flags --without-enchant --without-imap --without-snmp --without-xmlrpc --without-xsl --without-gmp --without-wddx --without-libwebp --without-interbase --without-ldap --without-oci8 --without-pgsql --without-uncritical-warn-choke --enable-sockets --enable-mbstring --enable-exif --enable-memcache=shared --enable-pdo --enable-opcache --enable-soap --enable-fileinfo --enable-com-dotnet --enable-fd-setsize=2048 --enable-sanitizer --without-analyzer --with-curl --with-tidy --with-openssl --with-mysqli --with-pdo-mysql --with-bz2 --with-sqlite3 --with-pdo-sqlite --with-extra-includes="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Include\um";"C:\Program Files (x86)\Windows Kits\10\Include\10.0.16299.0\um" --with-extra-libs="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Lib\um\%PHP_SDK_ARCH%";"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.16299.0\um\%PHP_SDK_ARCH%" --with-xdebug=shared %ZTS%
pause
sed -i 's/LDFLAGS=\/nologo/LDFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
sed -i 's/ARFLAGS=\/nologo/ARFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
sed -i 's/ \/W3 / /g' /cygdrive/c/src/php-src/Makefile
sed -i 's/ \/wd4996 / /g' /cygdrive/c/src/php-src/Makefile
REM sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GL \/GS- \/Oy- \/w \/arch:AVX/g' /cygdrive/c/src/php-src/Makefile
sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GL \/GS- \/Oy- \/w/g' /cygdrive/c/src/php-src/Makefile
nmake /B /NOLOGO