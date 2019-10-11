/usr/bin/find /cygdrive/c/httpd-sdk/src/libmaxminddb/projects/VS12 -type f -name "libmaxminddb.props" -exec sed -i 's/vc$(PlatformToolsetVersion).pdb/$(ProjectName).pdb/g' {} \;
