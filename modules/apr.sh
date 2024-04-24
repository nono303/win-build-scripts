avx=$(echo $1| sed 's#/#\\/#g')
for i in `/usr/bin/find $2 -type f \( -iname \*.mak -o -iname \*.dsp -o -iname \*.win \) 2>/dev/null` 
do
  # result: cl.exe /nologo /MD /w /std:clatest /O2 /GL /MD /Zi /w /Gw /Gy /Zc:inline /Zf /FS /DNDEBUG /MP16 /arch:AVX2 /Oy-
  sed -i -E 's/ \/Zi \/O. / \/std:clatest \/O2 \/GL \/MD \/Zi \/w \/Gw \/Gy \/Zc:inline \/Zf \/FS \/DNDEBUG \/MP'$3' '$avx' /g' $i
  sed -i 's/incremental:no/incremental:no \/LTCG \/OPT:ICF,REF \/debug/g' $i
  sed -i -E 's/base:"[^"]+"/dynamicbase/g' $i
  sed -i 's/link.exe \/lib/link.exe \/lib \/LTCG \/OPT:ICF,REF/g' $i
  sed -i 's/link.exe -lib/link.exe -lib -LTCG/g' $i
  sed -i -E 's/\/W[0-4]/\/w/g' $i 
  sed -i 's/RSC=rc.exe/RSC=rc.exe -nologo/g' $i
  sed -i -E 's/base:@.*/nologo/g' $i
  sed -i 's/libeay32/libcrypto/g' $i
  sed -i 's/ssleay32/libssl/g' $i  
done