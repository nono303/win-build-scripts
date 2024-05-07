if [ $4 -eq 1 ]
then
    set -x
    # 'V=1 --debug=a'
    makeargs='V=1'
fi

cd $1
autoupdate -f
autoreconf -fi -I /usr/share/aclocal
./configure --disable-cxx --disable-doc --disable-examples --disable-tests
make $makeargs -j$(nproc) uninstall
make $makeargs -j$(nproc) clean
make $makeargs -j$(nproc) CFLAGS+=" -w -O3 -s -march=${3} "
make $makeargs -j$(nproc) install
