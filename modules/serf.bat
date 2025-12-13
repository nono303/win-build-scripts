@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

	REM failed https://github.com/apache/serf/commit/9cf0878aafefa04df775d3e424f16ee07d423901 failed
		REM -DUSE_UNBOUND=OFF ^
		REM -DUSE_GSSAPI=OFF ^
		REM -DUSE_BROTLI=OFF ^
set SERF_LAST_GOOD=013f693
cd /D %PATH_SRC%\%1
call git reset --hard 
call git checkout %SERF_LAST_GOOD%
call %PATH_UTILS%\gitapply %PATH_PATCHES%\%1.%SERF_LAST_GOOD%.patch
cd /D %PATH_BUILD%\%1

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DDEBUG=OFF ^
-DSKIP_SHARED=OFF ^
-DSKIP_STATIC=ON ^
-DDISABLE_LOGGING=OFF ^
-DSKIP_TESTS=ON ^
-DENABLE_SLOW_TESTS=OFF ^
-DAPR_STATIC=OFF ^
-DEXPAT=%PATH_INSTALL%\ ^
-DRELATIVE_RPATH=OFF ^
-DDOT_CLANGD=OFF ^
-DUSE_HOMEBREW=OFF ^
-DUSE_MACPORTS=OFF ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libserf-2.dll