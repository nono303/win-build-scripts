@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

sed -i -E "s/20189999/%SCM_COMORREV_DATE:-=%/g" %CYGPATH_SRC%/%1/cmake/modules/thirdparty/GetGitHeadDate.cmake

if exist %PATH_INSTALL%\_%1\. rmdir /S /Q %PATH_INSTALL%\_%1
mkdir %PATH_INSTALL%\_%1

REM -DGDAL_USE_GEOTIFF_INTERNAL=OFF ^
REM -DGDAL_USE_GIF_INTERNAL=OFF ^
REM -DGDAL_USE_JPEG_INTERNAL=OFF ^
REM -DGDAL_USE_JPEG12_INTERNAL=ON ^
REM -DGDAL_USE_LERC_INTERNAL=OFF ^
REM -DGDAL_USE_PNG_INTERNAL=OFF ^
REM -DGDAL_USE_QHULL_INTERNAL=ON ^
REM -DGDAL_USE_TIFF_INTERNAL=OFF ^
REM -DGDAL_USE_ZLIB_INTERNAL=OFF ^
REM -DGDAL_USE_JSONC_INTERNAL=ON ^
REM -DGDAL_USE_OPENCAD_INTERNAL=ON ^
	REM !! disable internal 
REM -DCMAKE_DISABLE_FIND_PACKAGE_JSONC=1 ^
	REM !! disable internal 
