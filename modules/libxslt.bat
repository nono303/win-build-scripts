@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_UNITY_BUILD=1 ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=ON ^
-DLIBXSLT_WITH_DEBUGGER=ON ^
-DLIBXSLT_WITH_CRYPTO=OFF ^
-DLIBXSLT_WITH_MODULES=ON ^
-DLIBXSLT_WITH_PROFILER=ON ^
-DLIBXSLT_WITH_PYTHON=OFF ^
-DLIBXSLT_WITH_TESTS=OFF ^
-DLIBXSLT_WITH_THREADS=ON ^
-DLIBXSLT_WITH_XSLT_DEBUG=ON ^
-DLIBXSLT_WITH_PROGRAMS=OFF ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
REM dirty fix bad usage of IMPORTED_LOCATION_RELWITHDEBINFO instead of IMPORTED_IMPLIB_RELWITHDEBINFO
	REM "C:\sdk\release\...\lib\cmake\libxml2-...\libxml2-export-relwithdebinfo.cmake"(12,55)
sed -i 's/bin\\\libxml2.dll/lib\\\libxml2.lib/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install

for %%X in (libexslt.dll libxslt.dll) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)
for %%X in (bin\xslt-config lib\xsltConf.sh) do (rm -fv %PATH_INSTALL%\%%X)
echo.