rmdir /S /Q %PATH_SRC%\libmaxminddb\projects\VS12\%ARCH%
cd /D %PATH_SRC%\libmaxminddb
git reset --hard
git clean -fdx
cd /D %PATH_SRC%\libmaxminddb\projects\VS12
%PATH_BIN_CYGWIN%\bash %CYGPATH_HTTPD_SDK%/vcxproj.sh "%CYGPATH_SRC%/libmaxminddb/projects/VS12/" %AVXVCX%
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/libmaxminddb.sh
if %MSVC_DEPS% == vc15 (%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/vcxproj2vc15.sh "libmaxminddb/projects/VS12")
MSBuild.exe libmaxminddb.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libmaxminddb /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y %PATH_SRC%\libmaxminddb\projects\VS12\%outmsbuild%\libmaxminddb.lib %PATH_INSTALL%\lib\libmaxminddb.lib
copy /Y %PATH_SRC%\libmaxminddb\projects\VS12\%outmsbuild%\libmaxminddb.pdb %PATH_INSTALL%\lib\libmaxminddb.pdb
copy /Y %PATH_SRC%\libmaxminddb\include\maxminddb.h %PATH_INSTALL%\include\maxminddb.h 
copy /Y %PATH_SRC%\libmaxminddb\include\maxminddb_config.h %PATH_INSTALL%\include\maxminddb_config.h
cd /D %PATH_MODULES%