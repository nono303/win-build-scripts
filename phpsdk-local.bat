set oldpath=%path%
call c:\httpd-sdk\%PHP_SDK_ARCH%.bat
set path=%path%;%oldpath%
cd /d C:\php72-sdk\

set LTCG=1

set BUILDALL=1
set BUILDLIB=0
set BUILDPROTOBUF=0

REM ** uniquement sur init: phpsdk_buildtree phpmaster
call phpsdk_deps -u -b 7.2 -a %PHP_SDK_ARCH% -d C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\deps -t vc15

if %BUILDPROTOBUF% == 1 (
	call %MODULE_BAT_DIR%protobuf-php.bat
)
if %BUILDLIB% == 1 (
	call %MODULE_BAT_DIR%libxpm-php.bat
	call %MODULE_BAT_DIR%freetype-php.bat
	call %MODULE_BAT_DIR%libiconv-php.bat
	call %MODULE_BAT_DIR%libpng-php.bat
)
set ZTS=--disable-zts
set TSNTS=nts
set BUILDDIR=Release

set SED_AVX= \/arch:AVX
set outdir=_avx
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
	set outdir=_avx
		echo *** avx ts  ***
		call C:\httpd-sdk\phpsdk-config_make.bat
)
exit /B