echo phpsdk-config_make for %PHPVER%
cd /D %PHP_SRC_DIR%
	REM ################# PHP7 #################
set PHP7_COMMON_CONFIGURE=^
	--disable-crt-debug ^
	--without-xmlrpc ^
	--without-oci8 ^
if %PHPVER% == 7.1 (
	set phpveropts=	%PHP7_COMMON_CONFIGURE% ^
			--without-wddx ^
			--without-interbase ^
			--disable-phpdbg-webhelper
	set native-intrinsics=0
)
if %PHPVER% == 7.2 (
	set phpveropts=	%PHP7_COMMON_CONFIGURE% ^
			--without-wddx ^
			--without-interbase ^
			--enable-sanitizer ^
			--disable-phpdbg-webhelper
	set native-intrinsics=0
)
if %PHPVER% == 7.3 (
	set phpveropts=	%PHP7_COMMON_CONFIGURE% ^
			--enable-native-intrinsics=sse,sse2%intrinsics% ^
			--without-wddx ^
			--without-interbase ^
			--enable-sanitizer ^
			--disable-phpdbg-webhelper
	set native-intrinsics=1
)
if %PHPVER% == 7.4 (
	set phpveropts=	%PHP7_COMMON_CONFIGURE% ^
			--enable-native-intrinsics=sse,sse2%intrinsics% ^
			--with-mhash ^
			--enable-sanitizer ^
			--disable-phpdbg-webhelper
	set native-intrinsics=1
)
REM ################# PHP8 #################
set PHP8_COMMON_CONFIGURE=^
	--enable-native-intrinsics=sse,sse2%intrinsics% ^
	--with-mhash ^
	--enable-sanitizer
if %PHPVER% == 8.0 (
	set phpveropts=	%PHP8_COMMON_CONFIGURE% ^
			--disable-phpdbg-webhelper ^
			--without-oci8
	set native-intrinsics=1
)
if %PHPVER% == 8.1 (
	set phpveropts=	%PHP8_COMMON_CONFIGURE% ^
			--with-php-build=%PATH_INSTALL% ^
			--without-oci8
	set native-intrinsics=1
)
if %PHPVER% == 8.2 (
	set phpveropts=	%PHP8_COMMON_CONFIGURE% ^
			--with-php-build=%PATH_INSTALL%
	set native-intrinsics=1
)

set PHP_COMMON_CONFIGURE=^
	--disable-cli-win32 ^
	--disable-debug ^
	--disable-embed ^
	--disable-ipv6 ^
	--disable-phpdbg ^
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
	--without-ldap ^
	--without-pgsql ^
	--without-uncritical-warn-choke ^
	--with-toolset=vs ^
	--with-cygwin=%PATH_BIN_CYGWIN% ^
	--with-extra-includes=%PATH_INSTALL_OSSL%\include;%PATH_INSTALL%\include;%PATH_INSTALL%\_proj\include ^
	--with-extra-libs=%PATH_INSTALL_OSSL%\lib;%PATH_INSTALL%\lib;%PATH_INSTALL%\_proj\lib ^ ^
	--with-mp=%NUMBER_OF_PROCESSORS%
