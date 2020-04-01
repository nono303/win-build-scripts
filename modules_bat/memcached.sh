MEMCACHE_ROOT=/cygdrive/c/src/memcached
unameOut="$(uname -a)"
cd $MEMCACHE_ROOT
git reset --hard
git clean -fdx
git apply c:/httpd-sdk/modules_bat/memcached.patch
./version.sh
./autogen.sh
case "${unameOut}" in
    *i686*)     ARCH_PRF=x86
		CYG_BIN_PATH=/cygdrive/c/cyg32/bin;;
    *x86_64*)   ARCH_PRF=x64
		ARCH_PARAMS=--enable-64bit
		CYG_BIN_PATH=/cygdrive/c/cyg64/bin;;
esac

# https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html
# STD
./configure --cache-file=$ARCH_PRF.configure.cache --disable-dependency-tracking --enable-silent-rules${machine} --disable-dtrace --disable-sasl --disable-docs --disable-coverage --prefix=$MEMCACHE_ROOT/release/$ARCH_PRF/ $ARCH_PARAMS
#   SSE2
make clean && make CFLAGS=' -O3 -s -msse2 ' 
cp -rf $MEMCACHE_ROOT/memcached.exe /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/memcached.exe
#   AVX
make clean && make CFLAGS=' -O3 -s -march=sandybridge ' 
cp -rf $MEMCACHE_ROOT/memcached.exe /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/memcached-avx.exe 

# TLS
./configure --cache-file=$ARCH_PRF.configure.cache --disable-dependency-tracking --enable-silent-rules${machine} --disable-dtrace --disable-sasl --disable-docs --disable-coverage --prefix=$MEMCACHE_ROOT/release/$ARCH_PRF/ $ARCH_PARAMS --enable-tls
#   SSE2
make clean && make CFLAGS=' -O3 -s -msse2 '
cp -rf $MEMCACHE_ROOT/memcached.exe /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/memcached-tls.exe
#   AVX
make clean && make CFLAGS=' -O3 -s -march=sandybridge ' 
cp -rf $MEMCACHE_ROOT/memcached.exe /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/memcached-avx-tls.exe 

cp -rf $CYG_BIN_PATH/cygcrypto-1.1.dll /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/
cp -rf $CYG_BIN_PATH/cygevent_core-2-0-5.dll /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/
cp -rf $CYG_BIN_PATH/cygevent_extra-2-0-5.dll /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/
cp -rf $CYG_BIN_PATH/cygevent_openssl-2-0-5.dll /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/
cp -rf $CYG_BIN_PATH/cygevent_pthreads-2-0-5.dll /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/
cp -rf $CYG_BIN_PATH/cygevent-2-0-5.dll /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/
cp -rf $CYG_BIN_PATH/cygssl-1.1.dll /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/
cp -rf $CYG_BIN_PATH/cygwin1.dll /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/
cp -rf $CYG_BIN_PATH/cygz.dll /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/
# x86
cp -rf $CYG_BIN_PATH/cyggcc_s-1.dll /cygdrive/d/github/NONO_memcached/cygwin/$ARCH_PRF/