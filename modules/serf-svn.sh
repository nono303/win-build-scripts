/usr/bin/find /cygdrive/c/httpd-sdk/build/serf -type f -name "build.make" -exec sed -i 's/\/INCREMENTAL/\/LTCG \/OPT:ICF/g' {} \;
/usr/bin/find /cygdrive/c/httpd-sdk/build/serf -type f -name "build.make" -exec sed -i 's/serf-2.lib @CMakeFiles/serf-2.lib \/LTCG @CMakeFiles/g' {} \;
/usr/bin/find /cygdrive/c/httpd-sdk/build/serf -type f -name "flags.make" -exec sed -i 's/ \/O2 / \/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/Zc:inline \/MP8 \/LD \/MD \/Ox \/wd4267 \/wd4702 \/wd4244 \/wd4018 \/wd4090 \/wd4189 '$1' /g' {} \;
/usr/bin/find /cygdrive/c/httpd-sdk/build/serf -type f -name "flags.make" -exec sed -i 's/\/W3//g' {} \;