@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM fix /src/gav1/symbol_visibility.h #define LIBGAV1_PUBLIC __declspec(dllexport)
		REM libgav1_static.lib(internal_frame_buffer_list.cc.obj) : error LNK2001: unresolved external symbol __imp_Libgav1SetFrameBuffer
		REM libgav1_static.lib(internal_frame_buffer_list.cc.obj) : error LNK2001: unresolved external symbol __imp_Libgav1ComputeFrameBufferInfo
sed -i -E 's/ ^&^& LIBGAV1_BUILDING_DLL//g' %CYGPATH_SRC%/%1/src/gav1/symbol_visibility.h

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=1 ^
-DLIBGAV1_ENABLE_TESTS=0 ^
-DLIBGAV1_ENABLE_EXAMPLES=0 ^
-DLIBGAV1_ENABLE_OPTIMIZATIONS=1 ^
-DLIBGAV1_ENABLE_AVX2=0 ^
-DLIBGAV1_ENABLE_NEON=0 ^
-DLIBGAV1_ENABLE_SSE4_1=1 ^
-DLIBGAV1_VERBOSE=0 ^
-DLIBGAV1_THREADPOOL_USE_STD_MUTEX=1 ^
-DLIBGAV1_MAX_BITDEPTH=12 ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/= libgav1_shared/= libgav1/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% libgav1_shared

xcopy /C /F /Y %PATH_BUILD%\%1\libgav1.dll %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\libgav1.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\libgav1.lib %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_BUILD%\%1\libgav1_static.lib %PATH_INSTALL%\lib_unused\*
if not exist %PATH_INSTALL%\include\gav1\. mkdir %PATH_INSTALL%\include\gav1
xcopy /C /F /Y %PATH_SRC%\%1\src\gav1\*.h %PATH_INSTALL%\include\gav1\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libgav1.dll