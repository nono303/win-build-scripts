@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DZSTD_LEGACY_SUPPORT=OFF ^
-DZSTD_MULTITHREAD_SUPPORT=ON ^
-DZSTD_BUILD_PROGRAMS=ON ^
-DZSTD_BUILD_CONTRIB=OFF ^
-DZSTD_BUILD_TESTS=OFF ^
-DZSTD_USE_STATIC_RUNTIME=OFF ^
-DZSTD_PROGRAMS_LINK_SHARED=ON ^
-DZSTD_BUILD_STATIC=OFF ^
-DZSTD_BUILD_SHARED=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DZSTD_BUILD_COMPRESSION=ON ^
-DZSTD_BUILD_DECOMPRESSION=ON ^
-DZSTD_BUILD_DICTBUILDER=ON ^
-DZSTD_BUILD_DEPRECATED=OFF ^
%PATH_SRC%\%1\build\cmake

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install


for %%E in (lib\libzstd programs\zstd) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%E.pdb %PATH_INSTALL%\bin\*)
for %%E in (libzstd.dll zstd.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%E)