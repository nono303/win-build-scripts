REM ########################## change Prompt charset
REM https://ss64.com/nt/chcp.html
REM CHCP 65001 > tee: 'standard output': Permission denied > accents
CHCP 1251 

REM ########################## DEBUG (just echo for all build)
set DEBUG_BUILD=0

REM ########################## GLOBAL PATH
	REM sdk
set PATH_SDK_ROOT=C:\sdk
set PATH_BATCH=%PATH_SDK_ROOT%\batch
set PATH_BUILDROOT=%PATH_SDK_ROOT%\build

set PATH_MODULES=%PATH_BATCH%\modules
set PATH_MODULES_COMMON=%PATH_MODULES%\common
set PATH_UTILS=%PATH_BATCH%\utils
set PATH_LOGS=%PATH_SDK_ROOT%\logs
set PATH_SRC=%PATH_SDK_ROOT%\src
set PATH_PHP_SDK=%PATH_SRC%\php-sdk
set PATH_SOFTS=%PATH_SDK_ROOT%\softs
set PATH_ROOT_CYGWIN=%PATH_SOFTS%\cyg

REM ########################## RELEASE PATH
set PATH_RELEASE=%PATH_SDK_ROOT%\release
set PATH_RELEASE_SVN=D:\github\NONO_subversion
	REM cygwin format
set PATH_RELEASE_MEMCACHED=/cygdrive/d/github/NONO_memcached/cygwin
	REM copy for github : unset to disable
set PATH_GITHUB_PHPMEMCACHE=D:\github\NONO_PHP-memcache-dll
set PATH_GITHUB_MODMD=D:\github\NONO_mod_md
set FOLDER_RELEASE_CURL=_curl
	REM JDK root (gradle & java for mobac, java_hl for subversion)
set JAVA_HOME=%PATH_SOFTS%\openjdk
set GRADLE_USER_HOME=%PATH_SOFTS%\gradle

REM ########################## BIN PATH
set PATH_VS=%PATH_SOFTS%\vs22\Community
set PATH_BIN_GIT=C:\PROGRA~1\Git\bin
set PATH_BIN_PYTHON=%PATH_SOFTS%\python3;%PATH_SOFTS%\python3\Scripts
set PATH_BIN_CYGWIN=%PATH_ROOT_CYGWIN%%CYGV%\bin
set PATH_BIN_NASM=%PATH_SOFTS%\nasm
set PATH_BIN_PERL=%PATH_SOFTS%\perl\bin
set PATH_BIN_PERL_SITE=%PATH_SOFTS%\perl\site\bin
	REM svn for mobac https://github.com/nono303/win-svn
set PATH_BIN_SVN=%PATH_RELEASE_SVN%\vs16\x64-avx
set PATH_DEPS_SVN=%PATH_RELEASE_SVN%\vs16\x64-avx\deps
	REM for version patch if not present at build - https://github.com/pavel-a/ddverpatch (old https://www.nuget.org/packages/verpatch/1.0.14 / https://www.codeproject.com/Articles/37133/Simple-Version-Resource-Tool-for-Windows)
set BIN_VERPATCH=%PATH_SOFTS%\verpatch.exe
	REM for testing matching pdb with exe and dll http://www.debuginfo.com/tools/chkmatch.html
set BIN_CHKMATCH=%PATH_SOFTS%\ChkMatch.exe
	REM for php-desp https://www.7-zip.org/download.html
set BIN_SEVENZ=%PATH_SOFTS%\7z\7z.exe
	REM for testing dependencies https://github.com/lucasg/Dependencies
set BIN_DEPENDS=%PATH_SOFTS%\dependencies\Dependencies.exe
	REM for checking version https://docs.microsoft.com/fr-fr/sysinternals/downloads/sigcheck
set BIN_SYGCHECK=%PATH_SOFTS%\sigcheck64.exe
	REM Visual Studio installer (surrounded with quote)
set BIN_VSINSTALLER="C:\Program Files (x86)\Microsoft Visual Studio\Installer\vs_installer.exe"

