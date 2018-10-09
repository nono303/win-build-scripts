cd /D C:\src\serf
python c:/bin/scons/scons.py --clean
git clean -fdx
cd /D C:\httpd-sdk\src\serf\build
python gen_def.py
cd /D C:\src\serf
	REM 1.3.9
REM python c:/bin/scons/scons.py --no-cache MSVC_VERSION=14.1 TARGET_ARCH=%serfbuild% APR=C:/httpd-sdk/install/ APU=C:/httpd-sdk/install/ OPENSSL=C:/httpd-sdk/install/ / ZLIB=C:/httpd-sdk/install/
	REM 2.0.0
python c:/bin/scons/scons.py --no-cache MSVC_VERSION=14.1 TARGET_ARCH=%serfbuild% APR=C:/httpd-sdk/install/lib/ APU=C:/httpd-sdk/install/ OPENSSL=C:/httpd-sdk/install/ ZLIB=C:/httpd-sdk/install/lib/ BROTLI=C:/httpd-sdk/install/ EXPAT=C:/httpd-sdk/install/
