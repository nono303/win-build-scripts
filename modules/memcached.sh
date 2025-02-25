EVENT_VER=2-1-7
OPENSSL_VER=3

if [ $6 -eq 1 ]
then
    set -x
    # 'V=1 --debug=a'
    makeargs='V=1'
fi

cd $1
# ./vendor/fetch.sh
./version.sh
autoupdate -f
./autogen.sh

	# STD
./configure --cache-file=x64.configure.cache --disable-dependency-tracking --enable-silent-rules${machine} --disable-dtrace --disable-sasl --disable-docs --disable-coverage --prefix=$1/release/x64/ --enable-64bit
make $makeargs -j$(nproc) clean
make $makeargs -j$(nproc) CFLAGS+=" -Wno-error -O3 -s -march=${4} "
cp --verbose -rf $1/memcached.exe $3/x64/memcached$5.exe 
	# TLS
./configure --cache-file=x64.configure.cache --disable-dependency-tracking --enable-silent-rules${machine} --disable-dtrace --disable-sasl --disable-docs --disable-coverage --prefix=$1/release/x64/ --enable-64bit --enable-tls
make $makeargs -j$(nproc) clean 
make $makeargs -j$(nproc) CFLAGS+=" -Wno-error -O3 -s -march=${4} "
cp --verbose -rf $1/memcached.exe $3/x64/memcached$5-tls.exe

for i in cygevent_core-$EVENT_VER.dll cygevent_extra-$EVENT_VER.dll cygevent_openssl-$EVENT_VER.dll cygevent_pthreads-$EVENT_VER.dll cygevent-$EVENT_VER.dll cygssl-$OPENSSL_VER.dll cygcrypto-$OPENSSL_VER.dll cygwin1.dll cygz.dll
do
	cp --verbose -rf /bin/$i $3/x64/
done