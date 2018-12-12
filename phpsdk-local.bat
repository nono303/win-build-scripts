set oldpath=%path%
call c:\httpd-sdk\%PHP_SDK_ARCH%.bat
set path=%path%;%oldpath%
cd /d C:\php72-sdk\

set LTCG=1

set BUILDALL=0
set BUILDLIB=0
set BUILDPROTOBUF=0

REM ** uniquement sur init: phpsdk_buildtree phpmaster
call phpsdk_deps -u -b 7.3 -a %PHP_SDK_ARCH% -d C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\deps -t vc15

if %BUILDPROTOBUF% == 1 (
	call %MODULE_BAT_DIR%protobuf-php.bat
)
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

set ZTS=--disable-zts
set TSNTS=nts
set BUILDDIR=Release

set SED_AVX= \/arch:AVX
set outdir=-avx
	echo *** avx nts  ***
	call C:\httpd-sdk\phpsdk-config_make.bat
if %BUILDALL% == 1 (
	set SED_AVX=
	set outdir=
		echo *** std nts  ***
		call C:\httpd-sdk\phpsdk-config_make.bat

	set ZTS=
	set TSNTS=ts
	set BUILDDIR=Release_TS

		echo *** std ts  ***
		call C:\httpd-sdk\phpsdk-config_make.bat

	set SED_AVX= \/arch:AVX
	set outdir=-avx
		echo *** avx ts  ***
		call C:\httpd-sdk\phpsdk-config_make.bat

	copy /Y D:\github\NONO_phpwin-perfbuild\vc15-%PHP_SDK_ARCH%_avx-nts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\vc15\%PHP_SDK_ARCH%\nts\avx\php-7.2.x_memcache.dll
	copy /Y D:\github\NONO_phpwin-perfbuild\vc15-%PHP_SDK_ARCH%_avx-ts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\vc15\%PHP_SDK_ARCH%\ts\avx\php-7.2.x_memcache.dll
	copy /Y D:\github\NONO_phpwin-perfbuild\vc15-%PHP_SDK_ARCH%-nts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\vc15\%PHP_SDK_ARCH%\nts\php-7.2.x_memcache.dll
	copy /Y D:\github\NONO_phpwin-perfbuild\vc15-%PHP_SDK_ARCH%-ts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\vc15\%PHP_SDK_ARCH%\ts\php-7.2.x_memcache.dll
)
exit /B