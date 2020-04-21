cd ..
rmdir /S /Q %PATH_BUILD%\protobuf
mkdir %PATH_BUILD%\protobuf
cd /D %PATH_BUILD%\protobuf
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PHPDEPS% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DZLIB_LIBRARY=%PATH_INSTALL%\lib\zlib.lib -DZLIB_INCLUDE_DIR=%PATH_INSTALL%\include\ -Dprotobuf_MSVC_STATIC_RUNTIME=OFF -Dprotobuf_BUILD_SHARED_LIBS=OFF -Dprotobuf_BUILD_TESTS=OFF %PATH_SRC%\protobuf\cmake
nmake %NMAKE_OPTS% clean install
copy %PATH_SRC%\protobuf\src\google\protobuf\stubs\strutil.h %PHPDEPS%\include\google\protobuf\stubs\strutil.h
cd /D %PATH_MODULE_BAT%
