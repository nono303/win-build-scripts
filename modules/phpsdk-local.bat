set oldpath=%path%
call %PATH_BATCH%\%PHP_SDK_ARCH%.bat
set path=%path%;%oldpath%
cd /d %PATH_PHP_SDK%\

cd /D %PATH_SRC%\php-src
FOR /F "tokens=* USEBACKQ" %%F IN (`git describe --tags`) DO ( SET PHPGITVER=%%F )
set PHPVER=%PHPGITVER:~4,3%

REM -1 : only deps | 0 : avx nts | 1 : all
set BUILDALL=1
set BUILDTS=0

set BUILDLIB=0
set BUILDREQ=0
set UPDATEDEPS=0

REM ** uniquement sur init: 
	REM phpsdk_buildtree phpmaster

if %UPDATEDEPS% == 1 (
	rmdir /S /Q %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\deps
	powershell -command "Start-Sleep -s 1"
	mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\deps	
	call %PATH_PHP_SDK%\bin\php\do_php %PATH_BATCH%\php-getdeps.php
	cd /D %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\deps
	call %PATH_PHP_SDK%\bin\7za.exe x -y *
	rm -f *.zip
)
set raznono=0
if %BUILDLIB% == 1 set raznono=1
if %BUILDREQ% == 1 set raznono=1
if %raznono% == 1 (
	REM deps sans AVX
	call %PATH_BATCH%\avx.bat 0
	rmdir /S /Q %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono
	powershell -command "Start-Sleep -s 1"
	mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono
	mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\lib
	mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\bin
	mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono\include
)
set copydeps=0
if %BUILDLIB% == 1 (
	set copydeps=1
	echo ON
	REM en premier pour créer la structure depsnono
	call %PATH_MODULES%\libxpm-php.bat
	call %PATH_MODULES%\freetype-php.bat
	call %PATH_MODULES%\libpng-php.bat
	call %PATH_MODULES%\libjpeg-php.bat
	call %PATH_MODULES%\tidy-php.bat
)
if %BUILDREQ% == 1 (
	set copydeps=1
	call %PATH_MODULES%\libxdiff-php.bat
)
if %copydeps% == 1 (
	rm -f D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%ARCH%_deps\*.*
	copy /Y %PHPDEPS%\bin\*.* D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%ARCH%_deps\
)

if NOT %BUILDALL% == -1 (
	echo *** avx nts  ***
	set ZTS=--disable-zts
	set TSNTS=nts
	set BUILDDIR=Release
	call %PATH_BATCH%\avx.bat 1
	call %PATH_BATCH%\phpsdk-config_make.bat
	if %BUILDALL% == 1 (
		echo *** std nts  ***
		call %PATH_BATCH%\avx.bat 0
		call %PATH_BATCH%\phpsdk-config_make.bat
		if %BUILDTS% == 1 (
			echo *** std ts  ***
			set ZTS=
			set TSNTS=ts
			set BUILDDIR=Release_TS
			call %PATH_BATCH%\phpsdk-config_make.bat

			echo *** avx ts  ***
			call %PATH_BATCH%\avx.bat 1
			call %PATH_BATCH%\phpsdk-config_make.bat
		)

		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-avx-nts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\nts\avx\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-avx-ts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\ts\avx\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-nts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\nts\php-%PHPVER%.x_memcache.dll
		copy /Y D:\github\NONO_phpwin-perfbuild\%MSVC_DEPS%-%PHP_SDK_ARCH%-ts\php_memcache.dll D:\github\NONO_PHP7-memcache-dll\%MSVC_DEPS%\%PHP_SDK_ARCH%\ts\php-%PHPVER%.x_memcache.dll
	)
)
cd /D %PATH_BATCH%\
exit