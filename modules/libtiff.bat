@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DCMAKE_DISABLE_FIND_PACKAGE_PkgConfig=ON ^
-DBUILD_SHARED_LIBS=ON ^
-Dtiff-tools=OFF ^
-Dtiff-tests=OFF ^
-Dtiff-contrib=OFF ^
-Dtiff-docs=OFF ^
-Dtiff-deprecated=OFF ^
-Dtiff-install=ON ^
-DZLIB_LIBRARY=%PATH_INSTALL:\=/%/lib/zlib.lib ^
-DZLIB_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DJPEG_LIBRARY=%PATH_INSTALL:\=/%/lib/jpeg.lib ^
-DJPEG_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DLIBLZMA_LIBRARIES=%PATH_INSTALL:\=/%/lib/liblzma.lib ^
-DLIBLZMA_INCLUDE_DIRS=%PATH_INSTALL:\=/%/include ^
-DDeflate_LIBRARIES=%PATH_INSTALL:\=/%/lib/deflate.lib ^
-DDeflate_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DWebP_LIBRARY_RELEASE=%PATH_INSTALL:\=/%/lib/libwebp.lib ^
-DWebP_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
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
-Dcxx=OFF ^
-Dstrip-chopping=ON ^
-Ddefer-strile-load=OFF ^
-Dchunky-strip-read=OFF ^
-Dextrasample-as-alpha=ON ^
-Dcheck-ycbcr-subsampling=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\tiff.dll
xcopy /C /F /Y %PATH_BUILD%\%1\libtiff\tiff.pdb %PATH_INSTALL%\bin\*