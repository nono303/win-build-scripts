	REM unset this var, specific for mod_md github
set GITHUB_MD=D:\github\NONO_mod_md

	REM ~~~~~~~~~~~~ mod_maxminddb
set MODULE_EXTRA=mod_maxminddb
call %PATH_MODULES_COMMON%\init.bat %MODULE_EXTRA%
	REM https://github.com/maxmind/mod_maxminddb/issues/84
git apply --verbose %PATH_MODULES%\%MODULE_EXTRA%.patch

	REM ~~~~~~~~~~~~ curl
	REM pour mod_md : DLL OK -- WinSSL mandatory ? see %PATH_INSTALL%\curl folder name
set CURL_BTYPE=dll
set CURL_VER=winssl_%CURL_BTYPE%_deps-dll
if %CURL_BTYPE% == dll (set CURL_LIB_NAME=libcurl.dll)
if %CURL_BTYPE% == static (set CURL_LIB_NAME=curl.exe)
	REM copy curl to %PATH_INSTALL%\bin
xcopy /C /F /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\%CURL_LIB_NAME:~0,-4%.pdb %PATH_INSTALL%\bin\%CURL_LIB_NAME:~0,-4%.pdb*
xcopy /C /F /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\%CURL_LIB_NAME% %PATH_INSTALL%\bin\%CURL_LIB_NAME%*
if %CURL_BTYPE% == dll (xcopy /C /F /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\curl.exe %PATH_INSTALL%\bin\curl.exe*)
	REM copy curl to mod_md github
if not "%GITHUB_MD%"=="" (
	xcopy /C /F /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\%CURL_LIB_NAME:~0,-4%.pdb %GITHUB_MD%\%MSVC_DEPS%\%ARCH%%AVXB%\%CURL_LIB_NAME:~0,-4%.pdb*
	xcopy /C /F /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\%CURL_LIB_NAME% %GITHUB_MD%\%MSVC_DEPS%\%ARCH%%AVXB%\%CURL_LIB_NAME%*
)

	REM ~~~~~~~~~~~~ init
call %PATH_MODULES_COMMON%\init.bat %1 cmake
cd /D %PATH_SRC%/%1
git apply --verbose %PATH_MODULES%\%1.patch
cd /D %PATH_BUILD%/%1

	REM ~~~~~~~~~~~~ cmake
cmake -Wno-dev -G "NMake Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DINSTALL_PDB=ON ^
-DINSTALL_MANUAL=OFF ^
-DENABLE_SOCACHE_DC=O ^
-DENABLE_CHARSET_LITE=O ^
-DENABLE_MODULES=i ^
-DLIBXML2_ICONV_INCLUDE_DIR=%SLASHPATH_INSTALL%/include ^
-DLIBXML2_ICONV_LIBRARIES=%SLASHPATH_INSTALL%/lib/iconv.lib ^
-DZLIB_LIBRARIES=%SLASHPATH_INSTALL%/lib/zlib.lib ^
-DJANSSON_INCLUDE_DIR=%SLASHPATH_INSTALL%/include ^
-DJANSSON_LIBRARIES=%SLASHPATH_INSTALL%/lib/jansson.lib ^
-DMAXMIND_LIBRARIES=%PATH_INSTALL%/lib/libmaxminddb.lib ^
-DOPENSSL_ROOT_DIR=%SLASHPATH_INSTALL% ^
-DCURL_LIBRARY=%SLASHPATH_INSTALL%/curl/%CURL_VER%/lib/%CURL_LIB_NAME:~0,-4%.lib ^
-DCURL_INCLUDE_DIR=%SLASHPATH_INSTALL%/curl/%CURL_VER%/include ^
-DEXTRA_COMPILE_FLAGS="%EXTCFLAGS%" ^
-DEXTRA_INCLUDES=%PATH_SRC%/openssl ^
%PATH_SRC%\httpd 

	REM ~~~~~~~~~~~~ nmake
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/httpd_flags.sh %CYGV% %CYGPATH_BUILD%
nmake %NMAKE_OPTS% clean install
mt.exe -manifest %PATH_MODULES%\httpd.exe.manifest -outputresource:%PATH_INSTALL%\bin\httpd.exe;1

	REM ~~~~~~~~~~~~ mod_md
	REM copy mod_md to mod_md github
if not "%GITHUB_MD%"=="" (
	for %%X in (so pdb) do (copy /Y %PATH_INSTALL%\modules\mod_md.%%X D:\github\NONO_mod_md\%MSVC_DEPS%\%ARCH%%AVXB%\mod_md.%%X)
)

	REM ~~~~~~~~~~~~ mod_h264_streaming
	REM http://uppod.ru/talk_2008
set MODULE_EXTRA=mod_h264_streaming
call %PATH_MODULES_COMMON%\init.bat %MODULE_EXTRA% cmake
cd %PATH_SRC%\%MODULE_EXTRA%
git apply --verbose %PATH_MODULES%\%MODULE_EXTRA%.patch
cd %PATH_BUILD%\%MODULE_EXTRA%
for %%F in () do (mod_h264_streaming output_mp4 output_bucket moov mp4_process mp4_writer mp4_reader mp4_io) (
	cl /nologo -D HAVE_CONFIG_H -D WIN32 %EXTCFLAGS% -I"%PATH_INSTALL%\include" -I"%PATH_INSTALL%\lib" -D BUILDING_H264_STREAMING /c /Fo %PATH_SRC%\%MODULE_EXTRA%\%%F.c
)
link /nologo kernel32.lib "%PATH_INSTALL%\lib/libhttpd.lib" "%PATH_INSTALL%\lib/libapr-1.lib" "%PATH_INSTALL%\lib/libaprutil-1.lib" -Dll /machine:%ARCH% /LTCG /OPT:ICF /debug /out:mod_h264_streaming.so output_mp4.obj output_bucket.obj mp4_writer.obj mp4_reader.obj mp4_process.obj mp4_io.obj moov.obj mod_h264_streaming.obj
copy /Y %PATH_BUILD%\%MODULE_EXTRA%\mod_h264_streaming.so %PATH_INSTALL%\modules\mod_h264_streaming.so
copy /Y %PATH_BUILD%\%MODULE_EXTRA%\mod_h264_streaming.pdb %PATH_INSTALL%\modules\mod_h264_streaming.pdb