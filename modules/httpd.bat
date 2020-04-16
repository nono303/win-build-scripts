call %PATH_MODULES_COMMON%\init.bat mod_maxminddb
	REM https://github.com/maxmind/mod_maxminddb/issues/84
git apply --verbose %PATH_MODULES%\mod_maxminddb.patch

	REM pour mod_md
	REM openssl-ssh2_static_deps-dll	KO
set CURL_VER=openssl-ssh2_dll_deps-dll
set CURL_LIB_NAME=libcurl
	REM github
Copy /Y %PATH_INSTALL%\modules\mod_md.pdb D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\mod_md.pdb
Copy /Y %PATH_INSTALL%\modules\mod_md.so D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\mod_md.so
Copy /Y %PATH_INSTALL%\curl\%CURL_VER%\lib\%CURL_LIB_NAME%.pdb D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\%CURL_LIB_NAME%.pdb
Copy /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\%CURL_LIB_NAME%.dll D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\%CURL_LIB_NAME%.dll
	REM release
Copy /Y %PATH_INSTALL%\curl\%CURL_VER%\lib\%CURL_LIB_NAME%.pdb %PATH_INSTALL%\bin\%CURL_LIB_NAME%.pdb
Copy /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\%CURL_LIB_NAME%.dll %PATH_INSTALL%\bin\%CURL_LIB_NAME%.dll
Copy /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\curl.pdb %PATH_INSTALL%\bin\curl.pdb
Copy /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\curl.exe %PATH_INSTALL%\bin\curl.exe

call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake -Wno-dev -G "NMake Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DINSTALL_PDB=ON ^
-DINSTALL_MANUAL=OFF ^
-DENABLE_SOCACHE_DC=O ^
-DENABLE_CHARSET_LITE=O ^
-DENABLE_MODULES=i ^
-DLIBXML2_ICONV_INCLUDE_DIR=%PATH_INSTALL%/include -DLIBXML2_ICONV_LIBRARIES=%PATH_INSTALL%/lib/iconv.lib ^
-DZLIB_LIBRARIES=%PATH_INSTALL%/lib/zlib.lib ^
-DJANSSON_INCLUDE_DIR=%PATH_INSTALL%/include -DJANSSON_LIBRARIES=%PATH_INSTALL%/lib/jansson.lib ^
-DMAXMIND_LIBRARIES=%PATH_INSTALL%/lib/libmaxminddb.lib ^
-DOPENSSL_ROOT_DIR=%PATH_INSTALL%\ ^
-DCURL_LIBRARY=%PATH_INSTALL%\curl\%CURL_VER%\lib\%CURL_LIB_NAME%.lib -DCURL_INCLUDE_DIR=%PATH_INSTALL%\curl\%CURL_VER%\include ^
-DEXTRA_COMPILE_FLAGS="%EXTCFLAGS%" ^
-DEXTRA_INCLUDES=%PATH_SRC%\openssl ^
%PATH_SRC%\httpd 

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/httpd_flags.sh %CYGV%

nmake %NMAKE_OPTS% clean install
mt.exe -manifest %PATH_MODULES%\httpd.exe.manifest -outputresource:%PATH_INSTALL%\bin\httpd.exe;1

	REM mod_h264_streaming
	REM http://uppod.ru/talk_2008
set MODULE_EXTRA=mod_h264_streaming
call %PATH_MODULES_COMMON%\init.bat %MODULE_EXTRA% cmake
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"%PATH_INSTALL%\include" -I"%PATH_INSTALL%\lib" -D BUILDING_H264_STREAMING /c /Fo C:/src\%MODULE_EXTRA%\mod_h264_streaming.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"%PATH_INSTALL%\include" -I"%PATH_INSTALL%\lib" -D BUILDING_H264_STREAMING /c /Fo C:/src\%MODULE_EXTRA%\output_mp4.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"%PATH_INSTALL%\include" -I"%PATH_INSTALL%\lib" -D BUILDING_H264_STREAMING /c /Fo C:/src\%MODULE_EXTRA%\output_bucket.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"%PATH_INSTALL%\include" -I"%PATH_INSTALL%\lib" -D BUILDING_H264_STREAMING /c /Fo C:/src\%MODULE_EXTRA%\moov.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"%PATH_INSTALL%\include" -I"%PATH_INSTALL%\lib" -D BUILDING_H264_STREAMING /c /Fo C:/src\%MODULE_EXTRA%\mp4_process.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"%PATH_INSTALL%\include" -I"%PATH_INSTALL%\lib" -D BUILDING_H264_STREAMING /c /Fo C:/src\%MODULE_EXTRA%\mp4_writer.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"%PATH_INSTALL%\include" -I"%PATH_INSTALL%\lib" -D BUILDING_H264_STREAMING /c /Fo C:/src\%MODULE_EXTRA%\mp4_reader.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"%PATH_INSTALL%\include" -I"%PATH_INSTALL%\lib" -D BUILDING_H264_STREAMING /c /Fo C:/src\%MODULE_EXTRA%\mp4_io.c
link /nologo kernel32.lib "%PATH_INSTALL%\lib/libhttpd.lib" "%PATH_INSTALL%\lib/libapr-1.lib" "%PATH_INSTALL%\lib/libaprutil-1.lib" -Dll /machine:%ARCH% /LTCG /OPT:ICF /debug /out:mod_h264_streaming.so output_mp4.obj output_bucket.obj mp4_writer.obj mp4_reader.obj mp4_process.obj mp4_io.obj moov.obj mod_h264_streaming.obj
copy /Y %PATH_BUILD%\%MODULE_EXTRA%\mod_h264_streaming.so %PATH_INSTALL%\modules\mod_h264_streaming.so
copy /Y %PATH_BUILD%\%MODULE_EXTRA%\mod_h264_streaming.pdb %PATH_INSTALL%\modules\mod_h264_streaming.pdb
cd /D %PATH_MODULES%