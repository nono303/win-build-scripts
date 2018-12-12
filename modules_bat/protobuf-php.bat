cd ..
rmdir /S /Q C:\httpd-sdk\build\protobuf
mkdir C:\httpd-sdk\build\protobuf
cd /D C:\httpd-sdk\build\protobuf
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PHPDEPS% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DZLIB_LIBRARY=C:\httpd-sdk\install\lib\zlib.lib -DZLIB_INCLUDE_DIR=C:\httpd-sdk\install\include\ -Dprotobuf_MSVC_STATIC_RUNTIME=OFF -Dprotobuf_BUILD_SHARED_LIBS=OFF -Dprotobuf_BUILD_TESTS=OFF ..\..\src\protobuf\cmake
nmake %NMAKE_OPTS% clean install
copy C:\src\protobuf\src\google\protobuf\stubs\strutil.h %PHPDEPS%\include\google\protobuf\stubs\strutil.h
copy C:\src\protobuf\src\google\protobuf\parse_context.h %PHPDEPS%\include\google\protobuf\parse_context.h
cd /D C:\httpd-sdk\modules_bat