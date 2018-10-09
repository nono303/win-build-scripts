set oldpath=%path%
call c:\httpd-sdk\%PHP_SDK_ARCH%.bat
set path=%path%;%oldpath%
cd /d C:\php72-sdk\

set BUILDLIB=0
set LTCG=1
set LOGNAME=C:\php72-sdk\silent-logs\%PHP_SDK_ARCH%_TS-%TS%_LTCG-%LTCG%_%Date:~-4%%Date:~-7,-5%%Date:~-10,-8%-%TIME:~-11,-9%%TIME:~-8,-6%%TIME:~-5,-3%.log

REM ** uniquement sur init
	REM phpsdk_buildtree phpmaster
call phpsdk_deps -u -b 7.2 -a %PHP_SDK_ARCH% -d C:\php72-sdk\phpmaster\vc15\%PHP_SDK_ARCH%\deps -t vc15

if %BUILDLIB% == 1 (
	call %MODULE_BAT_DIR%libxpm-php.bat
	call %MODULE_BAT_DIR%freetype-php.bat
	call %MODULE_BAT_DIR%libiconv-php.bat
	call %MODULE_BAT_DIR%libpng-php.bat
)
set ZTS=--disable-zts
set BUILDDIR=Release

set SED_AVX= /arch:AVX
set outdir=-AVX
	call C:\httpd-sdk\phpsdk-config_make.bat
set SED_AVX=
set outdir=
	call C:\httpd-sdk\phpsdk-config_make.bat
set BUILDDIR=Release_TS
set ZTS=

set SED_AVX= /arch:AVX
set outdir=-AVX
	call C:\httpd-sdk\phpsdk-config_make.bat
set SED_AVX=
set outdir=
	call C:\httpd-sdk\phpsdk-config_make.bat
pause
exit