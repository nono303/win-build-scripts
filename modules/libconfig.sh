cd $1
# autoupdate -f
autoreconf -fi -I /usr/share/aclocal
./configure --disable-cxx --disable-doc --disable-examples --disable-tests

make -j$(nproc) uninstall
make -j$(nproc) clean
# --debug=a
make -j$(nproc) CFLAGS+='-w -O3 -s -march=sandybridge'
cp --verbose -rf $1/lib/.libs/cygconfig-11.dll $3/x64/cygconfig-11.dll
make -j$(nproc) install
