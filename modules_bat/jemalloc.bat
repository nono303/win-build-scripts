cd /D %PATH_SRC%\jemalloc-cmake\
git reset --hard
git clean -fdx
if %MSVC_DEPS% == vc15 (%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULE_BAT%/vcxproj2vc15.sh "jemalloc-cmake/msvc/projects/vc2015/jemalloc")
C:\cyg%CYGV%\bin\sh.exe -c "CC=cl ./autogen.sh"
%PATH_BIN_CYGWIN%\bash %CYGPATH_HTTPD_SDK%/vcxproj.sh "%CYGPATH_SRC%/jemalloc-cmake/msvc/projects/vc2015/jemalloc/" %AVXVCX%
MSBuild.exe msvc\jemalloc_vc2015.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,jemalloc /p:Configuration=Release /p:DebugSymbols=false /p:DebugType=None /p:Plateform="%ARCH%"
move /Y %PATH_SRC%\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.dll %PATH_INSTALL%\bin\jemalloc.dll
rm -f %PATH_SRC%\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.exp
rm -f %PATH_SRC%\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.iobj
rm -f %PATH_SRC%\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.ipdb
move /Y %PATH_SRC%\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.lib %PATH_INSTALL%\lib\jemalloc.lib
move /Y %PATH_SRC%\jemalloc-cmake\msvc\%archmsbuild%\Release\jemalloc.pdb %PATH_INSTALL%\bin\jemalloc.pdb
mkdir %PATH_INSTALL%\include\jemalloc\
copy /Y %PATH_SRC%\jemalloc-cmake\include\jemalloc\jemalloc.h %PATH_INSTALL%\include\jemalloc\jemalloc.h
cd /D %PATH_MODULE_BAT%