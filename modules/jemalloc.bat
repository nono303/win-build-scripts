call %PATH_MODULES_COMMON%\init.bat %1

C:\cyg%CYGV%\bin\sh.exe -c "CC=cl ./autogen.sh"
	REM C:\cyg%CYGV%\bin\sh.exe -c "./configure --help"
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/msvc/projects/vc2017/jemalloc/" %AVXVCX% %PTFTS% %WKITVER%
MSBuild.exe msvc\jemalloc_vc2017.sln /p:Turbo=true /m:%NUMBER_OF_PROCESSORS% /p:CL_MPCount=%NUMBER_OF_PROCESSORS% /t:Clean,jemalloc /p:Configuration=Release /p:DebugSymbols=false /p:DebugType=None /p:Plateform="%ARCH%" /nowarn:C4244 /nowarn:C4028

move /Y %PATH_SRC%\%1\msvc\%archmsbuild%\Release\jemalloc.dll %PATH_INSTALL%\bin\jemalloc.dll
move /Y %PATH_SRC%\%1\msvc\%archmsbuild%\Release\jemalloc.lib %PATH_INSTALL%\lib\jemalloc.lib
move /Y %PATH_SRC%\%1\msvc\%archmsbuild%\Release\jemalloc.pdb %PATH_INSTALL%\bin\jemalloc.pdb
if not exist %PATH_INSTALL%\include\%1\. mkdir %PATH_INSTALL%\include\%1\
copy /Y %PATH_SRC%\%1\include\%1\jemalloc.h %PATH_INSTALL%\include\%1\jemalloc.h