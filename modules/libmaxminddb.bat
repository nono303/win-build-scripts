call %PATH_MODULES_COMMON%\init.bat %1

if exist %PATH_SRC%\%1\projects\VS12\%ARCH%\. rmdir /S /Q %PATH_SRC%\%1\projects\VS12\%ARCH%
cd /D %PATH_SRC%\%1\projects\VS12
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/projects/VS12/" %AVXVCX% %PTFTS% %WKITVER%
sed -i 's/vc$(PlatformToolsetVersion).pdb/$(ProjectName).pdb/g' %CYGPATH_SRC%/%1/projects/VS12/libmaxminddb.props

MSBuild.exe libmaxminddb.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libmaxminddb /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"

copy /Y %PATH_SRC%\%1\projects\VS12\%outmsbuild%\%1.lib %PATH_INSTALL%\lib\%1.lib
copy /Y %PATH_SRC%\%1\projects\VS12\%outmsbuild%\%1.pdb %PATH_INSTALL%\lib\%1.pdb
copy /Y %PATH_SRC%\%1\include\maxminddb.h %PATH_INSTALL%\include\maxminddb.h 
copy /Y %PATH_SRC%\%1\include\maxminddb_config.h %PATH_INSTALL%\include\maxminddb_config.h