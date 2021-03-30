@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

set CURL_VER=openssl
if not exist %PATH_INSTALL%\_%1\. mkdir %PATH_INSTALL%\_%1

cmake ^
%CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL%\_%1 ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=ON ^
-DCURL_LIBRARY=%SLASHPATH_INSTALL%/%FOLDER_RELEASE_CURL%/%CURL_VER%/lib/libcurl_imp.lib ^
-DCURL_INCLUDE_DIR=%SLASHPATH_INSTALL%/%FOLDER_RELEASE_CURL%/%CURL_VER%/include ^
-DSQLITE3_INCLUDE_DIR=%SLASHPATH_INSTALL%/include ^
-DSQLITE3_LIBRARY=%SLASHPATH_INSTALL%/lib/sqlite3.lib ^
-DSQLITE3_BINARY=%SLASHPATH_INSTALL%/bin ^
-DTIFF_LIBRARY=%SLASHPATH_INSTALL%/lib/tiff.lib ^
-DTIFF_INCLUDE_DIR=%SLASHPATH_INSTALL%/include ^
-DBUILD_TESTING=OFF ^
-DENABLE_IPO=ON ^
-DUSE_THREAD=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

xcopy /C /F /Y %PATH_INSTALL%\_%1\bin\*.* B:\serveur\_gis\proj8\apps\*
xcopy /C /F /Y %PATH_INSTALL%\_%1\share\proj\*.* B:\serveur\_gis\proj8\share\*

for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\_%1\bin\*.* /b') do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\_%1\bin\%%G)
for /f "tokens=*" %%G in ('dir %PATH_BUILD%\%1\bin\*.pdb /b') do  (xcopy /C /F /Y %PATH_BUILD%\%1\bin\%%G %PATH_INSTALL%\_%1\bin\*)