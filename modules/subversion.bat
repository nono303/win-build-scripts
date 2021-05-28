@echo off && call %PATH_MODULES_COMMON%\init.bat %1

	REM ~~~~~~~~~~~~ Create Outdir
set OUTDIR_CONF=Release
if not exist %PATH_SRC%\%1\%OUTDIR_CONF%-%ARCH%\. mkdir %PATH_SRC%\%1\%OUTDIR_CONF%-%ARCH%
if not exist %PATH_SRC%\%1\%OUTDIR_CONF%\. mklink /J %PATH_SRC%\%1\%OUTDIR_CONF% %PATH_SRC%\%1\%OUTDIR_CONF%-%ARCH%

	REM ~~~~~~~~~~~~ Configure
python gen-make.py ^
	--release ^
	-t vcproj ^
	--vsnet-version=2017 ^
	--with-jdk=%JAVA_HOME% ^
	--with-serf=%PATH_INSTALL%\include ^
	--with-sqlite=%PATH_SRC%\sqlite ^
	--with-openssl=%PATH_INSTALL% ^
	--with-apr-util=%PATH_INSTALL% ^
	--with-apr=%PATH_INSTALL% ^
	--with-apr-iconv=%PATH_INSTALL% ^
	--with-zlib=%PATH_INSTALL% ^
	--with-apr_memcache=%PATH_INSTALL% ^
	--with-httpd=%PATH_INSTALL% 

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/build/win32/vcnet-vcproj/" %AVXVCX% %PTFTS% %WKITVER%

	REM ~~~~~~~~~~~~ Make
		REM /t:__ALL_TESTS__;
MSBuild.exe subversion_vcnet.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4702;LNK4087;MSB8065;C4703;C4132;C4389;C4244;C4245;C4267;C4018;C4334;C4189;C4312;C4090;C4152;C4146 ^
	/t:Clean;__ALL__:Rebuild;__JAVAHL__:Rebuild ^
	/p:Configuration=%OUTDIR_CONF% ^
	/p:Platform=%archmsbuild%

	REM ~~~~~~~~~~~~ Copy Release
for %%X in (exe dll so) do (
	for /f "tokens=*" %%G in ('dir %PATH_SRC%\%1\%OUTDIR_CONF%\*.%%X /s/b') do (
		xcopy /C /F /Y %%~pG%%~nG.%%X %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%\*
		xcopy /C /F /Y %%~pG%%~nG.pdb %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%\*
	)
)

	REM ~~~~~~~~~~~~ Copy Deps
set DEPS=\deps
if not exist %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\. mkdir %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\
if %ARCH% == x64 (set sslarch=-x64)
if %ARCH% == x86 (set sslarch=)
for %%F in (libssl-1_1%sslarch% libcrypto-1_1%sslarch% libexpat libapr-1 libapriconv-1 libaprutil-1 brotlienc brotlicommon brotlidec libserf-2 zlib1) do (
	for %%X in (dll pdb) do (
		xcopy /C /F /Y %PATH_INSTALL%\bin\%%F.%%X  %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\*
	)
)
	REM Launch TESTS
REM cd /D C:\sdk\src\subversion
REM win-tests.py --release --cleanup --parallel