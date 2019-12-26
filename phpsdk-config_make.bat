cd /d C:\php72-sdk\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\php-src
git reset --hard
git clean -fdx
REM Openssl in PHAR
	sed -i 's/libeay32st/libcrypto/g' /cygdrive/c/src/php-src/ext/phar/config.w32

rmdir /S /Q C:\php72-sdk\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\build\%BUILDDIR%\
mkdir C:\php72-sdk\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\build\%BUILDDIR%\
call buildconf

REM patch curl si self-build
	REM mkdir C:\php72-sdk\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\deps\include\curl
	REM mklink /h C:\php72-sdk\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\deps\include\curl\curlver.h C:\httpd-sdk\install\include\curl\curlver.h
	REM sed -i 's/EXTENSION("curl", "interface.c multi.c share.c curl_file.c");/EXTENSION("curl", "interface.c multi.c share.c curl_file.c"); CHECK_LIB("cares.lib", "curl", PHP_CURL);/g' /cygdrive/c/src/php-src/configure.js

REM export config options
	REM call configure --help > c:\configure_%PHPVER%.txt
	REM exit /B

REM BUG batch if : portée variable phpveropts
set native-intrinsics=0
if %PHPVER% == 7.2 (
	set phpveropts= --enable-sanitizer --without-wddx  --without-interbase
)
if %PHPVER% == 7.3 (
	set phpveropts= --with-boost=C:\src\boost --enable-sanitizer --enable-native-intrinsics=sse,sse2%intrinsics% --without-wddx  --without-interbase
	set native-intrinsics=1
)

if NOT %PHPVER% == 7.4 (
	call configure --with-mp=%MTPROC% --enable-object-out-dir=../build/ --without-gd --disable-embed --disable-phpdbgs --disable-phpdbg --disable-cli-win32 --disable-test-ini --disable-debug --disable-debug-pack --disable-ipv6 --disable-phpdbg-webhelper --disable-crt-debug --disable-security-flags --without-enchant --without-imap --without-snmp --without-xmlrpc --without-xsl --without-gmp --without-wddx --without-libwebp --without-interbase --without-ldap --without-oci8 --without-pgsql --without-uncritical-warn-choke --enable-memcache=shared --enable-fd-setsize=2048 --without-analyzer --with-extra-includes="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Include\um";"C:\Program Files (x86)\Windows Kits\10\Include\%WKITVER%\um";"..\depsnono\include";"C:\httpd-sdk\install\include" --with-extra-libs="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Lib\um\%PHP_SDK_ARCH%";"C:\Program Files (x86)\Windows Kits\10\Lib\%WKITVER%\um\%PHP_SDK_ARCH%";"..\depsnono\lib";"C:\httpd-sdk\install\lib" %ZTS% %phpveropts%
)

if %PHPVER% == 7.4 (
	REM *** DISABLED ***
		REM SET DISABLED=--with-zmq=shared --enable-mysql-xdevapi=shared 
	set phpveropts= --enable-sanitizer --enable-native-intrinsics=sse,sse2%intrinsics% --with-mhash --with-ffi
	set native-intrinsics=1

	call configure --with-mp=%MTPROC% --enable-object-out-dir=../build/ --disable-embed --disable-phpdbgs --disable-phpdbg --disable-cli-win32 --disable-test-ini --disable-debug --disable-debug-pack --disable-ipv6 --disable-phpdbg-webhelper --disable-crt-debug --disable-security-flags --without-enchant --without-imap --without-snmp --without-xmlrpc --without-xsl --without-gmp --without-libwebp --without-ldap --without-oci8 --without-pgsql --without-uncritical-warn-choke --with-xdiff=shared --with-boost=C:\src\boost --with-protobuf=..\depsnono\ --with-iconv=C:\httpd-sdk\install --enable-sockets --enable-mbstring --enable-exif --enable-memcache=shared --enable-brotli=shared --enable-pdo --enable-opcache --enable-soap --enable-fileinfo --enable-com-dotnet --enable-fd-setsize=2048 --enable-intl --enable-phar-native-ssl --without-analyzer --with-curl=shared --with-tidy=shared --with-openssl --with-mysqli --with-pdo-mysql --with-bz2 --with-sqlite3 --with-pdo-sqlite --with-extra-includes="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Include\um";"C:\Program Files (x86)\Windows Kits\10\Include\%WKITVER%\um";"..\depsnono\include";"C:\httpd-sdk\install\include" --with-extra-libs="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Lib\um\%PHP_SDK_ARCH%";"C:\Program Files (x86)\Windows Kits\10\Lib\%WKITVER%\um\%PHP_SDK_ARCH%";"..\depsnono\lib";"C:\httpd-sdk\install\lib" --with-xdebug=shared %ZTS% %phpveropts%
)

REM pause

sed -i 's/LDFLAGS=\/nologo/LDFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib  \/NODEFAULTLIB:MSVCRTD.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
sed -i 's/ARFLAGS=\/nologo/ARFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib  \/NODEFAULTLIB:MSVCRTD.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile

if %native-intrinsics% == 1 (
	sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GL \/GS- \/Oy- \/w/g' /cygdrive/c/src/php-src/Makefile
) else (
	sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GL \/GS- \/Oy- \/w %AVXSED%/g' /cygdrive/c/src/php-src/Makefile
)
sed -i 's/ \/W3 / /g' /cygdrive/c/src/php-src/Makefile
sed -i 's/ \/wd4996 / /g' /cygdrive/c/src/php-src/Makefile

nmake %NMAKE_OPTS%

for /f "tokens=*" %%G in ('dir C:\php72-sdk\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\build\%BUILDDIR%\*.exe /s/b') do (
	COPY /Y %%~pG%%~nG.exe D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%\%%~nG.exe
)
for /f "tokens=*" %%G in ('dir C:\php72-sdk\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\build\%BUILDDIR%\*.dll /s/b') do (
	COPY /Y %%~pG%%~nG.dll D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%\%%~nG.dll
)
rmdir /S /Q C:\php72-sdk\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\build\%BUILDDIR%\