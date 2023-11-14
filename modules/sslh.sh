cd $1
make -j$(nproc) clean
make -j$(nproc) CFLAGS+=' -Wno-attributes -Wno-sign-compare -Wno-incompatible-pointer-types -Wno-incompatible-pointer-types -O3 -s '
