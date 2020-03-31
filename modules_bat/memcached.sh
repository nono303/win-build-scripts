MEMCACHE_ROOT=/cygdrive/c/src/memcached
CUR=$(pwd)
unameOut="$(uname -a)"
mkdir -p $MEMCACHE_ROOT/release/
mkdir -p $MEMCACHE_ROOT/release/x86/
mkdir -p $MEMCACHE_ROOT/release/x64/
cd $MEMCACHE_ROOT
./version.sh
./autogen.sh
case "${unameOut}" in
    *i686*)     ./configure CFLAGS=' -O3 -s ' --prefix=$MEMCACHE_ROOT/release/x86/ --disable-dependency-tracking --enable-silent-rules${machine} --disable-docs --disable-coverage --disable-extstore;;
    *x86_64*)   ./configure CFLAGS=' -O3 -s ' --prefix=$MEMCACHE_ROOT/release/x64/ --disable-dependency-tracking --enable-silent-rules${machine} --disable-docs --disable-coverage --disable-extstore --enable-64bit;;

esac
make CFLAGS=' -O3 -s ' clean install
cd $CUR