call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DENABLE_SHARED=TRUE ^
-DENABLE_STATIC=TRUE ^
-DREQUIRE_SIMD=FALSE ^
-DWITH_12BIT=FALSE ^
-DWITH_ARITH_DEC=TRUE ^
-DWITH_ARITH_ENC=TRUE ^
-DWITH_JAVA=FALSE ^
-DWITH_JPEG7=FALSE ^
-DWITH_JPEG8=TRUE ^
-DWITH_MEM_SRCDST=TRUE ^
-DWITH_SIMD=TRUE ^
-DWITH_TURBOJPEG=TRUE ^
-DWITH_FUZZ=FALSE ^
-DWITH_CRT_DLL=FALSE ^
-DFORCE_INLINE=TRUE ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/\/w \/wd4996 \/MT //g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install