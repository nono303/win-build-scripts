@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

if exist %PATH_INSTALL%\_%1\. rmdir /S /Q %PATH_INSTALL%\_%1
mkdir %PATH_INSTALL%\_%1

REM https://proj.org/install.html#cmake-configure-options
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL%\_%1 ^
-DCMAKE_INSTALL_MANDIR=%PATH_INSTALL%\_%1 ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_APPS=ON ^
-DBUILD_CCT=ON ^
-DBUILD_CS2CS=ON ^
-DBUILD_GEOD=ON ^
-DBUILD_GIE=ON ^
-DBUILD_PROJ=ON ^
-DBUILD_PROJINFO=ON ^
-DBUILD_PROJSYNC=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DENABLE_CURL=ON ^
-DCURL_LIBRARY=%PATH_INSTALL:\=/%/lib/libcurl.lib ^
-DCURL_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DSQLITE3_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DSQLITE3_LIBRARY=%PATH_INSTALL:\=/%/lib/libsqlite3.lib ^
-DEXE_SQLITE3=%PATH_INSTALL:\=/%/bin/sqlite3.exe ^
-DENABLE_TIFF=ON ^
-DTIFF_LIBRARY=%PATH_INSTALL:\=/%/lib/tiff.lib ^
-DTIFF_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DTIFF_LIBRARY_RELEASE=%PATH_INSTALL:\=/%/bin/tiff.dll ^
-DBUILD_TESTING=OFF ^
-DENABLE_IPO=ON ^
-DUSE_THREAD=ON ^
-DPROJ_DATA_ENV_VAR_TRIED_LAST=OFF ^
-DINSTALL_LEGACY_CMAKE_FILES=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\_%1\bin\*.* /b') do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\_%1\bin\%%G)
for /f "tokens=*" %%G in ('dir %PATH_BUILD%\%1\bin\*.pdb /b') do  (xcopy /C /F /Y %PATH_BUILD%\%1\bin\%%G %PATH_INSTALL%\_%1\bin\*)
xcopy /C /F /Y %PATH_BUILD%\%1\lib\*.lib %PATH_INSTALL%\_%1\lib\*