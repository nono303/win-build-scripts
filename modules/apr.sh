for i in `/usr/bin/find $2 -type f -name "*.mak" 2>/dev/null` 
do
  sed -i -E 's/ \/Zi \/O. / \/GL \/GS- \/guard:cf- \/GF \/LD \/MD \/Ox \/Zc:inline \/wd4267 \/wd4018 \/wd4244 \/wd4133 \/wd4311 \/MP'$3' '$1' /g' $i
  sed -i 's/incremental:no/LTCG \/OPT:ICF/g' $i
  sed -i -E 's/base:"[^"]+"/dynamicbase/g' $i
  sed -i 's/link.exe \/lib/link.exe \/lib \/LTCG/g' $i
  sed -i 's/link.exe -lib/link.exe -lib -LTCG/g' $i
  sed -i 's/libeay32/libcrypto/g' $i
  sed -i 's/ssleay32/libssl/g' $i
  sed -i 's/RSC=rc.exe/RSC=rc.exe -nologo/g' $i
#  sed -i 's/out:"$(OUTDIR)\\apr-1.lib"/out:"$(OUTDIR)\\apr-1.lib" \/pdb:"$(OUTDIR)\\apr-1.pdb"/g' $i
#  sed -i 's/out:"$(OUTDIR)\\aprutil-1.lib"/out:"$(OUTDIR)\\aprutil-1.lib" \/pdb:"$(OUTDIR)\\apr-1.pdb"/g' $i
done
for i in `/usr/bin/find $2 -type f -name "*.mk.win" 2>/dev/null` 
do
  sed -i -E 's/ \/Zi \/O. / \/GL \/GS- \/guard:cf- \/GF \/LD \/MD \/Ox \/Zc:inline \/MP'$3' '$1' /g' $i
  sed -i 's/incremental:no/LTCG \/OPT:ICF/g' $i
  sed -i 's/link.exe \/lib/link.exe \/lib \/LTCG/g' $i
  sed -i 's/link.exe -lib/link.exe -lib -LTCG/g' $i
  sed -i -E 's/base:@.*/nologo/g' $i
done