REM ########################## CYGWIN PATH
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_SRC%`) do (set CYGPATH_SRC=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_MODULES%`) do (set CYGPATH_MODULES=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_MODULES_COMMON%`) do (set CYGPATH_MODULES_COMMON=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_BATCH%`) do (set CYGPATH_BATCH=%%F)
FOR /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_UTILS%`) do (set CYGPATH_UTILS=%%F)

REM ########################## set SYSTEM PATH
set PATH_WIN=%PATH_BIN_PYTHON%;^
%PATH_BIN_GIT%;^
%PATH_BIN_NASM%;^
%PATH_BIN_PERL%;^
%PATH_BIN_PERL_SITE%;^
%PATH_BIN_CYGWIN%;^
%PATH_BIN_SVN%;^
%PATH_DEPS_SVN%;^
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

REM ########################## BUILD OPTION
	REM see dir in %PATH_ROOTWKIT%\Lib
set WKITVER=10.0.20348.0
FOR /F "tokens=* USEBACKQ" %%F in (`dir /b %PATH_VS%\VC\Tools\MSVC ^| grep %vcvars_ver%`) do (set VCTOOLSVER=%%F)

set NMAKE_OPTS_DBG=/NOLOGO
set NMAKE_OPTS_REL=/S %NMAKE_OPTS_DBG%

set MSBUILD_OPTS_COM=/nologo ^
	/m:%NUMBER_OF_PROCESSORS% ^
	/p:Turbo=true ^
	/p:CL_MPCount=%NUMBER_OF_PROCESSORS% ^
	/p:RunCodeAnalysis=false ^
	/p:DebugType=None ^
	/p:DebugSymbols=true ^
	/p:WindowsTargetPlatformVersion=%WKITVER% ^
	/p:PlatformToolset=v%PTFTS%
set MSBUILD_OPTS_DBG=%MSBUILD_OPTS_COM% ^
	/clp:EnableMPLogging;Summary;ShowCommandLine ^
	/v:d
set MSBUILD_OPTS_REL=%MSBUILD_OPTS_COM% ^
	/clp:EnableMPLogging;NoSummary;NoItemAndPropertyList ^
	/nowarn:MSB8012;C4244 ^
	/v:m

set CMAKE_OPTS_DBG=-G "NMake Makefiles"
set CMAKE_OPTS_REL=-Wno-dev ^
	%CMAKE_OPTS_DBG%
	REM set CMAKE_BUILD_TYPE=Release
set CMAKE_BUILD_TYPE=RelWithDebInfo

	REM for updating *.rc
set RC_COPYRIGHT=https://github.com/nono303/win-build-scripts

REM ########################## INIT PATH
if not exist %PATH_LOGS%\. mkdir %PATH_LOGS%
if not exist %PATH_BUILDROOT%\. mkdir %PATH_BUILDROOT%
for %%X in (vs16_x86-avx vs16_x64-avx vs16_x86 vs16_x64 vc15_x86-avx vc15_x64-avx vc15_x86 vc15_x64) do (
	if not exist %PATH_RELEASE%\%%X\. mkdir %PATH_RELEASE%\%%X
	if not exist %PATH_BUILDROOT%\%%X\. mkdir %PATH_BUILDROOT%\%%X
)

REM ########################## LOCAL COPY PATH
REM copy MOBAC, PROJ & GEOGRAPHICLIB release to LOCAL_PATH_XXX if LOCAL_COPY=1 && LOCAL_COPY_AVXECHO == AVXECHO && LOCAL_COPY_MSVC_VER == MSVC_VER
set LOCAL_COPY=1
set LOCAL_COPY_AVXECHO=avx
set LOCAL_COPY_MSVC_VER=16
set LOCAL_PATH_MOBAC=C:\PROGRA~2\mobac
set LOCAL_PATH_PROJ=B:\serveur\_gis\proj
set LOCAL_PATH_GEOGRAPHICLIB=B:\serveur\_gis\geographiclib