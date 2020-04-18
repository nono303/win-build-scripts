for i in `/usr/bin/find $2 -type f -name "*.mak" 2>/dev/null` 
do
  sed -i 's/ \/Zi \/O2 / \/GL \/GS- \/guard:cf- \/GF \/LD \/MD \/Ox \/Zc:inline \/wd4267 \/wd4018 \/wd4244 \/wd4133 \/MP'$3' '$1' /g' $i
  sed -i 's/incremental:no/LTCG \/OPT:ICF/g' $i
  sed -i -E 's/base:"[^"]+"/dynamicbase/g' $i
  sed -i 's/link.exe \/lib/link.exe \/lib  \/LTCG/g' $i
done