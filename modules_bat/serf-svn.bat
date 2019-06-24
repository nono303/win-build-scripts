cd ..
rmdir /S /Q C:\httpd-sdk\build\serf
mkdir C:\httpd-sdk\build\serf
cd /D C:\httpd-sdk\build\serf
if %ARCH% == x64 (
	set SERF64=-DSERF_WIN64=ON 
)
REM non implemente -DGSSAPI=C:\httpd-sdk\install\ -DBROTLI=C:\httpd-sdk\install\ -DLIBDIR=C:\httpd-sdk\install\lib\ 
cmake -Wno-dev -G "NMake Makefiles" %SERF64%-DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DDEBUG=OFF -DSKIP_SHARED=OFF -DSKIP_STATIC=OFF -DDISABLE_LOGGING=OFF -DSKIP_TESTS=ON -DENABLE_SLOW_TESTS=OFF -DAPR_STATIC=OFF -DEXPAT=C:\httpd-sdk\install\ -DAPR_ROOT=C:\httpd-sdk\install\ -DAPRUtil_ROOT=C:\httpd-sdk\install\ ..\..\src\serf 
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/serf-svn.sh "%AVXSED%"
nmake %NMAKE_OPTS% clean install
copy /Y C:\httpd-sdk\build\serf\CMakeFiles\serf_static.dir\serf_static.pdb C:\httpd-sdk\install\lib\serf_static.pdb
cd /D C:\httpd-sdk\modules_bat