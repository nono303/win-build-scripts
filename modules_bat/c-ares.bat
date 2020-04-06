cd %PATH_SRC%\c-ares\
call %PATH_SRC%\c-ares\buildconf.bat
rmdir /S /Q %PATH_BUILD%\c-ares
mkdir %PATH_BUILD%\c-ares
cd /D %PATH_BUILD%\c-ares
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DCARES_STATIC=ON -DCARES_SHARED=ON -DCARES_INSTALL=ON -DCARES_STATIC_PIC=OFF -DCARES_BUILD_TESTS=OFF -DCARES_MSVC_STATIC_RUNTIME=OFF %PATH_SRC%\c-ares 
bash %CYGPATH_MODULE_BAT%/c-ares.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
copy /Y %PATH_BUILD%\c-ares\bin\cares.pdb %PATH_INSTALL%\bin\cares.pdb
copy /Y %PATH_BUILD%\c-ares\bin\acountry.pdb %PATH_INSTALL%\bin\acountry.pdb
copy /Y %PATH_BUILD%\c-ares\bin\adig.pdb %PATH_INSTALL%\bin\adig.pdb
copy /Y %PATH_BUILD%\c-ares\bin\ahost.pdb %PATH_INSTALL%\bin\ahost.pdb
	REM pour curl static
move /Y %PATH_INSTALL%\lib\cares_static.lib %PATH_INSTALL%\lib\libcares.lib 
move /Y %PATH_BUILD%\c-ares\CMakeFiles\c-ares_static.dir\c-ares_static.pdb %PATH_INSTALL%\lib\c-ares_static.pdb
cd /D %PATH_MODULE_BAT%