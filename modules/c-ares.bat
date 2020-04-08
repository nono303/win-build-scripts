call %PATH_MODULES_COMMON%/init.bat %1

cd /D %PATH_SRC%\%1
call buildconf.bat
cd /D %PATH_BUILD%\%1

cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DCARES_STATIC=ON -DCARES_SHARED=ON -DCARES_INSTALL=ON -DCARES_STATIC_PIC=OFF -DCARES_BUILD_TESTS=OFF -DCARES_MSVC_STATIC_RUNTIME=OFF %PATH_SRC%\%1 
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/cmake/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

copy /Y %PATH_BUILD%\%1\bin\cares.pdb %PATH_INSTALL%\bin\cares.pdb
copy /Y %PATH_BUILD%\%1\bin\acountry.pdb %PATH_INSTALL%\bin\acountry.pdb
copy /Y %PATH_BUILD%\%1\bin\adig.pdb %PATH_INSTALL%\bin\adig.pdb
copy /Y %PATH_BUILD%\%1\bin\ahost.pdb %PATH_INSTALL%\bin\ahost.pdb
	REM use + rename pour curl static
move /Y %PATH_INSTALL%\lib\cares_static.lib %PATH_INSTALL%\lib\libcares.lib 
move /Y %PATH_INSTALL%\bin\cares_static.pdb %PATH_INSTALL%\lib\libcares.pdb