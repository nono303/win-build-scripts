set TS=0
set LTCG=1

set LOGNAME=C:\php72-sdk\silent-logs\%PHP_SDK_ARCH%_TS-%TS%_LTCG-%LTCG%_%Date:~-4%%Date:~-7,-5%%Date:~-10,-8%-%TIME:~-11,-9%%TIME:~-8,-6%%TIME:~-5,-3%.log

if %TS% == 0 (
	set ZTS=--disable-zts
	set BUILDDIR=Release
)
if %TS% == 1 (
	set BUILDDIR=Release_TS
)
REM ** uniquement sur init
REM phpsdk_buildtree phpmaster
rmdir /S /Q C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\build\%BUILDDIR%
mkdir C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\build\%BUILDDIR%
cd /d C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\php-src
call phpsdk_deps -u -b 7.2 -a %PHP_SDK_ARCH% -d C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\deps -t vc15 >> %LOGNAME% 2>&1
call buildconf >> %LOGNAME% 2>&1
call configure --with-mp=8 --enable-object-out-dir=../build/ --disable-embed --disable-phpdbgs --disable-phpdbg --disable-cli-win32 --disable-test-ini --disable-debug --disable-debug-pack --disable-ipv6 --disable-phpdbg-webhelper --disable-crt-debug --disable-security-flags --without-enchant --without-imap --without-snmp --without-xmlrpc --without-xsl --without-gmp --without-wddx --without-libwebp --without-interbase --without-ldap --without-oci8 --without-pgsql --without-uncritical-warn-choke --enable-sockets --enable-mbstring --enable-exif --enable-memcache=shared --enable-pdo --enable-opcache --enable-soap --enable-fileinfo --enable-com-dotnet --enable-fd-setsize=2048 --enable-sanitizer --enable-intl --without-analyzer --with-curl --with-tidy --with-openssl --with-mysqli --with-pdo-mysql --with-bz2 --with-sqlite3 --with-pdo-sqlite --with-extra-includes="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Include\um";"C:\Program Files (x86)\Windows Kits\10\Include\10.0.17134.0\um" --with-extra-libs="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Lib\um\%PHP_SDK_ARCH%";"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.17134.0\um\%PHP_SDK_ARCH%" --with-xdebug=shared %ZTS% >> %LOGNAME% 2>&1
if %LTCG% == 1 (
	sed -i 's/LDFLAGS=\/nologo/LDFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/ARFLAGS=\/nologo/ARFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GL \/GS- \/Oy- \/w%AVX%/g' /cygdrive/c/src/php-src/Makefile
)
if %LTCG% == 0 (
	sed -i 's/LDFLAGS=\/nologo/LDFLAGS=\/nologo \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/ARFLAGS=\/nologo/ARFLAGS=\/nologo \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GS- \/Oy- \/w%AVX%/g' /cygdrive/c/src/php-src/Makefile
)
sed -i 's/ \/W3 / /g' /cygdrive/c/src/php-src/Makefile
sed -i 's/ \/wd4996 / /g' /cygdrive/c/src/php-src/Makefile
nmake /B /NOLOGO >> %LOGNAME% 2>&1