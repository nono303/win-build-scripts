for i in `/usr/bin/find $2 -type f -name "build.make" 2>/dev/null` 
do
  sed -i 's/\/INCREMENTAL /\/LTCG \/OPT:REF,ICF \/DEBUG /g' $i
  sed -i 's/link.exe \/lib/link.exe \/lib \/LTCG/g' $i
  sed -i 's/lib.exe/lib.exe \/LTCG/g' $i
done
for i in `/usr/bin/find $2 -type f -name "flags.make" 2>/dev/null` 
do
  sed -i 's/ \/O2 \/Ob1 / \/O2 \/GL \/MD \/Zi \/MP'$3' '$1' /g' $i
  # result /DWIN32 /D_WINDOWS /w /MD /Zi /O2 /GL /MD /Zi /MP16 /arch:AVX /DNDEBUG
  sed -i 's/RC_FLAGS = /RC_FLAGS = \/nologo /g' $i
  sed -i -E 's/\/W[0-4]/\/w/g' $i
done