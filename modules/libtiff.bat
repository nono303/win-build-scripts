@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_UNITY_BUILD=1 ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_DISABLE_FIND_PACKAGE_JBIG=ON ^
-DBUILD_SHARED_LIBS=ON ^
-Dtiff-tools=OFF ^
-Dtiff-tests=OFF ^
-Dtiff-contrib=ON ^
-Dtiff-docs=OFF ^
-Dtiff-deprecated=OFF ^
-Dtiff-install=ON ^
-Dtiff-opengl=ON ^
-Dextra-warnings=OFF ^
-Dfatal-warnings=OFF ^
-Dld-version-script=OFF ^
-Dccitt=ON ^
-Dpackbits=ON ^
-Dlzw=ON ^
-Dthunder=ON ^
-Dnext=ON ^
-Dlogluv=ON ^
-Dmdi=ON ^
-Dzlib=ON ^
-Dlibdeflate=ON ^
-Dpixarlog=ON ^
-Djpeg=ON ^
-Dold-jpeg=ON ^
-Djbig=OFF ^
-Dlzma=ON ^
-Dzstd=ON ^
-Dwebp=ON ^
-Dcxx=ON ^
-Dlerc=ON ^
-Dstrip-chopping=ON ^
-Ddefer-strile-load=OFF ^
-Dchunky-strip-read=OFF ^
-Dextrasample-as-alpha=ON ^
-Dcheck-ycbcr-subsampling=ON ^
-Dwin32-io=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\tiff.dll
xcopy /C /F /Y %PATH_BUILD%\%1\libtiff\tiff.pdb %PATH_INSTALL%\bin\*
move /Y %PATH_INSTALL%\lib\tiffxx.lib %PATH_INSTALL%\%DIR_LIB_UNUSED%
xcopy /C /F /Y %PATH_BUILD%\%1\libtiff\CMakeFiles\tiffxx.dir\tiffxx.pdb %PATH_INSTALL%\lib_unused\*