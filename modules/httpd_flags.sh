for i in `/usr/bin/find $2/httpd/CMakeFiles -type f -name "build.make" 2>/dev/null` 
do
  # mod_wku-bt
  sed -i 's/diag.c.obj \/Fd/diag.c.obj \/D DIAG_BITS_'$1' \/Fd/g' $i
  sed -i 's/\/INCREMENTAL/\/LTCG \/OPT:ICF/g' $i
done

for i in `/usr/bin/find $2/httpd/CMakeFiles -type f -name "flags.make" 2>/dev/null` 
do
  sed -i 's/\/W3 \/MD \/Zi \/O2 \/Ob1/\/w \/O2 \/GL \/MD \/MP'$3' '$4' \/Zi/g' $i
  sed -i 's/RC_FLAGS = /RC_FLAGS = \/nologo /g' $i
done

	# \/DBUILDING_H264_STREAMING : http://h264.code-shop.com/trac#H264StreamingModule
sed -i 's/C_FLAGS = \/DWIN32/C_FLAGS = \/DWIN32 \/DBUILDING_H264_STREAMING/g' $2/httpd/CMakeFiles/mod_h264_streaming.dir/flags.make
	# C:\sdk\src\httpd\support\win32\ApacheMonitor.rc(21) : warning RC4005: 'LONG_NAME' : redefinition
sed -i 's/RC_FLAGS = \/nologo -DWIN32   -DAPP_FILE -DLONG_NAME=ApacheMonitor/RC_FLAGS = \/nologo -DWIN32   -DAPP_FILE/g' $2/httpd/CMakeFiles/ApacheMonitor.dir/flags.make
