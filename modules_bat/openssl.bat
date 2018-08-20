cd /D C:\httpd-sdk\src\openssl
perl Configure %perlbuild% --prefix=C:\httpd-sdk\install --openssldir=C:\httpd-sdk\install\conf --with-zlib-include=C:/httpd-sdk/install/include --with-zlib-lib=C:/httpd-sdk/install/lib/zlib.lib
nmake /B /NOLOGO clean install