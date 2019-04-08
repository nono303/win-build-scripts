cd /d C:\php72-sdk\phpmaster\vc%MSVC_VER%\%PHP_SDK_ARCH%\php-src
git reset --hard
sed -i 's/libeay32st/libcrypto/g' /cygdrive/c/src/php-src/ext/phar/config.w32
mkdir C:\php72-sdk\phpmaster\vc%MSVC_VER%\%PHP_SDK_ARCH%\build\%BUILDDIR%\
call buildconf
call configure --with-mp=8 --enable-object-out-dir=../build/ --disable-all --without-enchant --without-imap --without-snmp --without-xmlrpc --without-xsl --without-gmp --without-wddx --without-libwebp --without-interbase --without-ldap --without-oci8 --without-pgsql --without-uncritical-warn-choke --with-boost=C:\src\boost --enable-memcache=shared --enable-fd-setsize=2048 --without-analyzer --with-extra-includes="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Include\um";"C:\Program Files (x86)\Windows Kits\10\Include\%WKITVER%\um";"C:\php72-sdk\phpmaster\vc%MSVC_VER%\%PHP_SDK_ARCH%\depsnono\include" --with-extra-libs="C:\Program Files (x86)\Windows Kits\NETFXSDK\4.7\Lib\um\%PHP_SDK_ARCH%";"C:\Program Files (x86)\Windows Kits\10\Lib\%WKITVER%\um\%PHP_SDK_ARCH%";"C:\php72-sdk\phpmaster\vc%MSVC_VER%\%PHP_SDK_ARCH%\depsnono\lib" %ZTS% --without-gd --without-iconv --without-mysqlnd --without-pcre-jit --without-readline --without-libxml --without-dom --without-simplexml --without-xml --enable-cli --enable-zlib --enable-hash --enable-session --with-bz2
if %LTCG% == 1 (
	sed -i 's/LDFLAGS=\/nologo/LDFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/ARFLAGS=\/nologo/ARFLAGS=\/nologo \/LTCG \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GL \/GS- \/Oy- \/w%SED_AVX%/g' /cygdrive/c/src/php-src/Makefile
) else (
	sed -i 's/LDFLAGS=\/nologo/LDFLAGS=\/nologo \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/ARFLAGS=\/nologo/ARFLAGS=\/nologo \/NODEFAULTLIB:libcmt.lib \/OPT:ICF/g' /cygdrive/c/src/php-src/Makefile
	sed -i 's/CFLAGS=\/nologo/CFLAGS=\/nologo \/GS- \/Oy- \/w%SED_AVX%/g' /cygdrive/c/src/php-src/Makefile
)
sed -i 's/ \/W3 / /g' /cygdrive/c/src/php-src/Makefile
sed -i 's/ \/wd4996 / /g' /cygdrive/c/src/php-src/Makefile
nmake %NMAKE_OPTS%
for /f "tokens=*" %%G in ('dir C:\php72-sdk\phpmaster\vc%MSVC_VER%\%PHP_SDK_ARCH%\build\%BUILDDIR%\*.exe /s/b') do (
	COPY /Y %%~pG%%~nG.exe D:\github\NONO_phpwin-perfbuild\vc%MSVC_VER%-%PHP_SDK_ARCH%%outdir%-%TSNTS%\%%~nG.exe
)
for /f "tokens=*" %%G in ('dir C:\php72-sdk\phpmaster\vc%MSVC_VER%\%PHP_SDK_ARCH%\build\%BUILDDIR%\*.dll /s/b') do (
	COPY /Y %%~pG%%~nG.dll D:\github\NONO_phpwin-perfbuild\vc%MSVC_VER%-%PHP_SDK_ARCH%%outdir%-%TSNTS%\%%~nG.dll
)
rmdir /S /Q C:\php72-sdk\phpmaster\vc%MSVC_VER%\%PHP_SDK_ARCH%\build\%BUILDDIR%\