@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM for PHP 
	REM - libxml2_a_dll MUST be used 
	REM   - https://wiki.php.net/internals/windows/libs/libxml2
	REM   - https://gist.github.com/auroraeosrose/3452993 (support libxml PHP extension shared and against shared dll on windows)
	REM - legacy MUST be yes
for %%X in (OFF ON) do (
	cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DBUILD_SHARED_LIBS=%%X ^
	-DBUILD_STATIC_FOR_DLL=ON ^
	-DLIBXML2_WITH_C14N=ON ^
	-DLIBXML2_WITH_CATALOG=ON ^
	-DLIBXML2_WITH_DEBUG=ON ^
	-DLIBXML2_WITH_FTP=OFF ^
	-DLIBXML2_WITH_HTML=ON ^
	-DLIBXML2_WITH_HTTP=ON ^
	-DLIBXML2_WITH_ICONV=ON ^
	-DLIBXML2_WITH_ICU=OFF ^
	-DLIBXML2_WITH_ISO8859X=ON ^
	-DLIBXML2_WITH_LEGACY=ON ^
	-DLIBXML2_WITH_LZMA=ON ^
	-DLIBXML2_WITH_MEM_DEBUG=OFF ^
	-DLIBXML2_WITH_MODULES=ON ^
	-DLIBXML2_WITH_OUTPUT=ON ^
	-DLIBXML2_WITH_PATTERN=ON ^
	-DLIBXML2_WITH_PROGRAMS=OFF ^
	-DLIBXML2_WITH_PUSH=ON ^
	-DLIBXML2_WITH_PYTHON=OFF ^
	-DLIBXML2_WITH_READER=ON ^
	-DLIBXML2_WITH_REGEXPS=ON ^
	-DLIBXML2_WITH_SAX1=ON ^
	-DLIBXML2_WITH_SCHEMAS=ON ^
	-DLIBXML2_WITH_SCHEMATRON=ON ^
	-DLIBXML2_WITH_TESTS=OFF ^
	-DLIBXML2_WITH_THREADS=ON ^
	-DLIBXML2_WITH_THREAD_ALLOC=ON ^
	-DLIBXML2_WITH_TREE=ON ^
	-DLIBXML2_WITH_VALID=ON ^
	-DLIBXML2_WITH_WRITER=ON ^
	-DLIBXML2_WITH_XINCLUDE=ON ^
	-DLIBXML2_WITH_XPATH=ON ^
	-DLIBXML2_WITH_XPTR=ON ^
	-DLIBXML2_WITH_XPTR_LOCS=ON ^
	-DLIBXML2_WITH_ZLIB=ON ^
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	%NINJA% install
	
	if %%X == OFF (xcopy /C /F /Y %PATH_BUILD%\%1\libxml2_a_dll.pdb %PATH_INSTALL%\lib\*)
)

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libxml2.dll