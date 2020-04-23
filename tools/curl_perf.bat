@echo off
set old_path=%PATH%
set PATH=C:\sdk\release\vs16_x64-avx\bin
for /f "tokens=*" %%G in ('dir C:\sdk\release\vs16_x64-avx\curl /b') do (
	call C:\sdk\release\vs16_x64-avx\curl\%%G\bin\curl -w "@C:/sdk/batch/tools/sub/test_curl.txt" -o NUL -s "https://cdn25.nono303.net/"
)
set PATH=%oldpath%;C:\sdk\release\vs16_x64-avx\bin
for /f "tokens=*" %%G in ('dir C:\sdk\release\vs16_x64-avx\curl /b') do (
	cd /D D:\github\NONO_phpwin-perfbuild\vs16-x64-avx-nts
	if exist D:\github\NONO_phpwin-perfbuild\vs16-x64-avx-nts\libcurl.dll del /F /Q D:\github\NONO_phpwin-perfbuild\vs16-x64-avx-nts\libcurl.dll
	copy /Y C:\sdk\release\vs16_x64-avx\curl\%%G\bin\libcurl.dll D:\github\NONO_phpwin-perfbuild\vs16-x64-avx-nts\
	c:\sdk\softs\cyg64\bin\sed -i -E 's/^extension_dir.*/extension_dir = "D:\\\\github\\\\NONO_phpwin-perfbuild\\\\vs16-x64-avx-nts"/g' /cygdrive/c/sdk/batch/tools/sub/php.ini
	php -c C:\sdk\batch\tools\sub\php.ini C:\sdk\batch\tools\sub\test_curl.php "https://cdn25.nono303.net/check.png"
)
cd /D C:\sdk\batch\tools

