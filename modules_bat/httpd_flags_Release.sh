/usr/bin/find /cygdrive/c/httpd-sdk/build/httpd -type f -name "build.make" -exec sed -i 's/\/INCREMENTAL:NO/\/LTCG \/OPT:ICF/g' {} \;
/usr/bin/find /cygdrive/c/httpd-sdk/build/httpd -type f -name "flags.make" -exec sed -i 's/\/W3 \/MD \/Zi \/O2/\/w/g' {} \;