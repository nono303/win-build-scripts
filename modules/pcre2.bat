@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=ON ^
-DEDITLINE_INCLUDE_DIR=%PATH_INSTALL%\inculde ^
-DBZIP2_INCLUDE_DIR=%PATH_INSTALL%\inculde ^
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
-DPCRE2_REBUILD_CHARTABLES=OFF ^
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
del /Q /F %PATH_INSTALL%\bin\pcre2-config