REM -DCMAKE_DISABLE_FIND_PACKAGE_OpenCAD=1 ^
	REM https://gdal.org/development/building_from_source.html
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL%\_%1 ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DCMAKE_PREFIX_PATH=%PATH_INSTALL% ^
-DGDAL_ENABLE_PLUGINS=ON ^
-DGDAL_BUILD_OPTIONAL_DRIVERS=ON ^
-DOGR_BUILD_OPTIONAL_DRIVERS=ON ^
-DBUILD_APPS=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DCLANG_TIDY_ENABLED=OFF ^
-DBUILD_PYTHON_BINDINGS=OFF ^
-DBUILD_CSHARP_BINDINGS=OFF ^
-DBUILD_JAVA_BINDINGS=OFF ^
-DBUILD_VSIPRELOAD=ON ^
-DBUILD_DOCS=OFF ^
-DBUILD_TESTING=OFF ^
-DENABLE_IPO=ON ^
-DGDAL_SET_INSTALL_RELATIVE_RPATH=OFF ^
-DGDAL_USE_EXTERNAL_LIBS=ON ^
-DGDAL_USE_INTERNAL_LIBS=WHEN_NO_EXTERNAL ^
-DGDAL_USE_ARCHIVE=OFF ^
-DGDAL_USE_ARMADILLO=OFF ^
-DGDAL_USE_ARROW=OFF ^
-DGDAL_USE_BASISU=OFF ^
-DGDAL_USE_BRUNSLI=OFF ^
-DGDAL_USE_CFITSIO=OFF ^
-DGDAL_USE_CRNLIB=OFF ^
-DGDAL_USE_CURL=ON ^
-DCURL_LIBRARY_RELEASE=%PATH_INSTALL:\=/%/lib/libcurl.lib ^
-DCURL_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DCURL_USE_STATIC_LIBS=OFF ^
-DGDAL_USE_CRYPTOPP=OFF ^
-DGDAL_USE_DEFLATE=ON ^
-DDeflate_LIBRARY_RELEASE=%PATH_INSTALL:\=/%/lib/deflate.lib ^
-DDeflate_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_ECW=OFF ^
-DGDAL_USE_EXPAT=ON ^
-DGDAL_USE_FILEGDB=OFF ^
-DGDAL_USE_FREEXL=OFF ^
-DGDAL_USE_FYBA=OFF ^
-DGDAL_USE_GEOTIFF=ON ^
-DGEOTIFF_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_GEOS=ON ^
-DGDAL_USE_GIF=ON ^
-DGIF_LIBRARY=%PATH_INSTALL:\=/%/lib/giflib.lib ^
-DGIF_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_GTA=OFF ^
-DGDAL_USE_HEIF=ON ^
-DHEIF_LIBRARY=%PATH_INSTALL:\=/%/lib/heif.lib ^
-DHEIF_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_HDF4=OFF ^
-DGDAL_USE_HDFS=OFF ^
-DGDAL_USE_ICONV=ON ^
-DIconv_LIBRARY=%PATH_INSTALL:\=/%/lib/libiconv.lib ^
-DIconv_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DIconv_CHARSET_LIBRARY=%PATH_INSTALL:\=/%/lib/libiconv.lib ^
-DGDAL_USE_IDB=OFF ^
-DGDAL_USE_JPEG=ON ^
-DJPEG_LIBRARY_RELEASE=%PATH_INSTALL:\=/%/lib/jpeg.lib ^
-DJPEG_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DEXPECTED_JPEG_LIB_VERSION=80 ^
-DGDAL_USE_JSONC=OFF ^
-DGDAL_USE_JXL=OFF ^
-DGDAL_USE_KDU=OFF ^
-DGDAL_USE_KEA=OFF ^
-DGDAL_USE_LERC=ON ^
-DLERC_LIBRARY=%PATH_INSTALL:\=/%/lib/Lerc.lib ^
-DLERC_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_LIBKML=OFF ^
-DGDAL_USE_LIBLZMA=ON ^
-DLIBLZMA_LIBRARY=%PATH_INSTALL:\=/%/lib/liblzma.lib ^
-DLIBLZMA_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_LIBXML2=ON ^
-DLIBXML2_LIBRARY=%PATH_INSTALL:\=/%/lib/libxml2.lib ^
-DLIBXML2_INCLUDE_DIR=%PATH_INSTALL:\=/%/include/libxml2 ^
-DGDAL_USE_LURATECH=OFF ^
-DGDAL_USE_LZ4=OFF ^
-DGDAL_USE_MONGOCXX=OFF ^
-DGDAL_USE_MRSID=OFF ^
-DGDAL_USE_MSSQL_NCLI=OFF ^
-DGDAL_USE_MSSQL_ODBC=OFF ^
-DGDAL_USE_MYSQL=OFF ^
-DGDAL_USE_NETCDF=OFF ^
-DGDAL_USE_ODBC=ON ^
-DGDAL_USE_ODBCCPP=OFF ^
-DGDAL_USE_OGDI=OFF ^
-DGDAL_USE_OPENCAD=OFF ^
-DGDAL_USE_OPENCL=OFF ^
-DGDAL_USE_OPENEXR=OFF ^
-DGDAL_USE_OPENJPEG=OFF ^
-DGDAL_USE_OPENSSL=ON ^
-DOPENSSL_ROOT_DIR=%PATH_INSTALL_OSSL:\=/% ^
-DOPENSSL_INCLUDE_DIR=%PATH_INSTALL_OSSL%\include ^
-DGDAL_USE_ORACLE=OFF ^
-DGDAL_USE_PARQUET=OFF ^
-DGDAL_USE_PCRE2=ON ^
-DPCRE2-8_LIBRARY=%PATH_INSTALL:\=/%/lib/pcre2-8.lib ^
-DPCRE2_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_PDFIUM=OFF ^
-DGDAL_USE_PNG=ON ^
-DPNG_LIBRARY_RELEASE=%PATH_INSTALL:\=/%/lib/libpng16.lib ^
-DPNG_PNG_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_POPPLER=OFF ^
-DGDAL_USE_POSTGRESQL=OFF ^
-DPROJ_LIBRARY=%PATH_INSTALL:\=/%/_proj/lib/proj.lib ^
-DPROJ_INCLUDE_DIR=%PATH_INSTALL:\=/%/_proj/include ^
-DGDAL_USE_QHULL=ON ^
-DQHULL_PACKAGE_NAME=qhull_r ^
-DQHULL_LIBRARY=%PATH_INSTALL:\=/%/lib/qhull_r.lib ^
-DQHULL_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_RASTERLITE2=OFF ^
-DGDAL_USE_RDB=OFF ^
-DGDAL_USE_SPATIALITE=OFF ^
-DGDAL_USE_SQLITE3=ON ^
-DSQLite3_LIBRARY=%PATH_INSTALL:\=/%/lib/libsqlite3.lib ^
-DSQLite3_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_SFCGAL=OFF ^
-DGDAL_USE_TEIGHA=OFF ^
-DGDAL_USE_TIFF=ON ^
-DTIFF_LIBRARY_RELEASE=%PATH_INSTALL:\=/%/lib/tiff.lib ^
-DTIFF_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_TILEDB=OFF ^
-DGDAL_USE_WEBP=ON ^
-DWEBP_LIBRARY=%PATH_INSTALL:\=/%/lib/libwebp.lib ^
-DWEBP_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_XERCESC=OFF ^
-DGDAL_USE_ZLIB=ON ^
-DZLIB_LIBRARY_RELEASE=%PATH_INSTALL:\=/%/lib/zlib.lib ^
-DZLIB_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DGDAL_USE_ZSTD=ON ^
-DCMAKE_DISABLE_FIND_PACKAGE_Armadillo=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_Arrow=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_basisu=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_Blosc=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_BRUNSLI=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_CryptoPP=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_CSharp=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_ECW=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_FileGDB=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_FreeXL=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_FYBA=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_HDF4=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_HDF5=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_HDFS=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_IDB=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_KDU=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_LibKML=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_libQB3=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_LURATECH=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_LZ4=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_MONGOCXX=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_MRSID=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_MSSQL_NCLI=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_MSSQL_ODBC=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_MySQL=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_NetCDF=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_ODBCCPP=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_OGDI=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_OpenCL=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_OpenEXR=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_OpenJPEG=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_Oracle=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_Podofo=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_Poppler=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_PostgreSQL=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_Python=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_RASTERLITE2=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_rdb=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_SFCGAL=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_Shapelib=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_SPATIALITE=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_SWIG=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_TileDB=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_XercesC=1 ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\_%1\bin\gdal.dll
xcopy /C /F /Y %PATH_BUILD%\%1\gdal.pdb %PATH_INSTALL%\_%1\bin\*
for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\_%1\bin\*.exe/b') do  (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\_%1\bin\%%G
	xcopy /C /F /Y %PATH_BUILD%\%1\apps\%%~nG.pdb %PATH_INSTALL%\_%1\bin\*
)
move /Y %PATH_INSTALL%\_%1\lib\gdalplugins %PATH_INSTALL%\_%1\bin\gdalplugins
for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\_%1\bin\gdalplugins\*.dll /b') do  (
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\_%1\bin\gdalplugins\%%G
	xcopy /C /F /Y %PATH_BUILD%\%1\gdalplugins\%%~nG.pdb %PATH_INSTALL%\_%1\bin\gdalplugins\*
)
xcopy /C /F /Y %PATH_BUILD%\%1\gdal.pdb %PATH_INSTALL%\_%1\bin\*