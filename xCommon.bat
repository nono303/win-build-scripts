REM set CMAKE_BUILD_TYPE=Release
set CMAKE_BUILD_TYPE=RelWithDebInfo
set WKITVER=10.0.17134.0

REM https://msdn.microsoft.com/fr-fr/library/afyyse50.aspx
REM /S	Supprime l'affichage des commandes exécutées. Pour supprimer l'affichage dans une partie d'un makefile, utilisez le modificateur de commande @ ou .SILENT. Pour définir ou supprimer l'option /S pour une partie d'un makefile, utilisez !CMDSWITCHES.
REM /A	Force la génération de toutes les cibles évaluées, même quand elles ne sont pas obsolètes par rapport aux dépendants. Ne force pas la génération de cibles non apparentées.
REM /B	Force la génération même quand les horodatages coïncident. Recommandée uniquement pour les systèmes très rapides (résolution de deux secondes au plus).
set NMAKE_OPTS=/S /NOLOGO

REM https://stackoverflow.com/questions/601970/how-do-i-utilise-all-the-cores-for-nmake
set CL=/MP

REM AVX || SSE2 https://msdn.microsoft.com/fr-fr/library/7t5yh4fd.aspx
set AVX=/arch:AVX
if DEFINED AVX (
	SET AVXB=-avx
)

set EXTCFLAGS=/GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox %AVX%

set MODULE_BAT_DIR=C:\httpd-sdk\modules_bat\

cd /D C:\httpd-sdk\build
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
rmdir /S /Q C:\httpd-sdk\install
mklink /J C:\httpd-sdk\install C:\httpd-sdk\install_%ARCH%%AVXB%
set PHPDEPS=C:\php72-sdk\phpmaster\vc15\%ARCH%\depsnono
set PATH=c:\python27;C:\PROGRA~1\Git\bin;C:\bin\nasm;c:\perl\bin;c:\perl\site\bin;c:\bin;C:\Windows\SysWOW64;C:\msvc15\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;C:\Windows\SysWOW64\wbem;c:\cyg%CYGV%\bin;C:\php72-sdk\bin\php
call C:\msvc15\VC\Auxiliary\Build\vcvarsall.bat %ARCH%
echo on
cd /D C:\httpd-sdk