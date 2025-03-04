@echo off
set MOD_ZSTD_PATH=%PATH_SRC%\%1
set MOD_ZSTD_RELEASE=%MSVC_DEPS%_%ARCH%%AVXB%

if not exist %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\. mkdir %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%
if NOT "%C_STD_VER%"=="" (set __CNFC=/std:c%C_STD_VER%)

call %PATH_MODULES_COMMON%\init.bat httpd varonly
set HTTPD_VERSION=%SCM_TAG%
call %PATH_MODULES_COMMON%\init.bat %1 varonly

cl.exe /nologo ^
-IC:\sdk\release\vs17_x64-avx2\include ^
/std:clatest ^
/DWIN32 /DNDEBUG /D_WINDOWS ^
/w /MD /Zi /Gw /Gy /Zc:inline /O2 /Ob3 /Zf /FS /GL /MP16 /cgthreads8 ^
%AVX% %__CNFC% ^
-DLONG_NAME="mod_zstd for Apache HTTP Server" ^
-DBIN_NAME=mod_zstd.so ^
/Fo%MOD_ZSTD_PATH%\releases\mod_zstd.c.obj ^
/Fd%MOD_ZSTD_PATH%\releases\ ^
-c %MOD_ZSTD_PATH%\mod_zstd.c

link.exe /NOLOGO ^
%MOD_ZSTD_PATH%\releases\mod_zstd.c.obj ^
/out:%MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\mod_zstd.so ^
/implib:%MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\mod_zstd.lib ^
/pdb:%MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\mod_zstd.pdb ^
/dll /machine:x64 /DEBUG /LTCG /OPT:REF,ICF ^
C:\sdk\release\vs17_x64-avx2\lib\libzstd.lib ^
C:\sdk\release\vs17_x64-avx2\lib\libhttpd.lib ^
C:\sdk\release\vs17_x64-avx2\lib\libapr-1.lib ^
C:\sdk\release\vs17_x64-avx2\lib\libaprutil-1.lib

call do_php %PATH_UTILS%\sub\version.php %1 %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\mod_zstd.so "httpd:%HTTPD_VERSION%"

REM if exist %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%.zip rm -fv %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%.zip
REM rm -fv %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\mod_zstd.exp
REM rm -fv %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\mod_zstd.lib
REM call go zstd nolog
REM xcopy /C /F /Y %PATH_INSTALL%\bin\libzstd.pdb %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\*
REM xcopy /C /F /Y %PATH_INSTALL%\bin\libzstd.dll %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\*
REM %BIN_SEVENZ% a -tzip -y -ba -bso1 %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%.zip %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\*.*
