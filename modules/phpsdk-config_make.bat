	REM https://stackoverflow.com/questions/9102422/windows-batch-set-inside-if-not-working
if %PHPVER% == 7.2 (
	set phpveropts=	--without-wddx ^
			--without-interbase
	set native-intrinsics=0
)
if %PHPVER% == 7.3 (
	set phpveropts=	--enable-native-intrinsics=sse,sse2%intrinsics% ^
			--without-wddx ^
			--without-interbase
	set native-intrinsics=1
)
if %PHPVER%== 7.4 (
	set phpveropts=	--enable-native-intrinsics=sse,sse2%intrinsics% ^
			--with-mhash ^
			--with-ffi
	set native-intrinsics=1
)

set PHP_COMMON_CONFIGURE=^
	--disable-cli-win32 ^
	--disable-crt-debug ^
	--disable-debug ^
	--disable-debug-pack ^
	--disable-embed ^
	--disable-ipv6 ^
	--disable-phpdbg ^
	--disable-phpdbg-webhelper ^
	--disable-phpdbgs ^
	--disable-security-flags ^
	--disable-test-ini ^
	--enable-fd-setsize=2048 ^
	--enable-memcache=shared ^
	--enable-object-out-dir=../build/ ^
	--enable-sanitizer ^
	--without-analyzer ^
	--without-enchant ^
	--without-imap ^
	--without-snmp ^
	--without-xmlrpc ^
	--without-xsl ^
	--without-gmp ^
	--without-libwebp ^
	--without-ldap ^
	--without-oci8 ^
	--without-pgsql ^
	--without-uncritical-warn-choke ^
	--with-extra-includes="%PHP_CURL%\include";"%PATH_INSTALL%\include";"%PATH_INSTALL%\include\sqlite3";"%PATH_INSTALL%\include\libxml2" ^
	--with-extra-libs="%PHP_CURL%\lib";"%PATH_INSTALL%\lib" ^
	--with-mp=%NUMBER_OF_PROCESSORS%

if %PHPVER% == 7.4 (
	call configure %PHP_COMMON_CONFIGURE% ^
	--with-toolset=vs ^
	--with-cygwin=%PATH_BIN_CYGWIN% ^
	--with-php-build=..\deps ^
	--enable-brotli=shared ^
	--enable-com-dotnet ^
	--enable-exif ^
	--enable-fileinfo ^
	--enable-ftp ^
	--enable-intl ^
	--enable-mbstring ^
	--enable-opcache ^
	--enable-pdo ^
	--enable-phar-native-ssl ^
	--enable-soap ^
	--enable-sockets ^
	--with-bz2 ^
	--with-curl=shared ^
	--with-iconv=%PATH_INSTALL% ^
	--with-mysqli ^
	--with-openssl ^
	--with-pdo-mysql ^
	--with-pdo-sqlite ^
	--with-sqlite3 ^
	--with-tidy=shared ^
	--with-xdebug=shared ^
	--with-xdiff=shared ^
	%ZTS% %phpveropts%
) else (
	call configure %PHP_COMMON_CONFIGURE% ^
	--without-interbase ^
	%ZTS% %phpveropts%
)
sed -i -E 's/(..)FLAGS=\/nologo/\1FLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib \/NODEFAULTLIB:MSVCRTD.lib \/OPT:ICF/g' %CYGPATH_SRC%/php-src/Makefile
sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GL \/GS- \/Oy- %AVXSED%/g' %CYGPATH_SRC%/php-src/Makefile
sed -i 's/ \/W3 / \/w /g' %CYGPATH_SRC%/php-src/Makefile

nmake %NMAKE_OPTS%

for /f "tokens=*" %%G in ('dir %PHP_BUILD_DIR%\*.exe /s/b') do (xcopy /C /F /Y %%~pG%%~nG.exe %PHP_OUTDIR%\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%\%%~nG.exe)
for /f "tokens=*" %%G in ('dir %PHP_BUILD_DIR%\*.dll /s/b') do (xcopy /C /F /Y %%~pG%%~nG.dll %PHP_OUTDIR%\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%\%%~nG.dll)
	REM copy curl to %PATH_INSTALL%\bin
xcopy /C /F /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\%CURL_LIB_NAME% %PHP_OUTDIR%\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%\*