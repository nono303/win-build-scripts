@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM ninja: error: build.ninja:993: multiple rules generate yuv.lib [-w dupbuild=err]
sed -i 's/ly_lib_name} )/ly_lib_name}_static \)/g' %CYGPATH_SRC%/%1/CMakeLists.txt

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=1 ^
-DUNIT_TEST=0 ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	REM mjpeg_decoder.cc.obj : error LNK2001: unresolved external symbol jpeg_*
sed -i 's/LINK_LIBRARIES = kernel32.lib/LINK_LIBRARIES = kernel32.lib %PATH_INSTALL:\=\\\%\\\lib\\\jpeg.lib/g' %CYGPATH_BUILD%/%1/build.ninja
	REM shared lib for dll: include/libyuv/basic_types.h:48:#define LIBYUV_API __declspec(dllexport)
sed -i 's/DWIN32/DWIN32 \/DLIBYUV_BUILDING_SHARED_LIBRARY=1/g' %CYGPATH_BUILD%/%1/build.ninja
	REM accord imp lib to dll name
for %%Y in (cmake_install.cmake build.ninja) do (sed -i 's/ yuv\.lib/ libyuv\.lib/g' %CYGPATH_BUILD%/%1/%%Y)
	REM !install : CMake Error at cmake_install.cmake:36 (file):  file INSTALL cannot find "C:/sdk/build/.../libyuv/yuvconvert": No
%NINJA%

if not exist %PATH_INSTALL%\include\editline\. mkdir %PATH_INSTALL%\include\libyuv
xcopy /C /F /Y %PATH_SRC%\%1\include\libyuv.h %PATH_INSTALL%\include\*
xcopy /C /F /Y %PATH_SRC%\%1\include\libyuv\*.h %PATH_INSTALL%\include\libyuv\*

xcopy /C /F /Y %PATH_BUILD%\%1\libyuv.lib %PATH_INSTALL%\lib\*
for %%X in (libyuv.dll yuvconvert.exe) do (
	xcopy /C /F /Y %PATH_BUILD%\%1\%%X %PATH_INSTALL%\bin\*
	xcopy /C /F /Y %PATH_BUILD%\%1\%%~nX.pdb %PATH_INSTALL%\bin\*
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X
)