	REM patch https://bz.apache.org/bugzilla/attachment.cgi?id=35611
@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
%PATH_SRC%\%1\modules\fcgid

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/base:0x46430000/dynamicbase/g' %PATH_BUILD%/%1/CMakeFiles/mod_fcgid.dir/build.make

nmake %NMAKE_OPTS%