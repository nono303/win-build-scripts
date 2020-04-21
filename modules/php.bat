set PHP_BUILDTS=0
set PHP_OUTDIR=D:\github\NONO_phpwin-perfbuild
set PHP_MEMCACHE_OUTDIR=D:\github\NONO_PHP7-memcache-dll

	REM see curl.bat
set PHP_CURL=%PATH_INSTALL%\curl\openssl-ssh2_static_deps-static

	REM version
cd /D %PATH_SRC%\php-src
FOR /F "tokens=* USEBACKQ" %%F IN (`git describe --tags`) DO ( SET PHPGITVER=%%F )
set PHPVER=%PHPGITVER:~4,3%
echo %PHPVER%

	REM GET precompiled sdk deps
call %PATH_PHP_SDK%\bin\php\do_php %PATH_MODULES%\php-getdeps.php

	REM mklink php-src & pecl > phpmaster
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\php-src %PATH_SRC%\php-src
if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\. mkdir %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl
for %%E in (pecl-memcache pecl-text-xdiff php-ext-brotli xdebug) do (
	if not exist %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E\. mklink /J %PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\pecl\%%E %PATH_SRC%\%%E
)
del /Q /F %PATH_PHP_SDK%\phpsdk-local.bat
mklink /H %PATH_PHP_SDK%\phpsdk-local.bat %PATH_MODULES%\phpsdk-local.bat
call %PATH_PHP_SDK%\phpsdk-%MSVC_DEPS%-%ARCH%.bat