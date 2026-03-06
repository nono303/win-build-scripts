if [ $3 -eq 1 ]
then
    set -x
    # 'V=1 --debug=a'
    makeargs='V=1'
fi

cd $1
./configure
make $makeargs -j$(nproc) clean
make $makeargs -j$(nproc) USELIBEV=1 USELIBCONFIG=1 ENABLE_REGEX=1 CFLAGS+=" -Wno-error -O3 -s -march=${2} " sslh-fork sslh-select sslh-ev echosrv
