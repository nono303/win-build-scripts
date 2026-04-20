cd $1
autoupdate -f
./autogen.sh
./configure enable_docs=no --build $2 LD="$1" CC="$3" CXX="$3"
