@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

if exist %PATH_INSTALL%\_%1\. rmdir /S /Q %PATH_INSTALL%\_%1 && mkdir %PATH_INSTALL%\_%1

REM https://proj.org/install.html#cmake-configure-options
cmake ^
%CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL%\_%1 ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_CCT=ON ^
-DBUILD_CS2CS=ON ^
-DBUILD_GEOD=ON ^
-DBUILD_GIE=ONBUILD_PROJ=ON ^
-DBUILD_PROJINFO=ON ^
-DBUILD_PROJSYNC=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DENABLE_CURL=ON ^
-DCURL_LIBRARY=%PATH_INSTALL:\=/%/lib/libcurl_imp.lib ^
-DCURL_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DSQLITE3_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DSQLITE3_LIBRARY=%PATH_INSTALL:\=/%/lib/sqlite3.lib ^
-DEXE_SQLITE3=%PATH_INSTALL:\=/%/bin/sqlite3.exe ^
-DENABLE_TIFF=ON ^
-DTIFF_LIBRARY=%PATH_INSTALL:\=/%/lib/tiff.lib ^
-DTIFF_INCLUDE_DIR=%PATH_INSTALL:\=/%/include ^
-DTIFF_LIBRARY_RELEASE=%PATH_INSTALL:\=/%/bin/tiff.dll ^
-DBUILD_TESTING=OFF ^
-DENABLE_IPO=ON ^
-DUSE_THREAD=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX:/=\/%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/proj.lib/proj_imp.lib/g' %CYGPATH_BUILD%/%1/build.ninja
	REM ICU shared sqlite3
sed -i 's/LINK_LIBRARIES =/LINK_LIBRARIES = %PATH_INSTALL:\=\\/%\/lib\/icuuc.lib %PATH_INSTALL:\=\\/%\/lib\/icuin.lib/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install

for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\_%1\bin\*.* /b') do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\_%1\bin\%%G)
for /f "tokens=*" %%G in ('dir %PATH_BUILD%\%1\bin\*.pdb /b') do  (xcopy /C /F /Y %PATH_BUILD%\%1\bin\%%G %PATH_INSTALL%\_%1\bin\*)
xcopy /C /F /Y %PATH_BUILD%\%1\lib\*.lib %PATH_INSTALL%\_%1\lib\*

if %LOCAL_COPY% == 1 if %LOCAL_COPY_AVXECHO% == %AVXECHO%  if %LOCAL_COPY_MSVC_VER% == %MSVC_VER% ( 
	xcopy /C /F /Y %PATH_INSTALL%\_%1\bin\*.* %LOCAL_PATH_PROJ%\bin\*
	xcopy /C /F /Y %PATH_INSTALL%\_%1\share\proj\*.* %LOCAL_PATH_PROJ%\share\*
)
