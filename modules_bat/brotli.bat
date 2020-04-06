cd ..
rmdir /S /Q %PATH_BUILD%\brotli
mkdir %PATH_BUILD%\brotli
cd /D %PATH_BUILD%\brotli
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON %PATH_SRC%\brotli
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULE_BAT%/brotli.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
copy /Y %PATH_BUILD%\brotli\brotlicommon.pdb %PATH_INSTALL%\bin\brotlicommon.pdb
copy /Y %PATH_BUILD%\brotli\brotli.pdb %PATH_INSTALL%\bin\brotli.pdb 
copy /Y %PATH_BUILD%\brotli\brotlidec.pdb %PATH_INSTALL%\bin\brotlidec.pdb
copy /Y %PATH_BUILD%\brotli\brotlienc.pdb %PATH_INSTALL%\bin\brotlienc.pdb
cd /D %PATH_MODULE_BAT%