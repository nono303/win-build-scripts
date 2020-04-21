call %PATH_MODULES_COMMON%\init.bat %1

mkdir %PATH_SRC%\subversion\Release-%ARCH%
mklink /J %PATH_SRC%\subversion\Release %PATH_SRC%\subversion\Release-%ARCH%

python gen-make.py --release -t vcproj ^
--vsnet-version=2017 ^
--with-jdk=%PATH_JDK%\%ARCH% ^
--with-serf=%PATH_INSTALL%\include ^
--with-sqlite=%PATH_SRC%\sqlite ^
--with-openssl=%PATH_INSTALL% ^
--with-apr-util=%PATH_INSTALL% ^
--with-apr=%PATH_INSTALL% ^
--with-apr-iconv=%PATH_INSTALL% ^
--with-zlib=%PATH_INSTALL% ^
--with-apr_memcache=%PATH_INSTALL% ^
--with-httpd=%PATH_INSTALL% 

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/subversion/build/win32/vcnet-vcproj/" %AVXVCX% %PTFTS% %WKITVER%
	REM ;__ALL_TESTS__ 
MSBuild.exe subversion_vcnet.sln ^
/nowarn:C4702 ^
/nowarn:LNK4087 ^
/nowarn:MSB8065 ^
/nowarn:C4703 ^
/nowarn:C4132 ^
/nowarn:C4389 ^
/nowarn:C4244 ^
/nowarn:C4245 ^
/nowarn:C4267 ^
/nowarn:C4018 ^
/nowarn:C4334 ^
/nowarn:C4189 ^
/nowarn:C4312 ^
/nowarn:C4090 ^
/nowarn:C4152 ^
/nowarn:C4146 ^
/nologo ^
/m:%NUMBER_OF_PROCESSORS% ^
/t:Clean;__ALL__;__JAVAHL__ ^
/p:Configuration=Release ^
/p:Platform=%archmsbuild%  ^
/p:DebugSymbols=true ^
/p:DebugType=None

	REM *** CREATE RELEASE ***

set SVNOUTDIR=D:\github\NONO_subversion
@echo off
for %%X in (exe dll so) do (
	for /f "tokens=*" %%G in ('dir %PATH_SRC%\subversion\Release\*.%%X /s/b') do (
		echo on
		Copy /Y %%~pG%%~nG.%%X %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%\%%~nG.%%X
		Copy /Y %%~pG%%~nG.pdb %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%\%%~nG.pdb
	)
)
echo on

set DEPS=\deps
if not exist %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\. mkdir %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\
if %ARCH% == x64 (set sslarch=-x64)
@echo off
for %%X in (dll pdb) do (
	echo on
	Copy /Y %PATH_INSTALL%\bin\libssl-1_1%sslarch%.%%X  %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\libssl-1_1%sslarch%.%%X 
	Copy /Y %PATH_INSTALL%\bin\libcrypto-1_1%sslarch%.%%X  %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\libcrypto-1_1%sslarch%.%%X 
	Copy /Y %PATH_INSTALL%\bin\libexpat.%%X  %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\libexpat.%%X 
	Copy /Y %PATH_INSTALL%\bin\libapr-1.%%X  %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\libapr-1.%%X 
	Copy /Y %PATH_INSTALL%\bin\libapriconv-1.%%X  %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\libapriconv-1.%%X 
	Copy /Y %PATH_INSTALL%\bin\libaprutil-1.%%X  %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\libaprutil-1.%%X 
	Copy /Y %PATH_INSTALL%\bin\brotlienc.%%X  %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\brotlienc.%%X 
	Copy /Y %PATH_INSTALL%\bin\brotlicommon.%%X  %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\brotlicommon.%%X 
	Copy /Y %PATH_INSTALL%\bin\brotlidec.%%X  %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\brotlidec.%%X 
	Copy /Y %PATH_INSTALL%\bin\libserf-2.%%X  %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\libserf-2.%%X 
	Copy /Y %PATH_INSTALL%\bin\zlib1.%%X  %SVNOUTDIR%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\zlib1.%%X 
)