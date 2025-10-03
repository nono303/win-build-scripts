@echo off

set MOD_ZSTD_PATH=%PATH_SRC%\%1
set J8_TEST=no

setlocal enabledelayedexpansion
set argCount=0
for %%x in (%*) do (
   set /A argCount+=1
   set "argVec[!argCount!]=%%~x"
)
for /L %%i in (2,1,%argCount%) do (
	if /I "!argVec[%%i]!"=="j8"		set J8_TEST=yes
	if /I "!argVec[%%i]!"=="cstream"	set MOD_ZSTD_BRANCH=.cstream
)

set MOD_ZSTD_RELEASE=%MSVC_DEPS%_%ARCH%%AVXB%
if not exist %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\. mkdir %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%
if NOT "%C_STD_VER%"=="" (set __CNFC=/std:c%C_STD_VER%)

FOR /F "tokens=* USEBACKQ" %%F in (`do_php %PATH_UTILS%\sub\version.php zstd`) do (set ZSTD_VERSION=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`do_php %PATH_UTILS%\sub\version.php httpd`) do (set HTTPD_VERSION=%%F)

call %PATH_MODULES_COMMON%\init.bat %1%MOD_ZSTD_BRANCH% varonly

cl.exe /nologo ^
-IC:\sdk\release\vs18_x64-avx2\include ^
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
C:\sdk\release\vs18_x64-avx2\lib\libzstd.lib ^
C:\sdk\release\vs18_x64-avx2\lib\libhttpd.lib ^
C:\sdk\release\vs18_x64-avx2\lib\libapr-1.lib ^
C:\sdk\release\vs18_x64-avx2\lib\libaprutil-1.lib

rm -fv %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\mod_zstd.exp
rm -fv %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\mod_zstd.lib
call do_php %PATH_UTILS%\sub\version.php %1 %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\mod_zstd.so "httpd:%HTTPD_VERSION% libzstd:%ZSTD_VERSION%"

if "%J8_TEST%"=="yes" (
	call C:\bin\wscc_sysinternals\pskill httpd
	rm -fv S:/httpd/modules/mod_zstd.*
	xcopy /C /F /Y %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\mod_zstd.* S:\httpd\modules\*
	net start Apache2.4
) else (
	if exist %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%.zip rm -fv %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%.zip
	REM call go zstd nolog
	xcopy /C /F /Y %PATH_INSTALL%\bin\libzstd.pdb %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\*
	xcopy /C /F /Y %PATH_INSTALL%\bin\libzstd.dll %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\*
	%BIN_SEVENZ% a -tzip -y -ba -bso1 %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%.zip %MOD_ZSTD_PATH%\releases\%MOD_ZSTD_RELEASE%\*.*
)