cd $1
./configure
make -j$(nproc) clean
set -x
make -j$(nproc) CFLAGS+=" -w -O3 -s -march=${2} "
