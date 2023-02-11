@echo off
cd /D C:\sdk\phpmaster\vs17\x64\php-src 

"cl.exe" ^
/EHsc ^
/DHAVE_OGR_SRS_API_H=1 ^
/D ZEND_COMPILE_DL_EXT=1 ^
/D COMPILE_DL_OGR ^
/D OGR_EXPORTS=1 ^
/nologo ^
/I . ^
/I main ^
/I Zend ^
/I TSRM ^
/I ext ^
/D _WINDOWS ^
/D WINDOWS=1 ^
/D ZEND_WIN32=1 ^
/D PHP_WIN32=1 ^
/D WIN32 ^
/D _MBCS ^
/D _USE_MATH_DEFINES ^
/FD ^
/w ^
/Zc:inline ^
/Gw ^
/Zc:__cplusplus ^
/d2FuncCache1 ^
/Zc:wchar_t ^
/MP16 ^
/Zi ^
/LD ^
/MD ^
/O2 ^
/GL ^
/Zf ^
/Gw ^
/Gy ^
/Zc:inline ^
/FS ^
/D PHP_ICONV_PREFIX=C:/sdk/release/vs17_x64-avx ^
/D NDebug ^
/D NDEBUG ^
/GF ^
/D ZEND_DEBUG=0 ^
/I "C:\sdk\release\vs17_x64-avx\include" ^
/I "C:\sdk\release\vs17_x64-avx\_openssl\openssl-quic\include" ^
/I "C:\sdk\release\vs17_x64-avx\_proj\include" ^
/I "C:\sdk\release\vs17_x64-avx\_gdal\include" ^
/D FD_SETSIZE=2048 ^
/arch:AVX ^
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
/NODEFAULTLIB:libcmt.lib ^
/debug ^
/opt:ref,icf ^
/libpath:"C:\sdk\release\vs17_x64-avx\lib" ^
/libpath:"C:\sdk\release\vs17_x64-avx\_openssl\openssl-quic\lib" ^
/libpath:"C:\sdk\release\vs17_x64-avx\_proj\lib" ^
/libpath:"C:\sdk\release\vs17_x64-avx\_gdal\lib"

"link.exe" C:\sdk\src\php-sdk\phpmaster\vs17\x64\build\Release\pecl\php-ogr\gdallocationinfo.obj gdal.lib kernel32.lib ole32.lib user32.lib advapi32.lib shell32.lib ws2_32.lib Dnsapi.lib psapi.lib bcrypt.lib  ^
/out:"S:\telecharger\gdallocationinfo.exe" ^
/nologo ^
/d2:-AllowCompatibleILVersions ^
/Incremental:no ^
/LTCG ^
/NODEFAULTLIB:libcmt.lib ^
/debug ^
/opt:ref,icf ^
/libpath:"C:\sdk\release\vs17_x64-avx\lib" ^
/libpath:"C:\sdk\release\vs17_x64-avx\_openssl\openssl-quic\lib" ^
/libpath:"C:\sdk\release\vs17_x64-avx\_proj\lib" ^
/libpath:"C:\sdk\release\vs17_x64-avx\_gdal\lib"

xcopy /C /F /Y "C:\Program Files\php\php_ogr.dll" B:\serveur\php\*