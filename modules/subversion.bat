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

@echo off

for %%X in (exe dll so) do (
	for /f "tokens=*" %%G in ('dir %PATH_SRC%\subversion\Release\*.%%X /s/b') do (
		xcopy /C /F /Y %%~pG%%~nG.%%X %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%\%%~nG.%%X
		xcopy /C /F /Y %%~pG%%~nG.pdb %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%\%%~nG.pdb
	)
)
set DEPS=\deps
if not exist %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\. mkdir %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\
if %ARCH% == x64 (set sslarch=-x64)
if %ARCH% == x86 (set sslarch=)
for %%F in (libssl-1_1%sslarch% libcrypto-1_1%sslarch% libexpat libapr-1 libapriconv-1 libaprutil-1 brotlienc brotlicommon brotlidec libserf-2 zlib1) do (
	for %%X in (dll pdb) do (
		xcopy /C /F /Y %PATH_INSTALL%\bin\%%F.%%X  %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\%%F.%%X 
	)
)