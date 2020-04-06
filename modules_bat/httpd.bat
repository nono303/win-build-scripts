call %PATH_MODULE_BAT%\mod_maxminddb.bat
cd ..
rmdir /S /Q %PATH_BUILD%\httpd
mkdir %PATH_BUILD%\httpd
cd /D %PATH_BUILD%\httpd
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DINSTALL_PDB=ON -DENABLE_MODULES=i -DINSTALL_MANUAL=OFF -DLIBXML2_ICONV_INCLUDE_DIR=C:/httpd-sdk/install/include -DLIBXML2_ICONV_LIBRARIES=C:/httpd-sdk/install/lib/iconv.lib -DZLIB_LIBRARIES=C:/httpd-sdk/install/lib/zlib.lib -DJANSSON_INCLUDE_DIR=C:/httpd-sdk/install/include -DJANSSON_LIBRARIES=C:/httpd-sdk/install/lib/jansson.lib -DMAXMIND_LIBRARIES=C:/httpd-sdk/install/lib/libmaxminddb.lib -DOPENSSL_ROOT_DIR=%PATH_INSTALL%\ -DENABLE_SOCACHE_DC=O -DENABLE_CHARSET_LITE=O -DEXTRA_COMPILE_FLAGS="%EXTCFLAGS%" -DEXTRA_INCLUDES=%PATH_SRC%\openssl %PATH_SRC%\httpd 
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULE_BAT%/httpd_flags_%CMAKE_BUILD_TYPE%.sh
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULE_BAT%/httpd_flags.sh %CYGV%
nmake %NMAKE_OPTS% clean install
mt.exe -manifest %PATH_MODULE_BAT%\httpd.exe.manifest -outputresource:%PATH_INSTALL%\bin\httpd.exe;1
Copy /Y %PATH_INSTALL%\modules\mod_md.pdb D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\mod_md.pdb
Copy /Y %PATH_INSTALL%\modules\mod_md.so D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\mod_md.so
Copy /Y %PATH_INSTALL%\bin\libcurl.pdb D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\libcurl.pdb
Copy /Y %PATH_INSTALL%\bin\libcurl.dll D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\libcurl.so
cd /D %PATH_MODULE_BAT%