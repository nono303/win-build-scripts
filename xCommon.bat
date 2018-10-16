REM set CMAKE_BUILD_TYPE=Release
set CMAKE_BUILD_TYPE=RelWithDebInfo
REM /S : don't display cmd line
set NMAKE_OPTS=/S /B /NOLOGO
REM https://stackoverflow.com/questions/601970/how-do-i-utilise-all-the-cores-for-nmake
set CL=/MP

REM AVX || SSE2 https://msdn.microsoft.com/fr-fr/library/7t5yh4fd.aspx
set AVX=/arch:AVX
if DEFINED AVX (
	SET AVXB=-avx
)
set EXTCFLAGS=/GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox %AVX%

set MODULE_BAT_DIR=C:\httpd-sdk\modules_bat\
rmdir /S /Q C:\httpd-sdk\build
rmdir /S /Q C:\httpd-sdk\install
mklink /j C:\httpd-sdk\build C:\httpd-sdk\build_%ARCH%%AVXB%
mklink /j C:\httpd-sdk\install C:\httpd-sdk\install_%ARCH%%AVXB%
set PATH=c:\python27;C:\PROGRA~1\Git\bin;C:\bin\nasm;c:\perl\bin;c:\perl\site\bin;c:\bin;C:\Windows\SysWOW64;C:\msvc15\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;C:\Windows\SysWOW64\wbem;c:\cyg%CYGV%\bin;C:\php72-sdk\bin\php
call C:\msvc15\VC\Auxiliary\Build\vcvarsall.bat %ARCH%
cd /D C:\httpd-sdk