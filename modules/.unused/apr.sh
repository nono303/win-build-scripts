for i in `/usr/bin/find $2 -type f -name "*.mak" 2>/dev/null` 
do
  sed -i 's/ \/Zi \/O2 / \/GL \/GS- \/guard:cf- \/GF \/LD \/MD \/Ox \/Zc:inline \/wd4267 \/wd4018 \/wd4244 \/MP'$3' '$1' /g' $i
  sed -i 's/incremental:no/LTCG \/OPT:ICF/g' $i
  sed -i -E 's/base:"[^"]+"/dynamicbase/g' $i
  sed -i 's/link.exe \/lib/link.exe \/lib  \/LTCG/g' $i
  sed -i 's/RSC=rc.exe/RSC=rc.exe \/nologo/g' $i
done

sed -i -E 's/base:@.*/nologo/g' $4/apr-iconv/build/modules.mk.win
# sed -i 's/incremental:no/LTCG \/OPT:ICF/g' $4/apr-iconv/build/modules.mk.win
sed -i 's/ \/MDd \/Zi \/Od / \/GL \/GS- \/guard:cf- \/GF \/LD \/MD \/Ox \/Zc:inline \/wd4267 \/wd4018 \/wd4244 \/MP'$3' '$1' /g' $4/apr-iconv/build/modules.mk.win

# https://www.apachelounge.com/viewtopic.php?t=8260
# https://docs.microsoft.com/fr-fr/cpp/porting/modifying-winver-and-win32-winnt?view=vs-2019
sed -i 's/_WIN32_WINNT 0x0501/_WIN32_WINNT 0x0601/g' $4/apr/include/apr.hw