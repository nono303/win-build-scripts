cd $1
./configure
make -j$(nproc) clean
make -j$(nproc) CFLAGS+='-w -O3 -s -march=sandybridge'
