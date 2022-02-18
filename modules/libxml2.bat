@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM if -DLIBXML2_WITH_ICU=ON / don't use ICU bultin libs in C:\Windows Kits\10\Lib\10.0.22000.0\um\x64\
set LIB=%PATH_INSTALL%\lib;%LIB%
set INCLUDE=%PATH_INSTALL%\include;%INCLUDE%

REM OFF : static ON : shared
for %%C in (OFF ON) do (
	cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DBUILD_SHARED_LIBS=%%C ^
	-DLIBXML2_WITH_C14N=ON ^
	-DLIBXML2_WITH_CATALOG=ON ^
	-DLIBXML2_WITH_DEBUG=ON ^
	-DLIBXML2_WITH_DOCB=ON ^
	-DLIBXML2_WITH_FTP=ON ^
	-DLIBXML2_WITH_HTML=ON ^
	-DLIBXML2_WITH_HTTP=ON ^
	-DLIBXML2_WITH_ICONV=ON ^
	-DLIBXML2_WITH_ICU=ON ^
	-DLIBXML2_WITH_ISO8859X=ON ^
	-DLIBXML2_WITH_LEGACY=ON ^
	-DLIBXML2_WITH_LZMA=ON ^
	-DLIBXML2_WITH_MEM_DEBUG=OFF ^
	-DLIBXML2_WITH_MODULES=ON ^
	-DLIBXML2_WITH_OUTPUT=ON ^
	-DLIBXML2_WITH_PATTERN=ON ^
	-DLIBXML2_WITH_PROGRAMS=ON ^
	-DLIBXML2_WITH_PUSH=ON ^
	-DLIBXML2_WITH_PYTHON=OFF ^
	-DLIBXML2_WITH_READER=ON ^
	-DLIBXML2_WITH_REGEXPS=ON ^
	-DLIBXML2_WITH_RUN_DEBUG=OFF ^
	-DLIBXML2_WITH_SAX1=ON ^
	-DLIBXML2_WITH_SCHEMAS=ON ^
	-DLIBXML2_WITH_SCHEMATRON=ON ^
	-DLIBXML2_WITH_TESTS=OFF ^
	-DLIBXML2_WITH_THREADS=ON ^
	-DLIBXML2_WITH_THREAD_ALLOC=OFF ^
	-DLIBXML2_WITH_TREE=ON ^
	-DLIBXML2_WITH_VALID=ON ^
	-DLIBXML2_WITH_WRITER=ON ^
	-DLIBXML2_WITH_XINCLUDE=ON ^
	-DLIBXML2_WITH_XPATH=ON ^
	-DLIBXML2_WITH_XPTR=ON ^
	-DLIBXML2_WITH_ZLIB=ON ^
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX:/=\/%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	if %%C == OFF (
		REM iso C:\sdk\src\libxml2\win32\Makefile.msvc l.373
		sed -i 's/-DHAVE_WIN32_THREADS -D_REENTRANT/-DHAVE_WIN32_THREADS -D_REENTRANT -DLIBXML_STATIC -DLIBXML_STATIC_FOR_DLL/g' %CYGPATH_BUILD%/%1/build.ninja
		sed -i 's/LibXml2.pdb/libxml2s.pdb/g' %CYGPATH_BUILD%/%1/build.ninja
	)
	%NINJA% install
)

xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\LibXml2.dir\libxml2s.pdb %PATH_INSTALL%\lib\libxml2s.pdb*
for %%X in (xmlcatalog xmllint) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%X.pdb %PATH_INSTALL%\bin\*)
for %%X in (libxml2.dll xmlcatalog.exe xmllint.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)
DEL /Q /F %PATH_INSTALL%\bin\xml2-config
