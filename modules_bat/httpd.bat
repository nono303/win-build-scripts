cd ..
rmdir /S /Q C:\httpd-sdk\build\httpd
mkdir C:\httpd-sdk\build\httpd
cd /D C:\httpd-sdk\build\httpd
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DINSTALL_PDB=ON -DENABLE_MODULES=i -DINSTALL_MANUAL=OFF -DLIBXML2_ICONV_INCLUDE_DIR=C:/httpd-sdk/install/include -DLIBXML2_ICONV_LIBRARIES=C:/httpd-sdk/install/lib/iconv.lib -DZLIB_LIBRARIES=C:/httpd-sdk/install/lib/zlib.lib -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DMAXMIND_LIBRARIES=C:/httpd-sdk/install/lib/libmaxminddb.lib -DOPENSSL_ROOT_DIR=C:\httpd-sdk\install\ -DENABLE_SOCACHE_DC=O -DENABLE_CHARSET_LITE=O -DEXTRA_COMPILE_FLAGS="%EXTCFLAGS%" -DEXTRA_INCLUDES=..\..\src\openssl ..\..\src\httpd 
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/httpd_flags_%CMAKE_BUILD_TYPE%.sh
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/httpd_flags.sh %CYGV%
nmake %NMAKE_OPTS% clean install
mt.exe -manifest C:\httpd-sdk\httpd.exe.manifest -outputresource:C:\httpd-sdk\install\bin\httpd.exe;1
Copy /Y C:\httpd-sdk\install\modules\mod_md.pdb D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\mod_md.pdb
Copy /Y C:\httpd-sdk\install\modules\mod_md.so D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\mod_md.so
Copy /Y C:\httpd-sdk\install\modules\mod_ssl.pdb D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\mod_ssl.pdb
Copy /Y C:\httpd-sdk\install\modules\mod_ssl.so D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\mod_ssl.so
cd /D C:\httpd-sdk\modules_bat