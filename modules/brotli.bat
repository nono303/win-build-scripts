@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

setlocal enabledelayedexpansion	
set BROTLI_SHARED=ON
for %%x in (%*) do (
   set /A argCount+=1
   set "argVec[!argCount!]=%%~x"
)
for /L %%i in (2,1,%argCount%) do (
	if /I "!argVec[%%i]!"=="STATIC"   set BROTLI_SHARED=OFF
)

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=%BROTLI_SHARED% ^
-DBUILD_TESTING=OFF ^
-DBROTLI_BUILD_TOOLS=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

if %BROTLI_SHARED% == ON (
	for %%X in (brotlicommon brotli brotlidec brotlienc) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%X.pdb %PATH_INSTALL%\bin\*)
	for %%X in (brotlicommon.dll brotli.exe brotlidec.dll brotlienc.dll) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)
) else (
	REM C:\sdk\src\php-ext-brotli\config.w32
	for %%X in (brotlicommon brotlidec brotlienc) do (
		move /Y %PATH_INSTALL%\lib\%%X.lib %PATH_INSTALL%\lib_unused\%%X.lib
		move /Y %PATH_BUILD%\%1\CMakeFiles\%%X.dir\%%X.pdb %PATH_INSTALL%\lib_unused\%%X.pdb
	)
)