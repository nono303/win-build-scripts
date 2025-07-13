cd $1
# /usr/bin/find . -name \*.m4|xargs dos2unix
# /usr/bin/find . -name \*.ac|xargs dos2unix
# /usr/bin/find . -name \*.am|xargs dos2unix
autoupdate -f
autoreconf -fi -I /usr/share/aclocal
./configure --disable-docs CC=/cygdrive/c/sdk/src/libffi/msvcc.sh CXX=/cygdrive/c/sdk/src/libffi/msvcc.sh LD=/cygdrive/c/sdk/softs/vs22/Community/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/link CPP="/cygdrive/c/sdk/softs/vs22/Community/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/cl -nologo -EP" CXXCPP="/cygdrive/c/sdk/softs/vs22/Community/VC/Tools/MSVC/14.44.35207/bin/HostX64/x64/cl -nologo -EP" CPPFLAGS="-DFFI_BUILDING_DLL"
