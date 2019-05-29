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

REM deps sans AVX
SET AVX=
SET AVXB=
SET AVXSED=
SET AVXMSC=
SET AVXVCX=

REM -1 : only deps
set BUILDALL=1
set BUILDLIB=1
set BUILDREQ=1

REM ** uniquement sur init: phpsdk_buildtree phpmaster

REM C:\php72-sdk>call phpsdk_deps -u -b 7.3 -a x64 -d C:\php72-sdk\phpmaster\vs16\x64\deps -t vs16 -s staging
REM Fatal error: Uncaught SDK\Exception: The passed CRT 'vs16' doesn't match any availbale for branch '7.3' in C:\php72-sdk\lib\php\libsdk\SDK\Config.php:287
REM call phpsdk_deps -u -b %SDKVER% -a %PHP_SDK_ARCH% -d C:\php72-sdk\phpmaster\%MSVC_DEPS%\%PHP_SDK_ARCH%\deps -t %MSVC_DEPS% -s staging

if %BUILDLIB% == 1 (
	echo ON
	REM en premier pour créer la structure depsnono
	call %MODULE_BAT_DIR%libssh2-php.bat
	call %MODULE_BAT_DIR%libxpm-php.bat
	call %MODULE_BAT_DIR%freetype-php.bat
	call %MODULE_BAT_DIR%libiconv-php.bat
	call %MODULE_BAT_DIR%libpng-php.bat
	call %MODULE_BAT_DIR%libjpeg-php.bat
	call %MODULE_BAT_DIR%tidy-php.bat
)
if %BUILDREQ% == 1 (
	call %MODULE_BAT_DIR%protobuf-php.bat
	call %MODULE_BAT_DIR%libxdiff-php.bat
)
copy /Y %PHPDEPS%\bin\*.* D:\github\NONO_phpwin-perfbuild\\%MSVC_DEPS%-%ARCH%_deps\
copy /Y C:\httpd-sdk\install_%ARCH%\bin\brotli*.* D:\github\NONO_phpwin-perfbuild\\%MSVC_DEPS%-%ARCH%_deps\
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

		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-avx-nts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\nts\avx\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-avx-ts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\ts\avx\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-nts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\nts\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-ts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\ts\php-%PHPVER%.x_memcache.dll
	)
)
exit /B