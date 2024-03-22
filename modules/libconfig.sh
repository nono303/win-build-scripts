cd $1
# autoupdate -f
autoreconf -fi -I /usr/share/aclocal
./configure --disable-cxx --disable-doc --disable-examples --disable-tests

make -j$(nproc) uninstall
make -j$(nproc) clean
# --debug=a
set -x
make -j$(nproc) CFLAGS+=" -w -O3 -s -march=${3} "
make -j$(nproc) install
