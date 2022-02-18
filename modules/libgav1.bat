@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

if not exist %PATH_SRC%\%1\third_party\. mkdir %PATH_SRC%\%1\third_party
if not exist %PATH_SRC%\%1\third_party\abseil-cpp\. mklink /J %PATH_SRC%\%1\third_party\abseil-cpp %PATH_SRC%\abseil-cpp

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DLIBGAV1_THREADPOOL_USE_STD_MUTEX=1 ^
-DLIBGAV1_ENABLE_TESTS=0 ^
-DABSL_PROPAGATE_CXX_STD=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX:/=\/%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/libgav1\.lib/libgav1_static\.lib/g' %CYGPATH_BUILD%/%1/build.ninja

%NINJA% 

xcopy /C /F /Y %PATH_BUILD%\%1\gav1_decode.exe %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\gav1_decode.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\libgav1_static.lib %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\libgav1_static.dir\libgav1_static.pdb %PATH_INSTALL%\lib\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\gav1_decode.exe

if not exist %PATH_INSTALL%\include\gav1\. mkdir %PATH_INSTALL%\include\gav1
xcopy /C /F /Y %PATH_SRC%\%1\src\gav1\*.h %PATH_INSTALL%\include\gav1\*