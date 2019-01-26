cd /d C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\php-src
git reset --hard
mkdir C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\build\%BUILDDIR%\
call buildconf
call configure --with-mp=8 --enable-object-out-dir=../build/ --disable-embed --disable-phpdbgs --disable-phpdbg --disable-cli-win32 --disable-test-ini --disable-debug --disable-debug-pack --disable-ipv6 --disable-phpdbg-webhelper --disable-crt-debug --disable-security-flags --without-enchant --without-imap --without-snmp --without-xmlrpc --without-xsl --without-gmp --without-wddx --without-libwebp --without-interbase --without-ldap --without-oci8 --without-pgsql --without-uncritical-warn-choke --enable-mysql-xdevapi=shared --with-xdiff=shared --with-boost=C:/src/boost --with-protobuf=C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\deps\ --enable-sockets --enable-mbstring --enable-exif --enable-memcache=shared --enable-pdo --enable-opcache --enable-soap --enable-fileinfo --enable-com-dotnet --enable-fd-setsize=2048 --enable-sanitizer --enable-intl --enable-phar-native-ssl --without-analyzer --with-curl --with-tidy=shared --with-openssl --with-mysqli --with-pdo-mysql --with-bz2 --with-sqlite3 --with-pdo-sqlite --with-extra-includes="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Include\um";"C:\Program Files (x86)\Windows Kits\10\Include\%WKITVER%\um";"C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\depsnono\include" --with-extra-libs="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Lib\um\%PHP_SDK_ARCH%";"C:\Program Files (x86)\Windows Kits\10\Lib\%WKITVER%\um\%PHP_SDK_ARCH%";"C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\depsnono\lib" --with-xdebug=shared %ZTS%
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
for /f "tokens=*" %%G in ('dir C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\build\%BUILDDIR%\*.exe /s/b') do (
	COPY /Y %%~pG%%~nG.exe D:\github\NONO_phpwin-perfbuild\vc15-%PHP_SDK_ARCH%%outdir%-%TSNTS%\%%~nG.exe
)
for /f "tokens=*" %%G in ('dir C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\build\%BUILDDIR%\*.dll /s/b') do (
	COPY /Y %%~pG%%~nG.dll D:\github\NONO_phpwin-perfbuild\vc15-%PHP_SDK_ARCH%%outdir%-%TSNTS%\%%~nG.dll
)
rmdir /S /Q C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\build\%BUILDDIR%\