cd /D %PATH_SRC%\mod_maxminddb\
git reset --hard
git clean -fdx
git apply c:\httpd-sdk\modules_bat\mod_maxminddb.patch
