call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON %PATH_SRC%\%1
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

copy /Y %PATH_BUILD%\%1\brotlicommon.pdb %PATH_INSTALL%\bin\brotlicommon.pdb
copy /Y %PATH_BUILD%\%1\brotli.pdb %PATH_INSTALL%\bin\brotli.pdb 
copy /Y %PATH_BUILD%\%1\brotlidec.pdb %PATH_INSTALL%\bin\brotlidec.pdb
copy /Y %PATH_BUILD%\%1\brotlienc.pdb %PATH_INSTALL%\bin\brotlienc.pdb