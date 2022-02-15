@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DCMAKE_DISABLE_FIND_PACKAGE_PkgConfig=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DZLIB_LIBRARY=%PATH_INSTALL:\=/%/lib/zlib.lib ^
-DZLIB_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DJPEG_LIBRARY=%PATH_INSTALL:\=/%/lib/turbojpeg-static.lib ^
-DJPEG_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DLIBLZMA_LIBRARIES=%PATH_INSTALL:\=/%/lib/liblzma.lib ^
-DLIBLZMA_INCLUDE_DIRS=%PATH_INSTALL:\=/%/include ^
-DDeflate_LIBRARIES=%PATH_INSTALL:\=/%/lib/libdeflatestatic.lib ^
-DDeflate_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
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
-Dwebp=OFF ^
-Djpeg12=OFF ^
-Dcxx=ON ^
-Dstrip-chopping=ON ^
-Ddefer-strile-load=OFF ^
-Dchunky-strip-read=OFF ^
-Dextrasample-as-alpha=ON ^
-Dcheck-ycbcr-subsampling=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for %%X in (tiff.dll tiffmedian.exe tiffset.exe tiffsplit.exe tiffdump.exe tiffinfo.exe tiffcp.exe tiffcrop.exe tiffdither.exe tiff2rgba.exe tiffcmp.exe tiff2pdf.exe tiff2ps.exe fax2tiff.exe raw2tiff.exe fax2ps.exe ppm2tiff.exe pal2rgb.exe tiff2bw.exe tiffxx.dll) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)
for %%D in (libtiff\tiffxx.pdb libtiff\tiff.pdb tools\fax2ps.pdb tools\fax2tiff.pdb tools\pal2rgb.pdb tools\ppm2tiff.pdb tools\raw2tiff.pdb tools\tiff2bw.pdb tools\tiff2pdf.pdb tools\tiff2ps.pdb tools\tiff2rgba.pdb tools\tiffcmp.pdb tools\tiffcp.pdb tools\tiffcrop.pdb tools\tiffdither.pdb tools\tiffdump.pdb tools\tiffinfo.pdb tools\tiffmedian.pdb tools\tiffset.pdb tools\tiffsplit.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%D %PATH_INSTALL%\bin\*)
