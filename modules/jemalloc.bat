call %PATH_MODULES_COMMON%/init.bat %1

cd %PATH_SRC%\%1
if %MSVC_DEPS% == vc15 (%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/vcxproj2vc15.sh "%1/msvc/projects/vc2015/jemalloc")
C:\cyg%CYGV%\bin\sh.exe -c "CC=cl ./autogen.sh"
	REM C:\cyg%CYGV%\bin\sh.exe -c "./configure --help"

%PATH_BIN_CYGWIN%\bash %CYGPATH_HTTPD_SDK%/vcxproj.sh "%CYGPATH_SRC%/%1/msvc/projects/vc2015/jemalloc/" %AVXVCX%
MSBuild.exe msvc\jemalloc_vc2015.sln /p:OutputPath=%PATH_BUILD%\%1\ /p:OutDir=%PATH_BUILD%\%1\ /p:Turbo=true /m:%NUMBER_OF_PROCESSORS% /p:CL_MPCount=%NUMBER_OF_PROCESSORS% /t:Clean,jemalloc /p:Configuration=Release /p:DebugSymbols=false /p:DebugType=None /p:Plateform="%ARCH%"

move /Y %PATH_BUILD%\%1\jemalloc.dll %PATH_INSTALL%\bin\jemalloc.dll
move /Y %PATH_BUILD%\%1\jemalloc.lib %PATH_INSTALL%\lib\jemalloc.lib
move /Y %PATH_BUILD%\%1\jemalloc.pdb %PATH_INSTALL%\bin\jemalloc.pdb
if exist %PATH_INSTALL%\include\%1\. mkdir %PATH_INSTALL%\include\%1\
copy /Y %PATH_SRC%\%1\include\%1\jemalloc.h %PATH_INSTALL%\include\%1\jemalloc.h