cd ..
rmdir /S /Q %PATH_BUILD%\libxdiff
mkdir %PATH_BUILD%\libxdiff
cd /D %PATH_BUILD%\libxdiff
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PHPDEPS% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DENABLE_TESTS=OFF -DENABLE_TOOLS=OFF %PATH_SRC%\libxdiff
nmake %NMAKE_OPTS% clean install
cd /D %PATH_MODULES%