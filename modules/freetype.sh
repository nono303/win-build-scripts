for i in `/usr/bin/find $1 -type f -name "*.vcxproj" 2>/dev/null` 
do
  sed -i 's/<\/Lib>/<\/Lib><Link><\/Link>/g' $i
done
