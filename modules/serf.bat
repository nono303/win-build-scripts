@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

	REM unimplemented: -DGSSAPI=%PATH_INSTALL%\ -DBROTLI=%PATH_INSTALL%\ -DLIBDIR=%PATH_INSTALL%\lib\
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DSERF_WIN64=ON ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DDEBUG=OFF ^
-DSKIP_SHARED=OFF ^
-DSKIP_STATIC=ON ^
-DDISABLE_LOGGING=OFF ^
-DSKIP_TESTS=ON ^
-DENABLE_SLOW_TESTS=OFF ^
-DAPR_STATIC=OFF ^
-DAPR_ROOT=%PATH_INSTALL%\ ^
-DAPRUtil_ROOT=%PATH_INSTALL%\ ^
-DOPENSSL_ROOT_DIR=%PATH_INSTALL_OSSL% ^
-DEXPAT=%PATH_INSTALL%\ ^
-DRELATIVE_RPATH=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libserf-2.dll