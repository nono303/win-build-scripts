@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

if not exist %PATH_INSTALL%\_%1\. mkdir %PATH_INSTALL%\_%1

cmake %CMAKE_OPTS% ^
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

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
REM error with js\all
	REM FAILED: js/geographiclib.js js/geographiclib.min.js
	REM cmd.exe /C "cd /D C:\sdk\build\vc15_x86-avx\geographiclib && C:\sdk\softs\vs22\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe ."
	REM CMake Error:  Running 'C:/sdk/softs/vs22/Community/Common7/IDE/CommonExtensions/Microsoft/CMake/Ninja/ninja.exe' '-C' 'C:/sdk/build/vc15_x86-avx/geographiclib' '-t' 'recompact'
	REM failed with:  ninja: error: failed recompaction: Permission denied
sed -i 's/GeographicLib_STATIC\.pdb/Geographic\.pdb/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% src\install include\GeographicLib\install tools\install

for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\_%1\bin\*.exe /b') do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\_%1\bin\%%G)
for /f "tokens=*" %%G in ('dir %PATH_BUILD%\%1\bin\*.pdb /b') do  (xcopy /C /F /Y %PATH_BUILD%\%1\bin\%%G %PATH_INSTALL%\_%1\bin\*)
xcopy /C /F /Y %PATH_BUILD%\%1\src\CMakeFiles\GeographicLib_STATIC.dir\Geographic.pdb %PATH_INSTALL%\_%1\lib\*

if %LOCAL_COPY% == 1 if %LOCAL_COPY_AVXECHO% == %AVXECHO%  if %LOCAL_COPY_MSVC_VER% == %MSVC_VER% ( 
	if exist %LOCAL_PATH_GEOGRAPHICLIB%\bin\. rmdir /S /Q %LOCAL_PATH_GEOGRAPHICLIB%\bin 
	mkdir %LOCAL_PATH_GEOGRAPHICLIB%\bin
	xcopy /C /F /Y %PATH_INSTALL%\_%1\bin\*.* %LOCAL_PATH_GEOGRAPHICLIB%\bin\*
)