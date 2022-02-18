@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake ^
%CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DZSTD_LEGACY_SUPPORT=ON ^
-DZSTD_MULTITHREAD_SUPPORT=ON ^
-DZSTD_BUILD_PROGRAMS=OFF ^
-DZSTD_BUILD_CONTRIB=OFF ^
-DZSTD_BUILD_TESTS=OFF ^
-DZSTD_USE_STATIC_RUNTIME=OFF ^
-DZSTD_PROGRAMS_LINK_SHARED=OFF ^
%PATH_SRC%\%1\build\cmake

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/libzstd_static.pdb/zstd_static.pdb/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\lib\zstd.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\lib\CMakeFiles\libzstd_static.dir\zstd_static.pdb %PATH_INSTALL%\lib\*

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\zstd.dll