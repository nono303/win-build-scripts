rmdir /S /Q %PATH_BUILD%\libzmq
mkdir %PATH_BUILD%\libzmq
cd /D %PATH_BUILD%\libzmq
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PHPDEPS% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DWITH_DOC=OFF -DBUILD_SHARED=ON -DBUILD_STATIC=OFF -DBUILD_TESTS=OFF -DENABLE_CPACK=OFF %PATH_SRC%\libzmq 
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/libzmq-php.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
mklink /h %PHPDEPS%\lib\libzmq.lib %PHPDEPS%\lib\libzmq-mt-4_3_2.lib
cd /D %PATH_MODULES%