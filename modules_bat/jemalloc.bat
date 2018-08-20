cd /D C:\httpd-sdk\src\jemalloc-cmake\
sh -c "CC=cl ./autogen.sh"
C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe msvc\jemalloc_vc2015.sln /m:8 /t:Clean,jemalloc /p:Configuration=Release /p:DebugSymbols=false /p:DebugType=None /p:Plateform="%ARCH%"
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.dll c:\httpd-sdk\install\bin\jemalloc.dll
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.exp c:\httpd-sdk\install\lib\jemalloc.exp
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.iobj
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.ipdb
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.lib c:\httpd-sdk\install\lib\jemalloc.lib
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\jemalloc.pdb c:\httpd-sdk\install\bin\jemalloc.pdb
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\test_threads.exe c:\httpd-sdk\install\bin\test_threads.exe
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\test_threads.iobj
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\test_threads.ipdb
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%ARCH%\Release\test_threads.pdb c:\httpd-sdk\install\bin\test_threads.pdb
mkdir c:\httpd-sdk\install\include\jemalloc\
copy /Y C:\httpd-sdk\src\jemalloc-cmake\include\jemalloc\jemalloc.h c:\httpd-sdk\install\include\jemalloc\jemalloc.h