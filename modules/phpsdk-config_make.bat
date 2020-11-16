echo phpsdk-config_make for %PHPVER%
	REM ################# PHP7 #################
set PHP7_COMMON_CONFIGURE=^
	--disable-crt-debug ^
	--without-xmlrpc
if %PHPVER% == 7.1 (
	set phpveropts=	%PHP7_COMMON_CONFIGURE% ^
			--without-wddx ^
			--without-interbase
	set native-intrinsics=0
)
if %PHPVER% == 7.2 (
	set phpveropts=	%PHP7_COMMON_CONFIGURE% ^
			--without-wddx ^
			--without-interbase ^
			--enable-sanitizer
	set native-intrinsics=0
)
if %PHPVER% == 7.3 (
	set phpveropts=	%PHP7_COMMON_CONFIGURE% ^
			--enable-native-intrinsics=sse,sse2%intrinsics% ^
			--without-wddx ^
			--without-interbase ^
			--enable-sanitizer
	set native-intrinsics=1
)
if %PHPVER% == 7.4 (
	set phpveropts=	%PHP7_COMMON_CONFIGURE% ^
			--enable-native-intrinsics=sse,sse2%intrinsics% ^
			--with-mhash ^
			--with-ffi ^
			--enable-sanitizer
	set native-intrinsics=1
)
	REM ################# PHP8 #################
if %PHPVER% == 8.0 (
	set phpveropts=	--enable-native-intrinsics=sse,sse2%intrinsics% ^
			--with-mhash ^
			--with-ffi ^
			--enable-sanitizer
	set native-intrinsics=1
)

set PHP_COMMON_CONFIGURE=^
	--disable-cli-win32 ^
	--disable-debug ^
	--disable-embed ^
	--disable-ipv6 ^
	--disable-phpdbg ^
	--disable-phpdbg-webhelper ^
	--disable-phpdbgs ^
	--disable-security-flags ^
	--disable-test-ini ^
	--enable-debug-pack ^
	--enable-fd-setsize=2048 ^
	--enable-object-out-dir=../build/ ^
	--without-analyzer ^
	--without-enchant ^
	--without-imap ^
	--without-snmp ^
	--without-xsl ^
	--without-gmp ^
	--without-libwebp ^
	--without-ldap ^
	--without-oci8 ^
	--without-pgsql ^
	--without-uncritical-warn-choke ^
	--with-extra-includes="%PHP_CURL%\include";"%PATH_INSTALL%\include";"%PATH_INSTALL%\include\sqlite3";"%PATH_INSTALL%\include\libxml2";"%PATH_INSTALL%\include\freetype2" ^
	--with-extra-libs="%PHP_CURL%\lib";"%PATH_INSTALL%\lib" ^
	--with-mp=%NUMBER_OF_PROCESSORS%

if %PHPVER% == %PHP_FULLBUILD% (
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
	--enable-memcache=shared ^
	--enable-phpdbg ^
	--enable-phpdbgs ^
	%ZTS% %phpveropts%
) else (
	call configure %PHP_COMMON_CONFIGURE% ^
	--disable-bcmath ^
	--disable-brotli ^
	--disable-calendar ^
	--disable-com-dotnet ^
	--disable-ctype ^
	--without-dom ^
	--disable-filter ^
	--without-gd ^
	--disable-hash ^
	--without-iconv ^
	--disable-json ^
	--without-libxml ^
	--without-mysqlnd ^
	--disable-opcache ^
	--disable-phar ^
	--without-simplexml ^
	--disable-tokenizer ^
	--without-xml ^
	--disable-xmlwriter ^
	--disable-xmlreader ^
	--disable-zip ^
	--enable-embed ^
	--enable-memcache=shared ^
	%ZTS% %phpveropts%
)

	REM ARFLAGS
sed -i 's/ARFLAGS=\/nologo/ARFLAGS=\/nologo \/LTCG/g' %CYGPATH_SRC%/php-src/Makefile
	REM LDFLAGS (libcmt.lib : freetype2)
