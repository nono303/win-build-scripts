# LINK FLAGS (dll exe)
sed -i -E 's/LINK_FLAGS = \/machine:(...) \/debug \/INCREMENTAL/LINK_FLAGS = \/LTCG \/OPT:REF,ICF \/DEBUG \/machine:\1/g' $2/build.ninja
# LINK FLAGS (lib)
sed -i -E 's/LINK_FLAGS = \/machine:(...)/LINK_FLAGS = \/LTCG \/machine:\1/g' $2/build.ninja
sed -i 's/\/INCREMENTAL //g' $2/build.ninja
# RC FLAGS
sed -i 's/FLAGS = -DWIN32/FLAGS = -DWIN32 -nologo/g' $2/build.ninja
# C & C++ FLAGS
# warn
sed -i -E 's/[\/-]W[0-4]/\/w/g' $2/build.ninja
# opti
sed -i 's/ \/O2 \/Ob1 / \/O2 \/GL \/MD \/Zi \/MP'$3' '$1' /g' $2/build.ninja
# found		/DWIN32 /D_WINDOWS /W4 /MD /Zi /O2 /Ob1 /DNDEBUG
# result	/DWIN32 /D_WINDOWS /w /MD /Zi /O2 /GL /MD /Zi /MP16 /arch:AVX /DNDEBUG