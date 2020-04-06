cd ..
rmdir /S /Q %PATH_BUILD%\jansson
mkdir %PATH_BUILD%\jansson
cd /D %PATH_BUILD%\jansson
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DUSE_URANDOM=OFF -DJANSSON_EXAMPLES=OFF -DJANSSON_BUILD_DOCS=OFF -DJANSSON_BUILD_SHARED_LIBS=ON %PATH_SRC%\jansson
bash %CYGPATH_MODULE_BAT%/jansson.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
copy /Y %PATH_BUILD%\jansson\bin\jansson.pdb %PATH_INSTALL%\bin\jansson.pdb
cd /D %PATH_MODULE_BAT%