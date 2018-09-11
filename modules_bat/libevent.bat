cd ..
rmdir /S /Q C:\httpd-sdk\build\libevent
mkdir C:\httpd-sdk\build\libevent
cd /D C:\httpd-sdk\build\libevent
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:\httpd-sdk\install -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIBS=ON -DGIT_EXECUTABLE=c:\PROGRA~1\Git\bin\git.exe -DEVENT__DISABLE_DEBUG_MODE=ON -DEVENT__DISABLE_THREAD_SUPPORT=OFF -DEVENT__DISABLE_OPENSSL=OFF -DEVENT__DISABLE_BENCHMARK=ON -DEVENT__DISABLE_TESTS=ON -DEVENT__DISABLE_REGRESS=ON -DEVENT__DISABLE_SAMPLES=ON -DEVENT__COVERAGE=OFF ..\..\src\libevent
nmake /B /NOLOGO clean install
cd /D C:\httpd-sdk\modules_bat