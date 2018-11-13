REM set CMAKE_BUILD_TYPE=Release
set CMAKE_BUILD_TYPE=RelWithDebInfo

REM https://msdn.microsoft.com/fr-fr/library/afyyse50.aspx
REM /S	Supprime l'affichage des commandes ex�cut�es. Pour supprimer l'affichage dans une partie d'un makefile, utilisez le modificateur de commande @ ou .SILENT. Pour d�finir ou supprimer l'option /S pour une partie d'un makefile, utilisez !CMDSWITCHES.
REM /A	Force la g�n�ration de toutes les cibles �valu�es, m�me quand elles ne sont pas obsol�tes par rapport aux d�pendants. Ne force pas la g�n�ration de cibles non apparent�es.
REM /B	Force la g�n�ration m�me quand les horodatages co�ncident. Recommand�e uniquement pour les syst�mes tr�s rapides (r�solution de deux secondes au plus).
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

rmdir /S /Q C:\httpd-sdk\build
rmdir /S /Q C:\httpd-sdk\install
mklink /J C:\httpd-sdk\build C:\httpd-sdk\build_%ARCH%%AVXB%
mklink /J C:\httpd-sdk\install C:\httpd-sdk\install_%ARCH%%AVXB%
set PATH=c:\python27;C:\PROGRA~1\Git\bin;C:\bin\nasm;c:\perl\bin;c:\perl\site\bin;c:\bin;C:\Windows\SysWOW64;C:\msvc15\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;C:\Windows\SysWOW64\wbem;c:\cyg%CYGV%\bin;C:\php72-sdk\bin\php
call C:\msvc15\VC\Auxiliary\Build\vcvarsall.bat %ARCH%
cd /D C:\httpd-sdk