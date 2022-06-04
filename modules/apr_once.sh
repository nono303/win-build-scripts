for i in `/usr/bin/find $2/apr-util -type f \( -iname \*.mak -o -iname \*.dsp -o -iname \*.win \) 2>/dev/null` 
do
  # openssl src dir
  sed -i 's/..\/openssl/..\/'$1'/g' $i
  sed -i 's/..\\openssl/..\\'$1'/g' $i
  # add ICU shared libs for sqlite3
  sed -i 's/sqlite3.lib/libsqlite3.lib icuuc.lib icuin.lib/g' $i
done
# https://www.apachelounge.com/viewtopic.php?t=8260 / https://docs.microsoft.com/fr-fr/cpp/porting/modifying-winver-and-win32-winnt?view=vs-2019
sed -i 's/_WIN32_WINNT 0x0501/_WIN32_WINNT 0x0601/g'   $2/apr/include/apr.hw
sed -i "s/MAKEOPT=-nologo/MAKEOPT=$3/g"                $2/apr-util/Makefile.win