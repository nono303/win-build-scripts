/usr/bin/find /cygdrive/c/httpd-sdk/build/sqlite-amalgamation -type f -name "build.make" -exec sed -i 's/\/INCREMENTAL/\/LTCG \/OPT:ICF/g' {} \;
/usr/bin/find /cygdrive/c/httpd-sdk/build/sqlite-amalgamation -type f -name "build.make" -exec sed -i 's/sqlite3.lib @CMakeFiles/sqlite3.lib \/LTCG @CMakeFiles/g' {} \;
/usr/bin/find /cygdrive/c/httpd-sdk/build/sqlite-amalgamation -type f -name "flags.make" -exec sed -i 's/ \/O2 / \/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/Zc:inline \/MP8 \/LD \/MD \/Ox \/wd4267 '$1' /g' {} \;