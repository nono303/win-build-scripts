cd ..
rmdir /S /Q C:\httpd-sdk\build\tidy-html5
mkdir C:\httpd-sdk\build\tidy-html5
cd /D C:\httpd-sdk\build\tidy-html5
cmake -Wno-dev -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PHPDEPS% -DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% -DBUILD_SHARED_LIB=ON -DTIDY_CONSOLE_SHARED=OFF -DBUILD_TAB2SPACE=OFF -DBUILD_SAMPLE_CODE=OFF -DTIDY_COMPAT_HEADERS=ON -DSUPPORT_LOCALIZATIONS=ON -DSUPPORT_CONSOLE_APP=ON -DENABLE_DEBUG_LOG=OFF -DENABLE_ALLOC_DEBUG=OFF -DENABLE_MEMORY_DEBUG=OFF -DENABLE_CRTDBG_MEMORY=OFF -DUSE_STATIC_RUNTIME=OFF -DADD_SYSTEM_RUNTIMES=OFF ..\..\src\tidy-html5
nmake %NMAKE_OPTS% clean install
move /Y %PHPDEPS%\lib\tidys.lib %PHPDEPS%\lib\tidy_a.lib
cd /D C:\httpd-sdk\modules_bat