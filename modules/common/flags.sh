for i in `/usr/bin/find $2 -type f -name "build.make" 2>/dev/null` 
do
  sed -i 's/\/INCREMENTAL/\/LTCG \/OPT:ICF/g' $i
  sed -i 's/link.exe \/lib/link.exe \/lib  \/LTCG/g' $i
done
/usr/bin/find $2 -type f -name "flags.make" -exec sed -i 's/ \/O2 / \/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/LD \/MD \/Ox \/Zc:inline \/wd4334 \/wd4090 \/wd4996 \/wd4267 \/wd4244 \/wd4152 \/wd4706 \/wd4068 \/wd4701 \/wd4295 \/MP'$3' '$1' /g' {} \;