@echo off && call %PATH_MODULES_COMMON%\init.bat %1

	REM ~~~~~~~~~~~~ Create Outdir
set OUTDIR_CONF=Release
if not exist %PATH_SRC%\%1\%OUTDIR_CONF%-%ARCH%\. mkdir %PATH_SRC%\%1\%OUTDIR_CONF%-%ARCH%
if not exist %PATH_SRC%\%1\%OUTDIR_CONF%\. mklink /J %PATH_SRC%\%1\%OUTDIR_CONF% %PATH_SRC%\%1\%OUTDIR_CONF%-%ARCH%

	REM ~~~~~~~~~~~~ Configure
python gen-make.py ^
--release ^
-t vcproj ^
--vsnet-version=2022 ^
--with-jdk=%JAVA_HOME% ^
--with-serf=%PATH_INSTALL%\include ^
--with-shared-serf ^
--with-sqlite=%PATH_INSTALL% ^
--with-openssl=%PATH_INSTALL% ^
--with-apr=%PATH_INSTALL% ^
--with-apr-iconv=%PATH_INSTALL% ^
--with-apr_memcache=%PATH_INSTALL% ^
--with-apr-util=%PATH_INSTALL% ^
--with-zlib=%PATH_INSTALL% ^
--with-httpd=%PATH_INSTALL%

if %ARG_KEEPSRC% == 0 (call do_php %PATH_MODULES_COMMON%/msbuild.php "%PATH_SRC%/%1/build/win32/vcnet-vcproj/" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER% nostd)

	REM ~~~~~~~~~~~~ fix javac nowarn
for %%V in (javahl-callback-java javahl-compat-java javahl-compat-tests javahl-java javahl-remote-java javahl-tests javahl-types-java javahl-util-java) do (
	sed -i 's/-Xlint -Xlint:-options -Xlint:-deprecation -Xlint:-dep-ann -Xlint:-rawtypes/-nowarn -Xlint:all -Xlint:-removal/g' %CYGPATH_SRC%/%1/build/win32/vcnet-vcproj/%%V.vcxproj
)

	REM ~~~~~~~~~~~~ Make (;__ALL_TESTS__)
MSBuild.exe subversion_vcnet.sln %MSBUILD_OPTS% ^
/t:Clean;__ALL__:Rebuild;__JAVAHL__:Rebuild ^
/nowarn:LNK4087;MSB8065 ^
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

REM ---------------------------- Launch TESTS from a terminal

REM cd %PATH_SRC%\%1
REM set PATH=%PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%
REM set PYTHONPATH=%PYTHONPATH%;%PATH_SRC%\%1\subversion\tests\cmdline
REM python win-tests.py --release --cleanup --parallel --bin=%PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%

REM ---------------------------- Cmake Build (wait for SVN_ENABLE_JAVAHL)

REM @echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx
REM 
REM if NOT "%ARG_SVN%" == "1" (
REM 	set PATH_INSTALL_SAV=%PATH_INSTALL%
REM 	set PATH_INSTALL=%PATH_INSTALL%.svn
REM )
REM 
REM cd /D %PATH_SRC%\%1
REM python gen-make.py ^
REM --release ^
REM -t cmake ^
REM --with-jdk=%JAVA_HOME% ^
REM --with-serf=%PATH_INSTALL%\include ^
REM --with-shared-serf ^
REM --with-sqlite=%PATH_INSTALL% ^
REM --with-openssl=%PATH_INSTALL% ^
REM --with-apr=%PATH_INSTALL% ^
REM --with-apr-iconv=%PATH_INSTALL% ^
REM --with-apr_memcache=%PATH_INSTALL% ^
REM --with-apr-util=%PATH_INSTALL% ^
REM --with-zlib=%PATH_INSTALL% ^
REM --with-httpd=%PATH_INSTALL% ^
REM --with-libintl=%PATH_INSTALL%
REM cd /D %PATH_BUILD%\%1
REM 
REM cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
REM -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL%\_svn ^
REM -DSVN_ENABLE_SVNXX=OFF ^
REM -DSVN_ENABLE_PROGRAMS=ON ^
REM -DSVN_ENABLE_TOOLS=ON ^
REM -DSVN_ENABLE_TESTS=OFF ^
REM -DSVN_TEST_EXPAND=OFF ^
REM -DSVN_TEST_CONFIGURE_FOR_PARALLEL=OFF ^
REM -DSVN_ENABLE_APACHE_MODULES=ON ^
REM -DSVN_ENABLE_SWIG_PERL=OFF ^
REM -DSVN_ENABLE_SWIG_PYTHON=OFF ^
REM -DSVN_ENABLE_SWIG_RUBY=OFF ^
REM -DSVN_ENABLE_RA_LOCAL=ON ^
REM -DSVN_ENABLE_RA_SERF=ON ^
REM -DSVN_ENABLE_RA_SVN=ON ^
REM -DSVN_ENABLE_FS_FS=ON ^
REM -DSVN_ENABLE_FS_X=ON ^
REM -DSVN_ENABLE_FS_BASE=OFF ^
REM -DSVN_ENABLE_NLS=OFF ^
REM -DSVN_ENABLE_AUTH_KWALLET=OFF ^
REM -DSVN_ENABLE_AUTH_GNOME_KEYRING=OFF ^
REM -DSVN_ENABLE_AUTH_GPG_AGENT=OFF ^
REM -DSVN_INSTALL_PRIVATE_H=OFF ^
REM -DBUILD_SHARED_LIBS=ON ^
REM -DSVN_DEBUG=OFF ^
REM -DSVN_USE_WIN32_CRASHHANDLER=OFF ^
REM -DSVN_USE_DSO=ON ^
REM -DSVN_USE_PKG_CONFIG=OFF ^
REM -DSVN_USE_INTERNAL_LZ4=ON ^
REM -DSVN_USE_INTERNAL_UTF8PROC=ON ^
REM -DSVN_SQLITE_USE_AMALGAMATION=OFF ^
REM %CMAKE_SERF% ^
REM %PATH_SRC%\%1
REM 
REM %PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
REM %NINJA% install
REM 
REM if NOT "%ARG_SVN%" == 1 (
REM 	set PATH_INSTALL=%PATH_INSTALL_SAV%
REM )