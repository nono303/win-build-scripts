cd /D C:\httpd-sdk\src\jemalloc-cmake\
git clean -f -d
git reset --hard
if %MSVC_DEPS% == vc15 (C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/vcxproj2vc15.sh "jemalloc-cmake/msvc/projects/vc2015/jemalloc")
C:\cyg%CYGV%\bin\sh.exe -c "CC=cl ./autogen.sh"
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/vcxproj.sh "/cygdrive/c/httpd-sdk/src/jemalloc-cmake/msvc/projects/vc2015/jemalloc/" %AVXVCX%
MSBuild.exe msvc\jemalloc_vc2015.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,jemalloc /p:Configuration=Release /p:DebugSymbols=false /p:DebugType=None /p:Plateform="%ARCH%"
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.dll c:\httpd-sdk\install\bin\jemalloc.dll
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.exp
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.iobj
rm -f C:\httpd-sdk\src\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.ipdb
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.lib c:\httpd-sdk\install\lib\jemalloc.lib
move /Y C:\httpd-sdk\src\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.pdb c:\httpd-sdk\install\bin\jemalloc.pdb
mkdir c:\httpd-sdk\install\include\jemalloc\
copy /Y C:\httpd-sdk\src\jemalloc-cmake\include\jemalloc\jemalloc.h c:\httpd-sdk\install\include\jemalloc\jemalloc.h
cd /D C:\httpd-sdk\modules_bat