REM known bug for --with-ffi if php != 8.1 || 7.4
REM [%PHPVER% != %PHP_FULLBUILD%]: add --disable-zlib ^ if not memcache
if %PHPVER% == %PHP_FULLBUILD% (
	set FINAL_CONFIGURE=%PHP_COMMON_CONFIGURE% ^
	--enable-mbstring=shared ^
	--enable-phar-native-ssl ^
	--enable-brotli=shared ^
	--enable-com-dotnet=shared ^
	--enable-exif=shared ^
	--enable-fileinfo=shared ^
	--enable-ftp=shared ^
	--enable-intl=shared ^
	--enable-opcache=shared ^
	--enable-pdo=shared ^
	--enable-soap=shared ^
	--enable-sockets=shared ^
	--with-bz2=shared ^
	--with-curl=shared ^
	--with-iconv=%PATH_INSTALL% ^
	--with-mysqli=shared ^
	--with-openssl=shared ^
	--with-pdo-mysql=shared ^
	--with-pdo-sqlite=shared ^
	--with-sqlite3=shared ^
	--with-tidy=shared ^
	--with-xdebug=shared ^
	--with-xdebug-compression ^
	--with-xdiff=shared ^
	--enable-memcache=shared ^
	--with-geos=shared ^
	--with-ffi=shared ^
	--with-sodium=shared ^
	--with-xml=shared ^
	--enable-xmlreader=shared ^
	--enable-xmlwriter=shared ^
	--with-simplexml=shared ^
	--with-dom=shared ^
	--with-iconv=shared ^
	--enable-zip=shared ^
	--enable-zlib=shared ^
	--with-readline=shared ^
	--enable-pdo=shared ^
	--enable-calendar=shared ^
	--with-mhash=shared ^
	--enable-ctype=shared ^
	--enable-bcmath=shared ^
	--with-gd=shared ^
	--with-xsl=shared ^
	--with-gmp=shared ^
	--enable-zstd=shared ^
	--with-libxml=shared ^
	--with-proj=shared ^
	%ZTS% ^
	%phpveropts% ^
	%phparchopts%
) else (
	set FINAL_CONFIGURE=%PHP_COMMON_CONFIGURE% ^
	--disable-bcmath ^
	--disable-brotli ^
	--disable-calendar ^
	--disable-com-dotnet ^
	--disable-ctype ^
	--without-dom ^
	--disable-filter ^
	--without-gd ^
	--without-iconv ^
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
	--without-geos ^
	--without-readline ^
	--disable-zstd ^
	--enable-memcache=shared ^
	%ZTS% ^
	%phpveropts% ^
	%phparchopts%
)
echo configure %FINAL_CONFIGURE%
call configure %FINAL_CONFIGURE%

	REM ARFLAGS
sed -i 's/ARFLAGS=\/nologo/ARFLAGS=\/nologo \/LTCG/g' %CYGPATH_SRC%/php-src/Makefile
	REM LDFLAGS (libcmt.lib : freetype2)
sed -i -E 's/incremental:no/incremental:no \/LTCG \/NODEFAULTLIB:libcmt.lib/g' %CYGPATH_SRC%/php-src/Makefile
	REM CFLAGS
sed -i 's/\/Ox/\/O2 \/GL \/Zf \/D PHP_ICONV_PREFIX=%PATH_INSTALL:\=\/%/g' %CYGPATH_SRC%/php-src/Makefile
	REM no warn
sed -i 's/d4996//g' %CYGPATH_SRC%/php-src/Makefile
	REM fix for iconv shared : LINK : fatal error LNK1181: cannot open input file 'php_iconv.lib'
sed -i -E 's/LIBS_LIBXML=(.*)php_iconv.lib(.*)/LIBS_LIBXML=\\1\\2/g' %CYGPATH_SRC%/php-src/Makefile
	REM PHP 7.X 'warning U4004: too many rules' - https://docs.microsoft.com/en-us/cpp/error-messages/tool-errors/nmake-warning-u4004
REM sed -i 's/phpdbg_win.obj: /phpdbg_win.obj:: /g' %CYGPATH_SRC%/php-src/Makefile

	REM after sed:
REM LDFLAGS=/nologo /incremental:no /LTCG /NODEFAULTLIB:libcmt.lib /debug /opt:ref,icf
REM ARFLAGS=/nologo /LTCG
REM CFLAGS=/nologo $(BASE_INCLUDES) /D _WINDOWS /D WINDOWS=1 /D ZEND_WIN32=1 /D PHP_WIN32=1 /D WIN32 /D _MBCS /D _USE_MATH_DEFINES /FD /w /Zc:inline /Gw /Zc:__cplusplus /d2FuncCache1 /Zc:wchar_t /MP16 /Zi /LD /MD /O2 /GL /D NDebug /D NDEBUG /D ZEND_WIN32_FORCE_INLINE /GF /D ZEND_DEBUG=0 /D FD_SETSIZE=2048

