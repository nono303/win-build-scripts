cd ..
rmdir /S /Q C:\httpd-sdk\build\httpd
mkdir C:\httpd-sdk\build\httpd
cd /D C:\httpd-sdk\build\httpd
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DINSTALL_PDB=ON -DENABLE_MODULES=i -DINSTALL_MANUAL=OFF -DLIBXML2_ICONV_INCLUDE_DIR=C:/httpd-sdk/install/include -DLIBXML2_ICONV_LIBRARIES=C:/httpd-sdk/install/lib/iconv.lib -DZLIB_LIBRARIES=C:/httpd-sdk/install/lib/zlib.lib -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DOPENSSL_ROOT_DIR=C:\httpd-sdk\install\ -DENABLE_SOCACHE_DC=O -DENABLE_CHARSET_LITE=O ..\..\src\httpd
REM -DEXTRA_COMPILE_FLAGS="/GL /GS- /Oy- /W0 /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox /wd9025" -DCMAKE_MODULE_LINKER_FLAGS=%EXTRA_LINK_FLAGS% -DCMAKE_SHARED_LINKER_FLAGS=%EXTRA_LINK_FLAGS% -DCMAKE_STATIC_LINKER_FLAGS=%EXTRA_LINK_FLAGS%
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/httpd_flags_%CMAKE_BUILD_TYPE%.sh
nmake /B /NOLOGO clean install
mt.exe -manifest C:\httpd-sdk\httpd.exe.manifest -outputresource:C:\httpd-sdk\install\bin\httpd.exe;1
