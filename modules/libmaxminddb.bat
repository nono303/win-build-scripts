@echo off && call %PATH_MODULES_COMMON%\init.bat %1

cd /D %PATH_SRC%\%1\projects\VS12
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/projects/VS12/" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%
sed -i 's/vc$(PlatformToolsetVersion).pdb/$(ProjectName).pdb/g' %CYGPATH_SRC%/%1/projects/VS12/libmaxminddb.props

MSBuild.exe libmaxminddb.sln ^
%MSBUILD_OPTS% ^
/t:libmaxminddb ^
/p:Configuration=Release ^
/p:Platform="%archmsbuild%"

for %%E in (lib pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\projects\VS12\%outmsbuild%\libmaxminddb.%%E %PATH_INSTALL%\lib\*)
xcopy /C /F /Y %PATH_SRC%\%1\include\maxminddb.h %PATH_INSTALL%\include\*
xcopy /C /F /Y %PATH_SRC%\%1\include\maxminddb_config.h %PATH_INSTALL%\include\*