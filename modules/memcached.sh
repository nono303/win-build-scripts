cd $1
git reset --hard
git clean -fdx
git apply --verbose `cygpath -m $2/memcached.patch`
./version.sh
autoupdate -f
./autogen.sh

unameOut="$(uname -a)"
case "${unameOut}" in
    *i686*)     ARCH_PRF=x86
		cp --verbose -rf /bin/cyggcc_s-1.dll $3/$ARCH_PRF/;;
    *x86_64*)   ARCH_PRF=x64
		ARCH_PARAMS=--enable-64bit;;
esac

case "${3}" in
    *-2.1)   EVENT_VER=2-1-7;;
    *-2.0)   EVENT_VER=2-0-5;;
esac

# https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html
	# STD
./configure --cache-file=$ARCH_PRF.configure.cache --disable-dependency-tracking --enable-silent-rules${machine} --disable-dtrace --disable-sasl --disable-docs --disable-coverage --prefix=$1/release/$ARCH_PRF/ $ARCH_PARAMS
#   SSE2
make -j$(nproc) clean && make -j$(nproc) CFLAGS+=' -Wno-char-subscripts -O3 -s -msse2 '			&& cp --verbose -rf $1/memcached.exe $3/$ARCH_PRF/memcached.exe

#   AVX
make -j$(nproc) clean && make -j$(nproc) CFLAGS+=' -Wno-char-subscripts -O3 -s -march=sandybridge '	&& cp --verbose -rf $1/memcached.exe $3/$ARCH_PRF/memcached-avx.exe 

	# TLS
./configure --cache-file=$ARCH_PRF.configure.cache --disable-dependency-tracking --enable-silent-rules${machine} --disable-dtrace --disable-sasl --disable-docs --disable-coverage --prefix=$1/release/$ARCH_PRF/ $ARCH_PARAMS --enable-tls
#   SSE2
make -j$(nproc) clean && make -j$(nproc) CFLAGS+=' -Wno-char-subscripts -O3 -s -msse2 '			&& cp --verbose -rf $1/memcached.exe $3/$ARCH_PRF/memcached-tls.exe
#   AVX
make -j$(nproc) clean && make -j$(nproc) CFLAGS+=' -Wno-char-subscripts -O3 -s -march=sandybridge '	&& cp --verbose -rf $1/memcached.exe $3/$ARCH_PRF/memcached-avx-tls.exe

for i in cygcrypto-1.1.dll cygevent_core-$EVENT_VER.dll cygevent_extra-$EVENT_VER.dll cygevent_openssl-$EVENT_VER.dll cygevent_pthreads-$EVENT_VER.dll cygevent-$EVENT_VER.dll cygssl-1.1.dll cygwin1.dll cygz.dll
do
	cp --verbose -rf /bin/$i $3/$ARCH_PRF/
done