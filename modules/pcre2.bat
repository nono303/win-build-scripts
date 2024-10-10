@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

if "%2"=="svn" (
	set CMAKE_PCRE2=-DPCRE2_SUPPORT_LIBEDIT=OFF ^
	-DPCRE2_SUPPORT_LIBBZ2=OFF
) else (
	set CMAKE_PCRE2=-DPCRE2_SUPPORT_LIBEDIT=ON ^
	-DPCRE2_SUPPORT_LIBBZ2=ON
)

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_STATIC_LIBS=OFF ^
-DPCRE2_BUILD_PCRE2_8=ON ^
-DPCRE2_BUILD_PCRE2_16=OFF ^
-DPCRE2_BUILD_PCRE2_32=OFF ^
-DPCRE2_STATIC_PIC=OFF ^
-DPCRE2_DEBUG=OFF ^
-DPCRE2_DISABLE_PERCENT_ZT=OFF ^
-DPCRE2_SHOW_REPORT=ON ^
-DPCRE2_BUILD_PCRE2GREP=ON ^
-DPCRE2_BUILD_TESTS=OFF ^
-DNON_STANDARD_LIB_PREFIX=OFF ^
-DNON_STANDARD_LIB_SUFFIX=OFF ^
-DPCRE2_STATIC_RUNTIME=OFF ^
-DINSTALL_MSVC_PDB=OFF ^
-DPCRE2_SUPPORT_LIBZ=ON ^
-DPCRE2_SUPPORT_LIBREADLINE=OFF ^
-DCMAKE_DISABLE_FIND_PACKAGE_Readline=1 ^
-DPCRE2_REBUILD_CHARTABLES=OFF ^
-DPCRE2GREP_BUFSIZE=20480 ^
-DPCRE2GREP_MAX_BUFSIZE=1048576 ^
-DPCRE2GREP_SUPPORT_CALLOUT=ON ^
-DPCRE2GREP_SUPPORT_CALLOUT_FORK=ON ^
-DPCRE2GREP_SUPPORT_JIT=ON ^
-DPCRE2_EBCDIC=OFF ^
-DPCRE2_EBCDIC_NL25=OFF ^
-DPCRE2_HEAP_LIMIT=20000000 ^
-DPCRE2_HEAP_MATCH_RECURSE=OFF ^
-DPCRE2_LINK_SIZE=2 ^
-DPCRE2_MATCH_LIMIT=10000000 ^
-DPCRE2_MAX_VARLOOKBEHIND=255 ^
-DPCRE2_NEVER_BACKSLASH_C=OFF ^
-DPCRE2_NEWLINE=LF ^
-DPCRE2_PARENS_NEST_LIMIT=250 ^
-DPCRE2_SUPPORT_BSR_ANYCRLF=OFF ^
-DPCRE2_SUPPORT_JIT=ON ^
-DPCRE2_SUPPORT_UNICODE=ON ^
-DPCRE2_SUPPORT_VALGRIND=OFF ^
%CMAKE_PCRE2% ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

	REM pcre2-16 pcre2-32
for %%X in (pcre2-8 pcre2-posix) do (
	xcopy /C /F /Y %PATH_BUILD%\%1\%%X.pdb %PATH_INSTALL%\bin\*
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X.dll
)
xcopy /C /F /Y %PATH_BUILD%\%1\pcre2grep.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\pcre2grep.exe