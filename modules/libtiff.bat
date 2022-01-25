@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=ON ^
-DZLIB_LIBRARY=%PATH_INSTALL:\=/%/lib/zlib.lib ^
-DZLIB_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DJPEG_LIBRARY=%PATH_INSTALL:\=/%/lib/turbojpeg-static.lib ^
-DJPEG_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DLIBLZMA_LIBRARIES=C:/sdk/release/vs16_x64-avx/lib/liblzma.lib ^
-DLIBLZMA_INCLUDE_DIRS=%PATH_INSTALL:\=/%/include ^
REM Enable extra compiler warnings : OFF ^
-Dextra-warnings=OFF ^
REM Compiler warnings are errors : OFF ^
-Dfatal-warnings=OFF ^
REM Enable linker version script : ON ^
-Dld-version-script=OFF ^
REM support for CCITT Group 3 and 4 algorithms : ON ^
-Dccitt=ON ^
REM support for Macintosh PackBits algorithm : ON ^
-Dpackbits=ON ^
REM support for LZW algorithm : ON ^
-Dlzw=ON ^
REM support for ThunderScan 4-bit RLE algorithm : ON ^
-Dthunder=ON ^
REM support for NeXT 2-bit RLE algorithm : ON ^
-Dnext=ON ^
REM support for LogLuv high dynamic range algorithm : ON ^
-Dlogluv=ON ^
REM support for Microsoft Document Imaging : ON ^
-Dmdi=ON ^
REM use zlib (required for Deflate compression) : ON ^
-Dzlib=ON ^
REM use libdeflate (optional for faster Deflate support, still requires zlib) : ON ^
-Dlibdeflate=OFF ^
REM support for Pixar log-format algorithm (requires Zlib) : ON ^
-Dpixarlog=ON ^
REM use libjpeg (required for JPEG compression) : ON ^
-Djpeg=ON ^
REM support for Old JPEG compression (read-only) : ON ^
-Dold-jpeg=ON ^
REM use ISO JBIG compression (requires JBIT-KIT library) : ON ^
-Djbig=OFF ^
REM use liblzma (required for LZMA2 compression) : ON ^
-Dlzma=ON ^
REM use libzstd (required for ZSTD compression) : ON ^
-Dzstd=OFF ^
REM use libwebp (required for WEBP compression) : ON ^
-Dwebp=OFF ^
REM enable libjpeg 8/12-bit dual mode (requires separate 12-bit libjpeg build) : ON ^
-Djpeg12=OFF ^
REM Enable C++ stream API building (requires C++ compiler) : ON ^
-Dcxx=ON ^
REM strip chopping (whether or not to convert single-strip uncompressed images to mutiple strips of specified size to reduce memory usage) : ON ^
-Dstrip-chopping=ON ^
REM enable deferred strip/tile offset/size loading (also available at runtime with the 'D' flag of TIFFOpen()) : OFF ^
-Ddefer-strile-load=OFF ^
REM enable reading large strips in chunks for TIFFReadScanline() (experimental) : OFF ^
-Dchunky-strip-read=OFF ^
REM the RGBA interface will treat a fourth sample with no EXTRASAMPLE_ value as being ASSOCALPHA. Many packages produce RGBA files but don't mark the alpha properly : ON ^
-Dextrasample-as-alpha=ON ^
REM enable picking up YCbCr subsampling info from the JPEG data stream to support files lacking the tag : ON ^
-Dcheck-ycbcr-subsampling=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for %%X in (tiff.dll tiffmedian.exe tiffset.exe tiffsplit.exe tiffdump.exe tiffinfo.exe tiffcp.exe tiffcrop.exe tiffdither.exe tiff2rgba.exe tiffcmp.exe tiff2pdf.exe tiff2ps.exe fax2tiff.exe raw2tiff.exe fax2ps.exe ppm2tiff.exe pal2rgb.exe tiff2bw.exe tiffxx.dll) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)
for %%D in (libtiff\tiffxx.pdb libtiff\tiff.pdb tools\fax2ps.pdb tools\fax2tiff.pdb tools\pal2rgb.pdb tools\ppm2tiff.pdb tools\raw2tiff.pdb tools\tiff2bw.pdb tools\tiff2pdf.pdb tools\tiff2ps.pdb tools\tiff2rgba.pdb tools\tiffcmp.pdb tools\tiffcp.pdb tools\tiffcrop.pdb tools\tiffdither.pdb tools\tiffdump.pdb tools\tiffinfo.pdb tools\tiffmedian.pdb tools\tiffset.pdb tools\tiffsplit.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%D %PATH_INSTALL%\bin\*)
