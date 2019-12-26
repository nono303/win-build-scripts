REM set CMAKE_BUILD_TYPE=Release
set CMAKE_BUILD_TYPE=RelWithDebInfo
set WKITVER=10.0.18362.0

REM https://msdn.microsoft.com/fr-fr/library/afyyse50.aspx
REM /S	Supprime l'affichage des commandes ex�cut�es. Pour supprimer l'affichage dans une partie d'un makefile, utilisez le modificateur de commande @ ou .SILENT. Pour d�finir ou supprimer l'option /S pour une partie d'un makefile, utilisez !CMDSWITCHES.
REM /A	Force la g�n�ration de toutes les cibles �valu�es, m�me quand elles ne sont pas obsol�tes par rapport aux d�pendants. Ne force pas la g�n�ration de cibles non apparent�es.
REM /B	Force la g�n�ration m�me quand les horodatages co�ncident. Recommand�e uniquement pour les syst�mes tr�s rapides (r�solution de deux secondes au plus).
set NMAKE_OPTS=/S /NOLOGO

REM https://stackoverflow.com/questions/601970/how-do-i-utilise-all-the-cores-for-nmake

SET MTPROC=8
set CL=/MP%MTPROC%

set MODULE_BAT_DIR=C:\httpd-sdk\modules_bat\

cd /D C:\httpd-sdk\build
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

set INCLUDE=
set PHPDEPS=C:\php72-sdk\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono
set PATHORI=c:\python27;C:\PROGRA~1\Git\bin;C:\bin\nasm;c:\perl\bin;c:\perl\site\bin;c:\bin;C:\Windows\SysWOW64;C:\msvc16\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;C:\Windows\SysWOW64\wbem;c:\cyg%CYGV%\bin;C:\php72-sdk\bin\php;C:\cyg64\bin;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\PROGRA~1\TortoiseGit\bin
cd /D C:\httpd-sdk
