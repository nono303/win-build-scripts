REM ########################## PATHS
set PATH_HTTPD_SDK=C:\httpd-sdk
set PATH_BUILD=%PATH_HTTPD_SDK%\build
set PATH_INSTALL=%PATH_HTTPD_SDK%\install
set PATH_MODULE_BAT=%PATH_HTTPD_SDK%\modules_bat
set PATH_PHP_SDK=C:\php72-sdk
set PATH_SRC=c:\src

	REM dir /X > C:\Program Files (x86)\Microsoft Visual Studio\2019\Community
set PATH_VS=C:\PROGRA~2\MICROS~1\2019\Community
	
	REM INSTALL BIN PATH
set PATH_BIN_PYTHON=c:\python27
set PATH_BIN_GIT=C:\PROGRA~1\Git\bin
set PATH_BIN_NASM=C:\bin\nasm
set PATH_BIN_PERL=C:\perl\bin
set PATH_BIN_PERL_SITE=C:\perl\site\bin
set PATH_BIN_MISC=C:\bin
set PATH_BIN_CYGWIN=C:\cyg%CYGV%\bin

	REM CYGWIN PATH
FOR /F "tokens=* USEBACKQ" %%F IN (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_SRC%`) DO (SET CYGPATH_SRC=%%F)
FOR /F "tokens=* USEBACKQ" %%F IN (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_MODULE_BAT%`) DO (SET CYGPATH_MODULE_BAT=%%F)
FOR /F "tokens=* USEBACKQ" %%F IN (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_HTTPD_SDK%`) DO (SET CYGPATH_HTTPD_SDK=%%F)

set PATH_WIN=%PATH_BIN_PYTHON%;%PATH_BIN_GIT%;%PATH_BIN_NASM%;%PATH_BIN_PERL%;%PATH_BIN_PERL_SITE%;%PATH_BIN_MISC%;%PATH_BIN_CYGWIN%;%PATH_VS%\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;%PATH_PHP_SDK%\bin\php;C:\Windows;C:\Windows\SysWOW64;C:\Windows\SysWOW64\wbem;C:\Windows\system32;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;

cd /D %PATH_HTTPD_SDK%

REM ########################## CMAKE BUILD TYPE
set CMAKE_BUILD_TYPE=RelWithDebInfo
	REM set CMAKE_BUILD_TYPE=Release

REM ########################## WINDOWS KIT VERSION
	REM C:\Program Files (x86)\Windows Kits\10\Lib
set WKITVER=10.0.18362.0

REM ########################## NMAKE OPTIONS
	REM https://msdn.microsoft.com/fr-fr/library/afyyse50.aspx
	REM /S	Supprime l'affichage des commandes ex�cut�es. Pour supprimer l'affichage dans une partie d'un makefile, utilisez le modificateur de commande @ ou .SILENT. Pour d�finir ou supprimer l'option /S pour une partie d'un makefile, utilisez !CMDSWITCHES.
	REM /A	Force la g�n�ration de toutes les cibles �valu�es, m�me quand elles ne sont pas obsol�tes par rapport aux d�pendants. Ne force pas la g�n�ration de cibles non apparent�es.
	REM /B	Force la g�n�ration m�me quand les horodatages co�ncident. Recommand�e uniquement pour les syst�mes tr�s rapides (r�solution de deux secondes au plus).
set NMAKE_OPTS=/S /NOLOGO

REM ########################## BUILD CORES
	REM https://stackoverflow.com/questions/601970/how-do-i-utilise-all-the-cores-for-nmake
set MTPROC=1
set CL=/MP%MTPROC%

REM ########################## PHP DEPENDENCIES BUILD VAR
set INCLUDE=
set PHPDEPS=%PATH_PHP_SDK%\phpmaster\%MSVC_DEPS%\%ARCH%\depsnono

REM ########################## MAKE & CLEAN DIR
if not exist %PATH_HTTPD_SDK%\_logs\. mkdir %PATH_HTTPD_SDK%\_logs
if not exist %PATH_HTTPD_SDK%\release\vs16_x86-avx\. mkdir %PATH_HTTPD_SDK%\release\vs16_x86-avx
if not exist %PATH_HTTPD_SDK%\release\vs16_x64-avx\. mkdir %PATH_HTTPD_SDK%\release\vs16_x64-avx
if not exist %PATH_HTTPD_SDK%\release\vs16_x86\. mkdir %PATH_HTTPD_SDK%\release\vs16_x86
if not exist %PATH_HTTPD_SDK%\release\vs16_x64\. mkdir %PATH_HTTPD_SDK%\release\vs16_x64
if not exist %PATH_HTTPD_SDK%\release\vc15_x86-avx\. mkdir %PATH_HTTPD_SDK%\release\vc15_x86-avx
if not exist %PATH_HTTPD_SDK%\release\vc15_x64-avx\. mkdir %PATH_HTTPD_SDK%\release\vc15_x64-avx
if not exist %PATH_HTTPD_SDK%\release\vc15_x86\. mkdir %PATH_HTTPD_SDK%\release\vc15_x86
if not exist %PATH_HTTPD_SDK%\release\vc15_x64\. mkdir %PATH_HTTPD_SDK%\release\vc15_x64
if exist %PATH_BUILD%\. rmdir %PATH_BUILD% /s/q
mkdir %PATH_BUILD% 