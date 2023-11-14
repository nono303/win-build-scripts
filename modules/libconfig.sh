cd $1
# autoupdate -f
autoreconf -fi -I /usr/share/aclocal
./configure --disable-cxx --disable-doc --disable-examples --disable-tests

make -j$(nproc) uninstall
make -j$(nproc) clean
make -j$(nproc) CFLAGS+=' -Wno-char-subscripts -O3 -s '
cp --verbose -rf $1/lib/.libs/cygconfig-11.dll $3/x64/cygconfig-11.dll
make -j$(nproc) install
