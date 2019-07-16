set oldpath=%path%
call c:\httpd-sdk\%PHP_SDK_ARCH%.bat
set path=%path%;%oldpath%
cd /d C:\php72-sdk\

set PHPVER=7.3

	REM deps sans AVX
call C:\httpd-sdk\avx.bat 0

	REM -1 : only deps
set BUILDALL=1
set BUILDTS=0

set BUILDLIB=1
set BUILDREQ=1
set UPDATEDEPS=0

	REM ** uniquement sur init: phpsdk_buildtree phpmaster

if %UPDATEDEPS% == 1 (
	rmdir /S /Q C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\deps
	powershell -command "Start-Sleep -s 1"
	mkdir C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\deps	
	call C:\php72-sdk\bin\php\do_php c:\httpd-sdk\php-getdeps.php
	cd /D C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\deps
	call C:\php72-sdk\bin\7za.exe x -y *
	rm -f *.zip
)
set raznono=0
if %BUILDLIB% == 1 set raznono=1
if %BUILDREQ% == 1 set raznono=1
if %raznono% == 1 (
	rmdir /S /Q C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono
	powershell -command "Start-Sleep -s 1"
	mkdir C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono
	mkdir C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\lib
	mkdir C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\bin
	mkdir C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\include
)
if %BUILDLIB% == 1 (
	echo ON
	REM en premier pour créer la structure depsnono
	call %MODULE_BAT_DIR%libxpm-php.bat
	call %MODULE_BAT_DIR%freetype-php.bat
	call %MODULE_BAT_DIR%libpng-php.bat
	call %MODULE_BAT_DIR%libjpeg-php.bat
	call %MODULE_BAT_DIR%tidy-php.bat
)
if %BUILDREQ% == 1 (
	call %MODULE_BAT_DIR%protobuf-php.bat
	call %MODULE_BAT_DIR%libxdiff-php.bat
	call %MODULE_BAT_DIR%libzmq-php.bat
)

rm -f D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%ARCH%_deps\*.*
copy /Y %PHPDEPS%\bin\*.* D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%ARCH%_deps\
REM copy /Y C:\httpd-sdk\install_%ARCH%\bin\brotli*.* D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%ARCH%_deps\

if NOT %BUILDALL% == -1 (
	set ZTS=--disable-zts
	set TSNTS=nts
	set BUILDDIR=Release

	set outdir=-avx
	call C:\httpd-sdk\avx.bat 1
	set intrinsics=,sse3,ssse3,sse4.1,sse4.2,avx
		echo *** avx nts  ***
		call C:\httpd-sdk\phpsdk-config_make.bat
	if %BUILDALL% == 1 (
		set outdir=
		call C:\httpd-sdk\avx.bat 0
		set intrinsics=
			echo *** std nts  ***
			call C:\httpd-sdk\phpsdk-config_make.bat
		if %BUILDTS% == 1 (
			set ZTS=
			set TSNTS=ts
			set BUILDDIR=Release_TS

				echo *** std ts  ***
				call C:\httpd-sdk\phpsdk-config_make.bat

			set outdir=-avx
			call C:\httpd-sdk\avx.bat 1
			set intrinsics=,sse3,ssse3,sse4.1,sse4.2,avx
				echo *** avx ts  ***
				call C:\httpd-sdk\phpsdk-config_make.bat
		)

		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-avx-nts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\nts\avx\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-avx-ts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\ts\avx\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-nts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\nts\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-ts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\ts\php-%PHPVER%.x_memcache.dll
	)
)
cd /D C:\httpd-sdk\
exit