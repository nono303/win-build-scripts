cd $1
autoupdate -f
./autogen.sh
./configure enable_docs=no --build $2 LD=link CC="$1/msvcc.sh" CXX="cl -nologo -EP" CPP="cl -nologo -EP" CXXCPP="cl -nologo -EP"
