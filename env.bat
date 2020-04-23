REM ########################## change Prompt charset
REM https://ss64.com/nt/chcp.html
REM CHCP 65001 > tee: 'standard output': Permission denied > accents
CHCP 1251 

REM ########################## PATHS
set PATH_SDK_ROOT=C:\sdk
set PATH_BATCH=%PATH_SDK_ROOT%\batch
set PATH_BUILDROOT=%PATH_SDK_ROOT%\build
set PATH_RELEASE=%PATH_SDK_ROOT%\release
set PATH_MODULES=%PATH_BATCH%\modules
set PATH_MODULES_COMMON=%PATH_MODULES%\common
set PATH_LOGS=%PATH_SDK_ROOT%\logs

set PATH_PHP_SDK=%PATH_SDK_ROOT%\src\php-sdk
set PATH_SRC=%PATH_SDK_ROOT%\src
set PATH_JDK=%PATH_SDK_ROOT%\softs\jdk8

set PATH_VS=%PATH_SDK_ROOT%\softs\vs19\Community
	
	REM INSTALL BIN PATH
set PATH_BIN_GIT=C:\PROGRA~1\Git\bin
set PATH_BIN_PYTHON=%PATH_SDK_ROOT%\softs\python2
set PATH_ROOT_CYGWIN=%PATH_SDK_ROOT%\softs\cyg
set PATH_BIN_CYGWIN=%PATH_ROOT_CYGWIN%%CYGV%\bin
set PATH_BIN_NASM=%PATH_SDK_ROOT%\softs\nasm
set PATH_BIN_PERL=%PATH_SDK_ROOT%\softs\perl\bin
set PATH_BIN_PERL_SITE=%PATH_SDK_ROOT%\softs\perl\site\bin
	REM sysinternals, nirsoft, etc.
set PATH_BIN_MISC=C:\bin
	REM svn for mobac
set PATH_BIN_SVN=D:\github\NONO_subversion\vs16\x64;D:\github\NONO_subversion\vs16\x64\deps
	REM ant & java for mobac
set ANT_HOME=%PATH_SDK_ROOT%\softs\eclipse\plugins\org.apache.ant_1.10.7.v20190926-0324
set JAVA_HOME=%PATH_JDK%\x64
	REM outdir for memcached
set MEMCACHED_PREFIX=/cygdrive/d/github/NONO_memcached/cygwin

	REM for version patch if not present at build - https://www.codeproject.com/KB/install/VerPatch/verpatch-bin-1.0.10.zip
set BIN_VERPATCH=%PATH_SDK_ROOT%\softs\verpatch.exe
	REM for testing matching pdb with exe and dll http://www.debuginfo.com/tools/chkmatch.html
set BIN_CHKMATCH=%PATH_SDK_ROOT%\softs\ChkMatch.exe
	REM for php-desp https://www.7-zip.org/download.html
set BIN_SEVENZ=%PATH_SDK_ROOT%\softs\7z\7z.exe
	REM for testing dependencies https://github.com/lucasg/Dependencies
set BIN_DEPENDS=B:\bin\dependencies\Dependencies.exe
	REM for checking version https://docs.microsoft.com/fr-fr/sysinternals/downloads/sigcheck
set BIN_SYGCHECK=C:\bin\wscc_sysinternals\sigcheck64.exe

	REM CYGWIN PATH
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_SRC%`) do (set CYGPATH_SRC=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_MODULES%`) do (set CYGPATH_MODULES=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_MODULES_COMMON%`) do (set CYGPATH_MODULES_COMMON=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_BATCH%`) do (set CYGPATH_BATCH=%%F)

set PATH_WIN=%PATH_BIN_PYTHON%;^
%PATH_BIN_GIT%;^
%PATH_BIN_NASM%;^
%PATH_BIN_PERL%;^
%PATH_BIN_PERL_SITE%;^
%PATH_BIN_MISC%;^
%PATH_BIN_CYGWIN%;^
%PATH_BIN_SVN%;^
%PATH_VS%\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;^
%PATH_VS%\IDE;^
%PATH_PHP_SDK%\bin\php;^
C:\Windows;^
C:\Windows\SysWOW64;^
C:\Windows\SysWOW64\wbem;^
C:\Windows\system32;^
C:\Windows\System32\Wbem;^
C:\Windows\System32\WindowsPowerShell\v1.0\;

cd /D %PATH_BATCH%

REM ########################## CMAKE BUILD TYPE
	REM set CMAKE_BUILD_TYPE=Release
set CMAKE_BUILD_TYPE=RelWithDebInfo

REM ########################## NMAKE OPTIONS
	REM https://msdn.microsoft.com/fr-fr/library/afyyse50.aspx
	REM /S	Supprime l'affichage des commandes exécutées. Pour supprimer l'affichage dans une partie d'un makefile, utilisez le modificateur de commande @ ou .SILENT. Pour définir ou supprimer l'option /S pour une partie d'un makefile, utilisez !CMDSWITCHES.
	REM /A	Force la génération de toutes les cibles évaluées, même quand elles ne sont pas obsolètes par rapport aux dépendants. Ne force pas la génération de cibles non apparentées.
	REM /B	Force la génération même quand les horodatages coïncident. Recommandée uniquement pour les systèmes très rapides (résolution de deux secondes au plus).
set NMAKE_OPTS=/S /NOLOGO

REM ########################## WINDOWS KIT VERSION
	REM see dir in %PATH_ROOTWKIT%\Lib
set WKITVER=10.0.19041.0

REM ########################## MAKE & CLEAN DIR
if not exist %PATH_LOGS%\. mkdir %PATH_LOGS%
if not exist %PATH_BUILDROOT%\. mkdir %PATH_BUILDROOT%
for %%X in (vs16_x86-avx vs16_x64-avx vs16_x86 vs16_x64 vc15_x86-avx vc15_x64-avx vc15_x86 vc15_x64) do (
	if not exist %PATH_RELEASE%\%%X\. mkdir %PATH_RELEASE%\%%X
	if not exist %PATH_BUILDROOT%\%%X\. mkdir %PATH_BUILDROOT%\%%X
)