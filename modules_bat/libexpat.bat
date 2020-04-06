cd ..
rmdir /S /Q %PATH_BUILD%\libexpat
mkdir %PATH_BUILD%\libexpat
cd /D %PATH_BUILD%\libexpat
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DEXPAT_BUILD_DOCS=OFF -DEXPAT_BUILD_TESTS=OFF -DEXPAT_BUILD_EXAMPLES=OFF -DEXPAT_BUILD_TOOLS=OFF %PATH_SRC%\libexpat\expat
bash %CYGPATH_MODULE_BAT%/libexpat.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
copy /Y %PATH_BUILD%\libexpat\libexpat.pdb %PATH_INSTALL%\bin\libexpat.pdb
REM APR
mklink /H %PATH_INSTALL%\lib\expat.lib %PATH_INSTALL%\lib\libexpat.lib
cd /D %PATH_MODULE_BAT%