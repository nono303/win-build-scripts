
@echo off
	REM force native openssl
call quic 0

call %PATH_MODULES_COMMON%\init.bat %1

	REM ~~~~~~~~~~~~ Create Outdir
set OUTDIR_CONF=Release
if not exist %PATH_SRC%\%1\%OUTDIR_CONF%-%ARCH%\. mkdir %PATH_SRC%\%1\%OUTDIR_CONF%-%ARCH%
if not exist %PATH_SRC%\%1\%OUTDIR_CONF%\. mklink /J %PATH_SRC%\%1\%OUTDIR_CONF% %PATH_SRC%\%1\%OUTDIR_CONF%-%ARCH%

	REM ~~~~~~~~~~~~ Configure
python gen-make.py ^
--release ^
-t vcproj ^
--vsnet-version=2019 ^
--with-jdk=%JAVA_HOME% ^
--with-serf=%PATH_INSTALL%\include ^
--with-sqlite=%PATH_INSTALL% ^
--with-openssl=%PATH_INSTALL% ^
--with-apr=%PATH_INSTALL% ^
--with-apr-iconv=%PATH_INSTALL% ^
--with-apr_memcache=%PATH_INSTALL% ^
--with-apr-util=%PATH_INSTALL% ^
--with-zlib=%PATH_INSTALL% ^
--with-httpd=%PATH_INSTALL%

%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/build/win32/vcnet-vcproj/" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER% nostd
	REM ~~~~~~~~~~~~ fix serf lib name
for %%V in (conflict-data-test pristine-store-test client-test db-test wc-test entries-compat-test op-depth-test filesize-test conflicts-test libsvn_ra_dll) do (
	sed -i 's/serf-2\.lib/libserf-2\.lib/g'  %CYGPATH_SRC%/%1/build/win32/vcnet-vcproj/%%V.vcxproj
)
	REM ~~~~~~~~~~~~ fix javac nowarn
for %%V in (javahl-callback-java javahl-compat-java javahl-compat-tests javahl-java javahl-remote-java javahl-tests javahl-types-java javahl-util-java) do (
	sed -i 's/-Xlint -Xlint:-options -Xlint:-deprecation -Xlint:-dep-ann -Xlint:-rawtypes/-nowarn -Xlint:all/g'  %CYGPATH_SRC%/%1/build/win32/vcnet-vcproj/%%V.vcxproj
)

	REM ~~~~~~~~~~~~ Make (;__ALL_TESTS__)
MSBuild.exe subversion_vcnet.sln %MSBUILD_OPTS% ^
/t:Clean;__ALL__:Rebuild;__JAVAHL__:Rebuild ^
/nowarn:C4018;C4132;C4146;C4152;C4189;C4245;C4267;C4312;C4334;C4389;C4702;C4703;C4996;LNK4087;MSB8065 ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Platform=%archmsbuild%

	REM ~~~~~~~~~~~~ Copy Release
rm -fv "%PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%\*.*"
for %%X in (exe dll so) do (
	for /f "tokens=*" %%G in ('dir %PATH_SRC%\%1\%OUTDIR_CONF%\*.%%X /s/b') do (
		call do_php %PATH_UTILS%\sub\version.php %1 %%~pG%%~nG.%%X
		xcopy /C /F /Y %%~pG%%~nG.%%X %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%\*
		xcopy /C /F /Y %%~pG%%~nG.pdb %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%\*
	)
)

	REM Launch TESTS from a terminal
REM cd %PATH_SRC%\%1
REM set PATH=%PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%
REM set PYTHONPATH=%PYTHONPATH%;%PATH_SRC%\%1\subversion\tests\cmdline
REM python win-tests.py --release --cleanup --parallel --bin=%PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%