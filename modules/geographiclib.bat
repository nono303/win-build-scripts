@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

if not exist %PATH_INSTALL%\_%1\. mkdir %PATH_INSTALL%\_%1

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_UNITY_BUILD=1 ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL%\_%1 ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_BOTH_LIBS=OFF ^
-DBUILD_DOCUMENTATION=OFF ^
-DBUILD_MANPAGES=OFF ^
-DUSE_BOOST_FOR_EXAMPLES=OFF ^
-DAPPLE_MULTIPLE_ARCHITECTURES=OFF ^
-DCONVERT_WARNINGS_TO_ERRORS=OFF ^
-DPACKAGE_DEBUG_LIBS=OFF ^
-DGEOGRAPHICLIB_PRECISION=2 ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/GeographicLib-i/GeographicLib/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% src\install include\GeographicLib\install tools\install

xcopy /C /F /Y %PATH_BUILD%\%1\lib\GeographicLib.lib %PATH_INSTALL%\_%1\lib\*
for /f "tokens=*" %%G in ('dir %PATH_BUILD%\%1\bin\*.pdb /b') do  (xcopy /C /F /Y %PATH_BUILD%\%1\bin\%%G %PATH_INSTALL%\_%1\bin\*)
for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\_%1\bin\*.exe /b') do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\_%1\bin\%%G)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\_%1\bin\GeographicLib.dll

if %LOCAL_COPY% == 1 if %LOCAL_COPY_AVX_ECHO% == %AVXECHO%  if %LOCAL_COPY_MSVC_VER% == %MSVC_VER% (
	if exist %LOCAL_PATH_GEOGRAPHICLIB%\bin\. rmdir /S /Q %LOCAL_PATH_GEOGRAPHICLIB%\bin
	mkdir %LOCAL_PATH_GEOGRAPHICLIB%\bin
	xcopy /C /F /Y %PATH_INSTALL%\_%1\bin\*.* %LOCAL_PATH_GEOGRAPHICLIB%\bin\*
)