REM ########################## change Prompt charset
REM https://ss64.com/nt/chcp.html
REM CHCP 65001 > tee: 'standard output': Permission denied > accents
CHCP 1251 

REM ########################## PATHS
set PATH_HTTPD_SDK=C:\httpd-sdk
set PATH_BUILD=%PATH_HTTPD_SDK%\build
set SEDPATH_BUILD=C:\\\\httpd-sdk\\\\build
set PATH_INSTALL=%PATH_HTTPD_SDK%\install
set PATH_MODULES=%PATH_HTTPD_SDK%\modules
set PATH_MODULES_COMMON=%PATH_MODULES%\common
set PATH_LOGS=%PATH_HTTPD_SDK%\_logs
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
	REM sysinternals, nirsoft, etc.
set PATH_BIN_MISC=C:\bin
set PATH_BIN_CYGWIN=C:\cyg%CYGV%\bin
	REM svn for mobac
SET PATH_BIN_SVN=D:\github\NONO_subversion\vs16\x64;D:\github\NONO_subversion\vs16\x64\deps

	REM ant & java for mobac
SET ANT_HOME=C:\Program Files\Eclipse\plugins\org.apache.ant_1.10.7.v20190926-0324
SET JAVA_HOME=C:\jdk8\x64

	REM CYGWIN PATH
FOR /F "tokens=* USEBACKQ" %%F IN (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_SRC%`) DO (SET CYGPATH_SRC=%%F)
FOR /F "tokens=* USEBACKQ" %%F IN (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_MODULES%`) DO (SET CYGPATH_MODULES=%%F)
FOR /F "tokens=* USEBACKQ" %%F IN (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_MODULES_COMMON%`) DO (SET CYGPATH_MODULES_COMMON=%%F)
FOR /F "tokens=* USEBACKQ" %%F IN (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_HTTPD_SDK%`) DO (SET CYGPATH_HTTPD_SDK=%%F)
FOR /F "tokens=* USEBACKQ" %%F IN (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_BUILD%`) DO (SET CYGPATH_BUILD=%%F)

set PATH_WIN=%PATH_BIN_PYTHON%;%PATH_BIN_GIT%;%PATH_BIN_NASM%;%PATH_BIN_PERL%;%PATH_BIN_PERL_SITE%;%PATH_BIN_MISC%;%PATH_BIN_CYGWIN%;%PATH_BIN_SVN%;%PATH_VS%\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;%PATH_PHP_SDK%\bin\php;C:\Windows;C:\Windows\SysWOW64;C:\Windows\SysWOW64\wbem;C:\Windows\system32;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;

cd /D %PATH_HTTPD_SDK%

REM ########################## CMAKE BUILD TYPE
set CMAKE_BUILD_TYPE=RelWithDebInfo
	REM set CMAKE_BUILD_TYPE=Release

REM ########################## WINDOWS KIT VERSION
	REM C:\Program Files (x86)\Windows Kits\10\Lib
set WKITVER=10.0.18362.0

REM ########################## NMAKE OPTIONS
	REM https://msdn.microsoft.com/fr-fr/library/afyyse50.aspx
	REM /S	Supprime l'affichage des commandes exécutées. Pour supprimer l'affichage dans une partie d'un makefile, utilisez le modificateur de commande @ ou .SILENT. Pour définir ou supprimer l'option /S pour une partie d'un makefile, utilisez !CMDSWITCHES.
	REM /A	Force la génération de toutes les cibles évaluées, même quand elles ne sont pas obsolètes par rapport aux dépendants. Ne force pas la génération de cibles non apparentées.
	REM /B	Force la génération même quand les horodatages coïncident. Recommandée uniquement pour les systèmes très rapides (résolution de deux secondes au plus).
set NMAKE_OPTS=/S /NOLOGO

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
if exist %PATH_BUILD%\. rmdir /S /Q %PATH_BUILD%
mkdir %PATH_BUILD% 