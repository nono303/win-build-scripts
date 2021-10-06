@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

REM ninja: error: build.ninja:993: multiple rules generate yuv.lib [-w dupbuild=err]
sed -i 's/ly_lib_name} )/ly_lib_name}_static \)/g' %CYGPATH_SRC%/%1/CMakeLists.txt
cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=1 ^
-DTEST=0 ^
%PATH_SRC%\%1

REM mjpeg_decoder.cc.obj : error LNK2001: unresolved external symbol jpeg_CreateDecompress
REM mjpeg_decoder.cc.obj : error LNK2001: unresolved external symbol jpeg_destroy_decompress
REM mjpeg_decoder.cc.obj : error LNK2001: unresolved external symbol jpeg_read_header
REM mjpeg_decoder.cc.obj : error LNK2001: unresolved external symbol jpeg_start_decompress
REM mjpeg_decoder.cc.obj : error LNK2001: unresolved external symbol jpeg_abort_decompress
REM mjpeg_decoder.cc.obj : error LNK2001: unresolved external symbol jpeg_std_error
REM mjpeg_decoder.cc.obj : error LNK2001: unresolved external symbol jpeg_resync_to_restart
REM mjpeg_decoder.cc.obj : error LNK2001: unresolved external symbol jpeg_read_raw_data
sed -i 's/LINK_LIBRARIES = kernel32.lib/LINK_LIBRARIES = kernel32.lib C:\\\sdk\\\release\\\vs17_x64-avx\\\lib\\\jpeg.lib/g' %CYGPATH_BUILD%/%1/build.ninja
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
REM !install : CMake Error at cmake_install.cmake:36 (file):  file INSTALL cannot find "C:/sdk/build/vs17_x64-avx/libyuv/yuvconvert": No
%NINJA%

for %%X in (CMakeFiles\yuv_static.dir\yuv_static.pdb yuv_static.lib) do (
	xcopy /C /F /Y %PATH_BUILD%\%1\%%X  %PATH_INSTALL%\lib\*
)
for %%X in (libyuv.dll yuvconvert.exe) do (
	xcopy /C /F /Y %PATH_BUILD%\%1\%%X %PATH_INSTALL%\bin\*
	xcopy /C /F /Y %PATH_BUILD%\%1\%%~nX.pdb %PATH_INSTALL%\bin\*
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X
)
if not exist %PATH_INSTALL%\include\editline\. mkdir %PATH_INSTALL%\include\libyuv
xcopy /C /F /Y %PATH_SRC%\%1\include\libyuv.h %PATH_INSTALL%\include\*
xcopy /C /F /Y %PATH_SRC%\%1\include\libyuv\*.h %PATH_INSTALL%\include\libyuv\*