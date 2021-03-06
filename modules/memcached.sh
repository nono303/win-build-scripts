unameOut="$(uname -a)"
cd $1
git reset --hard
git clean -fdx
# disable debug
git apply --verbose `cygpath -m $2/memcached.patch`
./version.sh
./autogen.sh
case "${unameOut}" in
    *i686*)     ARCH_PRF=x86
    		# only for x86..??
		cp --verbose -rf /bin/cyggcc_s-1.dll $3/$ARCH_PRF/;;
    *x86_64*)   ARCH_PRF=x64
		ARCH_PARAMS=--enable-64bit;;
esac

# https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html
CFCOM="-Wno-char-subscripts -O3 -s"
# STD
./configure --cache-file=$ARCH_PRF.configure.cache --disable-dependency-tracking --enable-silent-rules${machine} --disable-dtrace --disable-sasl --disable-docs --disable-coverage --prefix=$1/release/$ARCH_PRF/ $ARCH_PARAMS
#   SSE2
make clean && make CFLAGS+=' -Wno-char-subscripts -O3 -s -msse2 '
cp --verbose -rf $1/memcached.exe $3/$ARCH_PRF/memcached.exe
#   AVX
make clean && make CFLAGS+=' -Wno-char-subscripts -O3 -s -march=sandybridge '
cp --verbose -rf $1/memcached.exe $3/$ARCH_PRF/memcached-avx.exe 

# TLS
./configure --cache-file=$ARCH_PRF.configure.cache --disable-dependency-tracking --enable-silent-rules${machine} --disable-dtrace --disable-sasl --disable-docs --disable-coverage --prefix=$1/release/$ARCH_PRF/ $ARCH_PARAMS --enable-tls
#   SSE2
make clean && make CFLAGS+=' -Wno-char-subscripts -O3 -s -msse2 '
cp --verbose -rf $1/memcached.exe $3/$ARCH_PRF/memcached-tls.exe
#   AVX
make clean && make CFLAGS+=' -Wno-char-subscripts -O3 -s -march=sandybridge '
cp --verbose -rf $1/memcached.exe $3/$ARCH_PRF/memcached-avx-tls.exe

cp --verbose -rf /bin/cygcrypto-1.1.dll $3/$ARCH_PRF/
cp --verbose -rf /bin/cygevent_core-2-0-5.dll $3/$ARCH_PRF/
cp --verbose -rf /bin/cygevent_extra-2-0-5.dll $3/$ARCH_PRF/
cp --verbose -rf /bin/cygevent_openssl-2-0-5.dll $3/$ARCH_PRF/
cp --verbose -rf /bin/cygevent_pthreads-2-0-5.dll $3/$ARCH_PRF/
cp --verbose -rf /bin/cygevent-2-0-5.dll $3/$ARCH_PRF/
cp --verbose -rf /bin/cygssl-1.1.dll $3/$ARCH_PRF/
cp --verbose -rf /bin/cygwin1.dll $3/$ARCH_PRF/
cp --verbose -rf /bin/cygz.dll $3/$ARCH_PRF/