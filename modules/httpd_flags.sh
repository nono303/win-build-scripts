for i in `/usr/bin/find $2/httpd/CMakeFiles -type f -name "build.make" 2>/dev/null` 
do
  sed -i 's/diag.c.obj \/Fd/diag.c.obj \/D DIAG_BITS_'$1' \/Fd/g' $i
  sed -i 's/\/debug \/INCREMENTAL/\/debug \/LTCG \/OPT:ICF/g' $i
done
for i in `/usr/bin/find $2/httpd/CMakeFiles -type f -name "flags.make" 2>/dev/null` 
do
  sed -i 's/\/W3 \/MD \/Zi \/O2/\/w/g' $i
  sed -i 's/RC_FLAGS = /RC_FLAGS = \/nologo /g' $i
done
sed -i 's/\/w \/Ob1/\/w \/Ob1 \/GL \/GS- \/Oy- \/guard:cf- \/FD \/GF \/Zc:inline \/MP8 \/LD \/MD \/Zi \/Ox/g' $2/httpd/CMakeFiles/gen_test_char.dir/flags.make