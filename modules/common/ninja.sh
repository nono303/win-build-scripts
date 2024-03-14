avx=$(echo $1| sed 's#/#\\/#g')
# LINK FLAGS (dll exe) (LINK_FLAGS with debug)
sed -i -E 's/LINK_FLAGS =(.*) \/INCREMENTAL[^ ]*(.*)/LINK_FLAGS =\1\2/gI' $2/build.ninja
sed -i -E 's/LINK_FLAGS =(.*) \/WX(.*)/LINK_FLAGS =\1\2/gI' $2/build.ninja
sed -i -E 's/LINK_FLAGS =(.*)\/machine:(...)(.*)\/debug(.*)/LINK_FLAGS =\1\/machine:\2 \/DEBUG\3\/NOLOGO \/LTCG \/OPT:REF,ICF\4/gI' $2/build.ninja
# LINK FLAGS (lib)
sed -i -E 's/LINK_FLAGS = \/machine:(...)/LINK_FLAGS = \/LTCG \/machine:\1/gI' $2/build.ninja
sed -i 's/\/INCREMENTAL //g' $2/build.ninja
# RC FLAGS
sed -i 's/FLAGS = -DWIN32/FLAGS = -DWIN32 -nologo/gI' $2/build.ninja
# C & C++ FLAGS
# warn
sed -i -E 's/[\/-]W[0-4]/\/w/g' $2/build.ninja
# opti
sed -i 's/ \/O2 \/Ob1/ \/Gw \/Gy \/Zc:inline \/O2 \/Zf \/Zi \/FS \/GL \/MP'$3' '$avx' \/w/gI' $2/build.ninja
# found		/DWIN32 /D_WINDOWS /W4 /MD /Zi /ZF /O2 /Ob1 /DNDEBUG
# result	/DWIN32 /D_WINDOWS /w /MD /Gw /Gy /Zc:inline /O2 /Zf /Zi /FS /GL /MD /MP16 /arch:AVX /DNDEBUG
