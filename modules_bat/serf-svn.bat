cd ..
rmdir /S /Q %PATH_BUILD%\serf
mkdir %PATH_BUILD%\serf
cd /D %PATH_BUILD%\serf
if %ARCH% == x64 (
	set SERF64=-DSERF_WIN64=ON 
)
REM non implemente -DGSSAPI=%PATH_INSTALL%\ -DBROTLI=%PATH_INSTALL%\ -DLIBDIR=%PATH_INSTALL%\lib\ 
cmake -Wno-dev -G "NMake Makefiles" %SERF64%-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DDEBUG=OFF -DSKIP_SHARED=OFF -DSKIP_STATIC=OFF -DDISABLE_LOGGING=OFF -DSKIP_TESTS=ON -DENABLE_SLOW_TESTS=OFF -DAPR_STATIC=OFF -DEXPAT=%PATH_INSTALL%\ -DAPR_ROOT=%PATH_INSTALL%\ -DAPRUtil_ROOT=%PATH_INSTALL%\ %PATH_SRC%\serf 
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULE_BAT%/serf-svn.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
copy /Y %PATH_BUILD%\serf\CMakeFiles\serf_static.dir\serf_static.pdb %PATH_INSTALL%\lib\serf_static.pdb
cd /D %PATH_MODULE_BAT%