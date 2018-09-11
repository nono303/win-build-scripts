cd ..
rmdir /S /Q C:\httpd-sdk\build\pcre
mkdir C:\httpd-sdk\build\pcre
cd /D C:\httpd-sdk\build\pcre
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DPCRE_BUILD_TESTS=OFF -DPCRE_BUILD_PCRECPP=OFF -DPCRE_BUILD_PCREGREP=OFF -DPCRE_SUPPORT_PCREGREP_JIT=OFF -DPCRE_SUPPORT_UTF=ON -DPCRE_SUPPORT_UNICODE_PROPERTIES=ON -DPCRE_NEWLINE=CRLF -DINSTALL_MSVC_PDB=ON -DBZIP2_INCLUDE_DIR=C:\httpd-sdk\install\inculde ..\..\src\pcre
nmake /NOLOGO /A /B clean install
cd /D C:\httpd-sdk\modules_bat