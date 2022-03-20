@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_STATIC_LIBS=OFF ^
-DPCRE_BUILD_TESTS=OFF ^
-DPCRE_BUILD_PCRECPP=OFF ^
-DPCRE_BUILD_PCREGREP=OFF ^
-DPCRE_SUPPORT_PCREGREP_JIT=OFF ^
-DPCRE_SUPPORT_UTF=ON ^
-DPCRE_SUPPORT_UNICODE_PROPERTIES=ON ^
-DPCRE_NEWLINE=CRLF ^
-DINSTALL_MSVC_PDB=ON ^
-DPCRE_BUILD_PCRE16=OFF ^
-DPCRE_BUILD_PCRE32=OFF ^
-DPCRE_SUPPORT_LIBZ=ON ^
-DPCRE_SUPPORT_LIBEDIT=ON ^
-DPCRE_SUPPORT_LIBREADLINE=OFF ^
-DEDITLINE_INCLUDE_DIR=%PATH_INSTALL%\inculde ^
-DBZIP2_INCLUDE_DIR=%PATH_INSTALL%\inculde ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for %%X in (pcre pcreposix) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X.dll)