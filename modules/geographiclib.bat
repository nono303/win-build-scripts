@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

set CURL_VER=openssl
if not exist %PATH_INSTALL%\_%1\. mkdir %PATH_INSTALL%\_%1

cmake ^
%CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL%\_%1 ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DCOMMON_INSTALL_PATH=ON ^
-DGEOGRAPHICLIB_DOCUMENTATION=OFF ^
-DBUILD_NETGEOGRAPHICLIB=OFF ^
-DPACKAGE_DEBUG_LIBS=OFF ^
-DUSE_BOOST_FOR_EXAMPLES=OFF ^
-DAPPLE_MULTIPLE_ARCHITECTURES=OFF ^
-DCONVERT_WARNINGS_TO_ERRORS=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

del /Q /F %PATH_INSTALL%\_%1\bin\*.dll
for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\_%1\bin\*.exe /b') do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\_%1\bin\%%G)
for /f "tokens=*" %%G in ('dir %PATH_BUILD%\%1\bin\*.pdb /b') do  (xcopy /C /F /Y %PATH_BUILD%\%1\bin\%%G %PATH_INSTALL%\_%1\bin\*)

if exist B:\serveur\_gis\%1\bin\. rmdir /S /Q B:\serveur\_gis\%1\bin 
mkdir B:\serveur\_gis\%1\bin
xcopy /C /F /Y %PATH_INSTALL%\_%1\bin\*.* B:\serveur\_gis\%1\bin\*