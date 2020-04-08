REM http://uppod.ru/talk_2008
cd ..
rmdir /S /Q %PATH_BUILD%\mod_h264_streaming
mkdir %PATH_BUILD%\mod_h264_streaming
cd /D %PATH_BUILD%\mod_h264_streaming
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/mod_h264_streaming.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/output_mp4.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/output_bucket.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/moov.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/mp4_process.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/mp4_writer.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/mp4_reader.c
cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"C:/httpd-sdk/install/include" -I"C:/httpd-sdk/install/lib" -D BUILDING_H264_STREAMING /c /Fo C:/src/mod_h264_streaming/mp4_io.c
link /nologo kernel32.lib "C:/httpd-sdk/install/lib/libhttpd.lib" "C:/httpd-sdk/install/lib/libapr-1.lib" "C:/httpd-sdk/install/lib/libaprutil-1.lib" -Dll /machine:%ARCH% /LTCG /OPT:ICF /debug /out:mod_h264_streaming.so output_mp4.obj output_bucket.obj mp4_writer.obj mp4_reader.obj mp4_process.obj mp4_io.obj moov.obj mod_h264_streaming.obj
copy /Y %PATH_BUILD%\mod_h264_streaming\mod_h264_streaming.so %PATH_INSTALL%\modules\mod_h264_streaming.so
copy /Y %PATH_BUILD%\mod_h264_streaming\mod_h264_streaming.pdb %PATH_INSTALL%\modules\mod_h264_streaming.pdb
cd /D %PATH_MODULES%