sed -i -E 's/incremental:no/incremental:no \/LTCG \/NODEFAULTLIB:libcmt.lib/g' %CYGPATH_SRC%/php-src/Makefile
	REM CFLAGS
sed -i 's/\/Ox/\/O2 \/GL/g' %CYGPATH_SRC%/php-src/Makefile
	REM no warn
sed -i 's/\/W3/\/w/g' %CYGPATH_SRC%/php-src/Makefile

	REM after sed:
REM LDFLAGS=/nologo /incremental:no /LTCG /NODEFAULTLIB:libcmt.lib /NODEFAULTLIB:MSVCRTD.lib /debug /opt:ref,icf ... 
REM ARFLAGS=/nologo /LTCG ...
REM CFLAGS=/nologo $(BASE_INCLUDES) /D _WINDOWS /D WINDOWS=1 /D ZEND_WIN32=1 /D PHP_WIN32=1 /D WIN32 /D _MBCS /w /D _USE_MATH_DEFINES /FD /wd4996 /Zc:inline /Gw /Zc:__cplusplus /d2FuncCache1 /Zc:wchar_t /MP16 /Zi /LD /MD /w /O2 /GL /D NDebug /D NDEBUG /D ZEND_WIN32_FORCE_INLINE /GF /D ZEND_DEBUG=0 ... /D FD_SETSIZE=2048 /arch:AVX 

nmake %NMAKE_OPTS%

if exist %PATH_RELEASE_PHP%\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%\. rmdir /S /Q %PATH_RELEASE_PHP%\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%
mkdir %PATH_RELEASE_PHP%\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%

for %%A in (exe dll) do (
	for /f "tokens=*" %%G in ('dir %PHP_BUILD_DIR%\php*.%%A /s/b') do (
		for %%E in (%%A pdb) do (
			xcopy /C /F /Y %%~pG%%~nG.%%E %PATH_RELEASE_PHP%\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%\*
		)
	)
)

	REM copy curl to %PATH_INSTALL%\bin
xcopy /C /F /Y %PHP_CURL%\bin\libcurl.* %PATH_RELEASE_PHP%\%MSVC_DEPS%-%PHP_SDK_ARCH%%outdirphp%-%TSNTS%\*
	REM php_memcache verpatch
set MEMCACHEVERPATCH=c:\sdk\softs\verpatch.exe %PATH_RELEASE_PHP%\%MSVC_DEPS%-%PHP_SDK_ARCH%%AVXB%-%TSNTS%\php_memcache.dll /high %PECLMEMCACHEVERSION%-%PECLMEMCACHEGITCOMMIT% /pv %PHPVER% /rpdb /s desc "%PECLMEMCACHEGITBRANCH% - %PECLMEMCACHEGITCOMMIT%%PECLMEMCACHEPATCHVERSION% (%PECLMEMCACHEGITDATE%)" /s product "pecl-memcache %PHP_SDK_ARCH%%AVXB% %TSNTS% [%MSVC_DEPS%]" /s OriginalFilename "php_memcache.dll" /s InternalName "php_memcache.dll" /s LegalCopyright "https://github.com/nono303/PHP-memcache-dll" /s LegalTrademarks "https://github.com/websupport-sk/pecl-memcache"
echo %MEMCACHEVERPATCH%
call %MEMCACHEVERPATCH%
	REM php_memcache for github
if not "%PATH_GITHUB_PHPMEMCACHE%"=="" (for %%A in (pdb dll) do (xcopy /C /F /Y %PATH_RELEASE_PHP%\%MSVC_DEPS%-%PHP_SDK_ARCH%%AVXB%-%TSNTS%\php_memcache.%%A %PATH_GITHUB_PHPMEMCACHE%\%MSVC_DEPS%\%PHP_SDK_ARCH%\%TSNTS%%AVXDIR%\php-%PHPVER%.x_memcache.%%A*))

if exist %PHP_BUILD_DIR%\. rmdir /S /Q %PHP_BUILD_DIR%
mkdir %PHP_BUILD_DIR%