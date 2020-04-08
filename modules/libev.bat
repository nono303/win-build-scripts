cd ..
rmdir /S /Q %PATH_BUILD%\libev-win
mkdir %PATH_BUILD%\libev-win
cd /D %PATH_BUILD%\libev-win
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% %PATH_SRC%\libev-win
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/libev.sh "%AVXSED%"
nmake %NMAKE_OPTS%
copy /Y %PATH_BUILD%\libev-win\libev_static.lib %PATH_INSTALL%\lib\libev_static.lib
copy /Y %PATH_BUILD%\libev-win\libev.dll %PATH_INSTALL%\bin\libev.dll
copy /Y %PATH_BUILD%\libev-win\libev.pdb %PATH_INSTALL%\bin\libev.pdb
copy /Y %PATH_SRC%\libev-win\ev.h %PATH_INSTALL%\include\ev.h
cd /D %PATH_MODULES%