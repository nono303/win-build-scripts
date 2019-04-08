set oldpath=%path%
call c:\httpd-sdk\%PHP_SDK_ARCH%.bat
set path=%path%;%oldpath%
cd /d C:\php72-sdk\

set LTCG=1
set PHPVER=7.3
set SDKVER=%PHPVER%
if %SDKVER% == 7.1 (
	set SDKVER=7.2
)

REM -1 : only deps
set BUILDALL=1
set BUILDLIB=0
set BUILDREQ=1

REM ** uniquement sur init: phpsdk_buildtree phpmaster
call phpsdk_deps -u -b %SDKVER% -a %PHP_SDK_ARCH% -d C:\php72-sdk\phpmaster\vc%MSVC_VER%\%PHP_SDK_ARCH%\deps -t vc%MSVC_VER% -s staging

if %BUILDLIB% == 1 (
	rmdir %PHPDEPS%
	mkdir %PHPDEPS%\bin
	mkdir %PHPDEPS%\include
	mkdir %PHPDEPS%\lib
	call %MODULE_BAT_DIR%libxpm-php.bat
	call %MODULE_BAT_DIR%freetype-php.bat
	call %MODULE_BAT_DIR%libiconv-php.bat
	call %MODULE_BAT_DIR%libpng-php.bat
	call %MODULE_BAT_DIR%libssh2-php.bat
	call %MODULE_BAT_DIR%tidy-php.bat
)
if %BUILDREQ% == 1 (
	call %MODULE_BAT_DIR%protobuf-php.bat
	call %MODULE_BAT_DIR%libxdiff-php.bat
)

if NOT %BUILDALL% == -1 (
	set ZTS=--disable-zts
	set TSNTS=nts
	set BUILDDIR=Release

	set outdir=-avx
	set intrinsics=,sse3,ssse3,sse4.1,sse4.2,avx
		echo *** avx nts  ***
		call C:\httpd-sdk\phpsdk-config_make-%PHPVER%.bat
	if %BUILDALL% == 1 (
		set outdir=
		set intrinsics=
			echo *** std nts  ***
			call C:\httpd-sdk\phpsdk-config_make-%PHPVER%.bat

		set ZTS=
		set TSNTS=ts
		set BUILDDIR=Release_TS

			echo *** std ts  ***
			call C:\httpd-sdk\phpsdk-config_make-%PHPVER%.bat

		set outdir=-avx
		set intrinsics=,sse3,ssse3,sse4.1,sse4.2,avx
			echo *** avx ts  ***
			call C:\httpd-sdk\phpsdk-config_make-%PHPVER%.bat

		copy /Y D:\github\NONO_phpwin-perfbuild\vc%MSVC_VER%-%PHP_SDK_ARCH%-avx-nts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\vc%MSVC_VER%\%PHP_SDK_ARCH%\nts\avx\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\vc%MSVC_VER%-%PHP_SDK_ARCH%-avx-ts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\vc%MSVC_VER%\%PHP_SDK_ARCH%\ts\avx\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\vc%MSVC_VER%-%PHP_SDK_ARCH%-nts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\vc%MSVC_VER%\%PHP_SDK_ARCH%\nts\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\vc%MSVC_VER%-%PHP_SDK_ARCH%-ts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\vc%MSVC_VER%\%PHP_SDK_ARCH%\ts\php-%PHPVER%.x_memcache.dll
	)
)
exit /B