cd /d %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\php-src
git reset --hard
git clean -fdx
REM Openssl in PHAR
	sed -i 's/libeay32st/libcrypto/g' %CYGPATH_SRC%/php-src/ext/phar/config.w32

rmdir /S /Q %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\build\%BUILDDIR%\
mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\build\%BUILDDIR%\
call buildconf

REM patch curl si self-build
	REM mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\deps\include\curl
	REM mklink /h %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\deps\include\curl\curlver.h %PATH_INSTALL%\include\curl\curlver.h
	REM sed -i 's/EXTENSION("curl", "interface.c multi.c share.c curl_file.c");/EXTENSION("curl", "interface.c multi.c share.c curl_file.c"); CHECK_LIB("cares.lib", "curl", PHP_CURL);/g' %CYGPATH_SRC%/php-src/configure.js

REM export config options
	call configure --help > %PATH_HTTPD_SDK%\_logs\configure_%PHPGITVER:~4,-1%.txt

REM https://stackoverflow.com/questions/9102422/windows-batch-set-inside-if-not-working
if %PHPVER% == 7.2 (
	SET phpveropts=--enable-sanitizer --without-wddx  --without-interbase
	SET native-intrinsics=0
)
if %PHPVER% == 7.3 (
	SET phpveropts=--enable-sanitizer --enable-native-intrinsics=sse,sse2%intrinsics% --without-wddx  --without-interbase
	SET native-intrinsics=1
)
if %PHPVER%== 7.4 (
	SET phpveropts=--enable-sanitizer --enable-native-intrinsics=sse,sse2%intrinsics% --with-mhash --with-ffi
	SET native-intrinsics=1
)
if %PHPVER% == 7.4 (
	REM *** DISABLED zmq & mysql-xdevapi --with-zmq=shared --enable-mysql-xdevapi=shared --with-boost=%PATH_SRC%\boost --with-protobuf=..\depsnono\
	call configure --with-mp=%MTPROC% --enable-object-out-dir=../build/ --disable-embed --disable-phpdbgs --disable-phpdbg --disable-cli-win32 --disable-test-ini --disable-debug --disable-debug-pack --disable-ipv6 --disable-phpdbg-webhelper --disable-crt-debug --disable-security-flags --without-enchant --without-imap --without-snmp --without-xmlrpc --without-xsl --without-gmp --without-libwebp --without-ldap --without-oci8 --without-pgsql --without-uncritical-warn-choke --with-xdiff=shared --with-iconv=%PATH_INSTALL% --enable-sockets --enable-mbstring --enable-exif --enable-memcache=shared --enable-brotli=shared --enable-pdo --enable-opcache --enable-soap --enable-fileinfo --enable-com-dotnet --enable-fd-setsize=2048 --enable-intl --enable-phar-native-ssl --without-analyzer --with-curl=shared --with-tidy=shared --with-openssl --with-mysqli --with-pdo-mysql --with-bz2 --with-sqlite3 --with-pdo-sqlite --with-extra-includes="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Include\um";"C:\Program Files (x86)\Windows Kits\10\Include\%WKITVER%\um";"..\depsnono\include";"%PATH_INSTALL%\include" --with-extra-libs="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Lib\um\%PHP_SDK_ARCH%";"C:\Program Files (x86)\Windows Kits\10\Lib\%WKITVER%\um\%PHP_SDK_ARCH%";"..\depsnono\lib";"%PATH_INSTALL%\lib" --with-xdebug=shared %ZTS% %phpveropts%
) else (
	call configure --with-mp=%MTPROC% --enable-object-out-dir=../build/ --without-gd --disable-embed --disable-phpdbgs --disable-phpdbg --disable-cli-win32 --disable-test-ini --disable-debug --disable-debug-pack --disable-ipv6 --disable-phpdbg-webhelper --disable-crt-debug --disable-security-flags --without-enchant --without-imap --without-snmp --without-xmlrpc --without-xsl --without-gmp --without-wddx --without-libwebp --without-interbase --without-ldap --without-oci8 --without-pgsql --without-uncritical-warn-choke --enable-memcache=shared --enable-fd-setsize=2048 --without-analyzer --with-extra-includes="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Include\um";"C:\Program Files (x86)\Windows Kits\10\Include\%WKITVER%\um";"..\depsnono\include";"%PATH_INSTALL%\include" --with-extra-libs="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Lib\um\%PHP_SDK_ARCH%";"C:\Program Files (x86)\Windows Kits\10\Lib\%WKITVER%\um\%PHP_SDK_ARCH%";"..\depsnono\lib";"%PATH_INSTALL%\lib" %ZTS% %phpveropts%
)

sed -i 's/LDFLAGS=\/nologo/LDFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib  \/NODEFAULTLIB:MSVCRTD.lib \/OPT:ICF/g' %CYGPATH_SRC%/php-src/Makefile
sed -i 's/ARFLAGS=\/nologo/ARFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib  \/NODEFAULTLIB:MSVCRTD.lib \/OPT:ICF/g' %CYGPATH_SRC%/php-src/Makefile

if %native-intrinsics% == 1 (
	sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GL \/GS- \/Oy- \/w/g' %CYGPATH_SRC%/php-src/Makefile
) else (
	sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GL \/GS- \/Oy- \/w %AVXSED%/g' %CYGPATH_SRC%/php-src/Makefile
)
sed -i 's/ \/W3 / /g' %CYGPATH_SRC%/php-src/Makefile
sed -i 's/ \/wd4996 / /g' %CYGPATH_SRC%/php-src/Makefile

echo destination:	D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%\
nmake %NMAKE_OPTS%

for /f "tokens=*" %%G in ('dir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\build\%BUILDDIR%\*.exe /s/b') do (
	COPY /Y %%~pG%%~nG.exe D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%\%%~nG.exe
)
for /f "tokens=*" %%G in ('dir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\build\%BUILDDIR%\*.dll /s/b') do (
	COPY /Y %%~pG%%~nG.dll D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%\%%~nG.dll
)
rmdir /S /Q %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\build\%BUILDDIR%\