mklink /H C:\httpd-sdk\install\lib\xml.lib C:\httpd-sdk\install\lib\expat.lib

call %MODULE_BAT_DIR%sqlite-svn.bat
call %MODULE_BAT_DIR%serf-svn.bat
call %MODULE_BAT_DIR%subversion-svn.bat

cd /D C:\httpd-sdk