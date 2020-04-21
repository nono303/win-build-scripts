for i in `/usr/bin/find $1 -type f -name "*.vcxproj" 2>/dev/null`
do
  sed -i -E '1s/^...//g' $i
  sed -i 's/jpeg.lib/'$2'.lib/g' $i
done