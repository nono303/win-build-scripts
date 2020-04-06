cd ..
rmdir /S /Q %PATH_BUILD%\lua
mkdir %PATH_BUILD%\lua
cd /D %PATH_BUILD%\lua
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DLUA_BUILD_WLUA=OFF -DLUA_BUILD_AS_DLL=ON %PATH_SRC%\lua
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULE_BAT%/lua.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
copy /Y %PATH_BUILD%\lua\lua.pdb %PATH_INSTALL%\bin\lua.pdb
cd /D %PATH_MODULE_BAT%