# c-ares, brotli
/usr/bin/find $2 -type f -name "build.make" -exec sed -i 's/\/INCREMENTAL/\/LTCG \/OPT:ICF/g' {} \;
/usr/bin/find $2 -type f -name "build.make" -exec sed -i 's/static.lib @CMakeFiles/static.lib \/LTCG @CMakeFiles/g' {} \;
/usr/bin/find $2 -type f -name "flags.make" -exec sed -i 's/ \/O2 / \/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/Zc:inline \/MP'$3' \/LD \/MD \/Ox '$1' \/wd4334 \/wd4090 \/wd4996 \/wd4267 \/wd4244 /g' {} \;