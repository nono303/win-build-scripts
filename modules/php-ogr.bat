@echo off
cd /D C:\sdk\phpmaster\vs17\x64\php-src 

"cl.exe" ^
/nologo ^
/D_MBCS ^
/D_USE_MATH_DEFINES ^
/D_WINDOWS ^
/DCOMPILE_DL_OGR ^
/DFD_SETSIZE=2048 ^
/DHAVE_OGR_SRS_API_H=1 ^
/DNDEBUG ^
/DOGR_EXPORTS=1 ^
/DPHP_WIN32=1 ^
/DWIN32 ^
/DWINDOWS=1 ^
/DZEND_COMPILE_DL_EXT=1 ^
/DZEND_DEBUG=0 ^
/DZEND_WIN32=1 ^
/I . ^
/I main ^
/I Zend ^
/I TSRM ^
/I "%PATH_INSTALL%\_gdal\include" ^
/d2FuncCache1 ^
/EHsc ^
/FD ^
/FS ^
/GL ^
/Gw ^
/Gy ^
/LD ^
/MD ^
/MP%NUMBER_OF_PROCESSORS% ^
/O2 ^
/w ^
/Zc:__cplusplus ^
/Zc:inline ^
/Zc:wchar_t ^
/Zf ^
/Zi ^
%AVX% ^
/FoC:\sdk\src\php-sdk\phpmaster\vs17\x64\build\Release\pecl\php-ogr\ ^
/FpC:\sdk\src\php-sdk\phpmaster\vs17\x64\build\Release\pecl\php-ogr\ ^
/FRC:\sdk\src\php-sdk\phpmaster\vs17\x64\build\Release\pecl\php-ogr\ ^
/FdC:\sdk\src\php-sdk\phpmaster\vs17\x64\build\Release\pecl\php-ogr\ ^
/c ^
..\pecl\php-ogr\ogr.c ^
C:\sdk\src\gdal\apps\gdallocationinfo.cpp

"link.exe" C:\sdk\src\php-sdk\phpmaster\vs17\x64\build\Release\pecl\php-ogr\ogr.obj C:\sdk\src\php-sdk\phpmaster\vs17\x64\build\Release\php8.lib gdal.lib kernel32.lib ole32.lib user32.lib advapi32.lib shell32.lib ws2_32.lib Dnsapi.lib psapi.lib bcrypt.lib  ^
/out:"C:\Program Files\php\php_ogr.dll" ^
/dll ^
/nologo ^
/d2:-AllowCompatibleILVersions ^
/Incremental:no ^
/LTCG ^
/debug ^
/opt:ref,icf ^
/libpath:"%PATH_INSTALL%\_gdal\lib"

"link.exe" C:\sdk\src\php-sdk\phpmaster\vs17\x64\build\Release\pecl\php-ogr\gdallocationinfo.obj gdal.lib kernel32.lib ole32.lib user32.lib advapi32.lib shell32.lib ws2_32.lib Dnsapi.lib psapi.lib bcrypt.lib  ^
/out:"S:\telecharger\gdallocationinfo.exe" ^
/nologo ^
/d2:-AllowCompatibleILVersions ^
/Incremental:no ^
/LTCG ^
/debug ^
/opt:ref,icf ^
/libpath:"%PATH_INSTALL%\_gdal\lib"

xcopy /C /F /Y "C:\Program Files\php\php_ogr.dll" B:\serveur\php\*