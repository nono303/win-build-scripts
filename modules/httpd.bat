	REM ~~~~~~~~~~~~ external modules
for %%M in (mod_maxminddb mod_fcgid mod_h2 mod_md mod_wku_bt mod_h264_streaming) do (call %PATH_MODULES_COMMON%\init.bat %%M)

	REM ~~~~~~~~~~~~ curl for mod_md : dll WinSSL https://github.com/icing/mod_md/issues/14
set CURL_BTYPE=dll
if %CURL_BTYPE% == dll (set CURL_LIB_NAME=libcurl.lib)
if %CURL_BTYPE% == static (set CURL_LIB_NAME=libcurl_a.lib)
set CURL_VER=winssl_%CURL_BTYPE%_deps-dll
xcopy /C /F /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\*.* %PATH_INSTALL%\bin\*

	REM ~~~~~~~~~~~~ cmake / nmake
call %PATH_MODULES_COMMON%\init.bat %1 cmake
cmake %CMAKE_OPTS% ^
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

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/httpd_flags.sh %CYGV% %CYGPATH_BUILD%
nmake %NMAKE_OPTS% install
	REM Targeting for Windows 10
mt.exe -manifest %PATH_MODULES%\httpd.exe.manifest -outputresource:%PATH_INSTALL%\bin\httpd.exe;1

	REM ~~~~~~~~~~~~ mod_md
if not "%PATH_GITHUB_MODMD%"=="" (
	for %%X in (so pdb) do (xcopy /C /F /Y %PATH_INSTALL%\modules\mod_md.%%X %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\*)
	xcopy /C /F /Y %PATH_INSTALL%\curl\%CURL_VER%\bin\*.dll %PATH_GITHUB_MODMD%\%MSVC_DEPS%\%ARCH%%AVXB%\*
)