nmake %NMAKE_OPTS%

if exist %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%\. rmdir /S /Q %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%
mkdir %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%

for %%A in (exe dll) do (
	for /f "tokens=*" %%G in ('dir %PHP_BUILD_DIR%\php*.%%A /s/b') do (
		for %%E in (%%A pdb) do (
			xcopy /C /F /Y %%~pG%%~nG.%%E %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%\*
		)
	)
)
if %PHPVER% == %PHP_FULLBUILD% (
	call %PATH_MODULES_COMMON%\init.bat php-src varonly
	for %%X in (php-cgi.exe php.exe php8.dll php_curl.dll php_fileinfo.dll php_gd.dll php_intl.dll php_opcache.dll php_openssl.dll php_tidy.dll php_bcmath.dll php_bz2.dll php_calendar.dll php_com_dotnet.dll php_ctype.dll php_dom.dll php_exif.dll php_ffi.dll php_ftp.dll php_iconv.dll php_mysqli.dll php_pdo_mysql.dll php_pdo_sqlite.dll php_readline.dll php_simplexml.dll php_soap.dll php_sockets.dll php_sodium.dll php_sqlite3.dll php_xml.dll php_xmlreader.dll php_xmlwriter.dll php_zip.dll php_zlib.dll php_xsl.dll php_mbstring.dll php_gmp.dll) do (
		call do_php %PATH_UTILS%\sub\version.php php-src %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%\%%X "build:%TSNTS%"
	)
	call %PATH_MODULES_COMMON%\init.bat pecl-text-xdiff varonly
	call do_php %PATH_UTILS%\sub\version.php pecl-text-xdiff %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%\php_xdiff.dll "php:%PHPVER% build:%TSNTS%"
	call %PATH_MODULES_COMMON%\init.bat php-ext-brotli varonly
	call do_php %PATH_UTILS%\sub\version.php php-ext-brotli %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%\php_brotli.dll "php:%PHPVER% build:%TSNTS%"
	call %PATH_MODULES_COMMON%\init.bat php-ext-zstd varonly
	call do_php %PATH_UTILS%\sub\version.php php-ext-zstd %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%\php_zstd.dll "php:%PHPVER% build:%TSNTS%"
	call %PATH_MODULES_COMMON%\init.bat php-geos varonly
	call do_php %PATH_UTILS%\sub\version.php php-geos %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%\php_geos.dll "php:%PHPVER% build:%TSNTS%"
	call %PATH_MODULES_COMMON%\init.bat php-proj varonly
	call do_php %PATH_UTILS%\sub\version.php php-proj %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%\php_proj.dll "php:%PHPVER% build:%TSNTS%"
	call %PATH_MODULES_COMMON%\init.bat xdebug varonly
	call do_php %PATH_UTILS%\sub\version.php xdebug %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%\php_xdebug.dll "php:%PHPVER% build:%TSNTS%"
)
	REM php_memcache for github
if %AVXECHO% == sse2 (set AVXPATH=) else (set AVXPATH=\avx)
call %PATH_MODULES_COMMON%\init.bat pecl-memcache varonly
call do_php %PATH_UTILS%\sub\version.php pecl-memcache %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%\php_memcache.dll "php:%PHPVER% build:%TSNTS%"
if not "%PATH_GITHUB_PHPMEMCACHE%"=="" (
	for %%A in (pdb dll) do (
		xcopy /C /F /Y %PATH_RELEASE%\%MSVC_DEPS%_%PHP_SDK_ARCH%%AVXB%\_php-%TSNTS%\php_memcache.%%A %PATH_GITHUB_PHPMEMCACHE%\%MSVC_DEPS%\%PHP_SDK_ARCH%\%TSNTS%%AVXPATH%\php-%PHPVER%.x_memcache.%%A*
	)
)