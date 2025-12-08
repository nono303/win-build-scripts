avx=$(echo $1| sed 's#/#\\/#g')

# LINK FLAGS (dll exe)
sed -i -E 's/command = "link"/command = "link" \/NOLOGO \/LTCG \/OPT:REF,ICF/g' $2/build.ninja

# LINK FLAGS (lib)
sed -i -E 's/command = "lib"/command = "lib" \/NOLOGO \/LTCG/g' $2/build.ninja

# C & C++ FLAGS
sed -i -E 's/command = "cl"/command = "cl" \/Gw \/Gy \/Zc:inline \/O2 \/Ob3 \/Zf \/Zi \/FS \/GL \/MD \/MP'$3' \/cgthreads8 '$avx' \/DNDEBUG/g' $2/build.ninja
  # remove
sed -i -E 's/ "-wd[0-9]{4}"//g' $2/build.ninja
sed -i 's/"\/W3"/"\/w"/g' $2/build.ninja
sed -i 's/"\/Z7" //g' $2/build.ninja