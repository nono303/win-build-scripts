/usr/bin/find /cygdrive/c/httpd-sdk/build/httpd -type f -name "build.make" -exec sed -i 's/\/machine:x64 \/INCREMENTAL:NO/\/machine:x64 \/LTCG \/NODEFAULTLIB:libcmt.lib \/OPT:ICF \/INCREMENTAL:NO/g' {} \;
/usr/bin/find /cygdrive/c/httpd-sdk/build/httpd -type f -name "flags.make" -exec sed -i 's/RC_FLAGS = \/DWIN32/RC_FLAGS = \/nologo \/DWIN32/g' {} \;
/usr/bin/find /cygdrive/c/httpd-sdk/build/httpd -type f -name "flags.make" -exec sed -i 's/\/W3 \/MD \/O2/\/GL \/GS- \/Oy- \/w \/guard:cf- \/FD \/GF \/Zc:inline \/MP8 \/LD \/MD \/Ox/g' {} \;

