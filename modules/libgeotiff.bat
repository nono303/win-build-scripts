@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

sed -i 's/_i.lib/.lib/g' %CYGPATH_SRC%/%1/%1/CMakeLists.txt

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=ON ^
-DPROJ_LIBRARY=%PATH_INSTALL:\=/%/_proj/lib/proj.lib ^
-DPROJ_INCLUDE_DIR=%PATH_INSTALL:\=/%/_proj/include ^
-DWITH_ZLIB=ON ^
-DWITH_UTILITIES=OFF ^
-DWITH_TIFF=ON ^
-DWITH_JPEG=ON ^
-DWITH_TOWGS84=ON ^
%PATH_SRC%\%1\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\bin\geotiff.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\geotiff.dll