@echo off
	REM https://curl.haxx.se/docs/ssl-compared.html

set CURL_TESTURL=https://www.google.com/
set old_path=%PATH%
call do_php %PATH_UTILS%\sub\bininfo.php %PATH_INSTALL%\curl null checkavx recurse

set PATH=%PATH_INSTALL%\bin;c:\Windows\SysWOW64
for /f "tokens=*" %%G in ('dir /O:-N %PATH_INSTALL%\curl /b') do (
	echo ************************************
	xcopy /C /F /Y %PATH_INSTALL%\curl\%%G\bin\libcurl.* %PATH_RELEASE_PHP%\vs16-x64-avx-nts\*
	echo ------------------------------------
	call %PATH_INSTALL%\curl\%%G\bin\curl --version & echo.
	call %PATH_INSTALL%\curl\%%G\bin\curl --silent --show-error --insecure -w "@%PATH_UTILS:\=/%/sub/curlperf.txt" --tls-max 1.2 --output NUL "%CURL_TESTURL%?curl-%%G" --output NUL "%CURL_TESTURL%?curl-%%G"

	cd /D %PATH_RELEASE_PHP%\vs16-x64-avx-nts
	%PATH_BIN_CYGWIN%\sed -i -E 's/^extension_dir.*/extension_dir = "%PATH_RELEASE_PHP:\=\\\\%\\\\vs16-x64-avx-nts"/g' %CYGPATH_UTILS%/sub/php.ini
	echo ------------------------------------
	php -c %PATH_UTILS%\sub\php.ini -v
	php -c %PATH_UTILS%\sub\php.ini %PATH_UTILS%\sub\curlperf.php "%CURL_TESTURL%?php-%%G"
)
set PATH=%old_path%