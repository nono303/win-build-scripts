@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake
REM goto shared
cmake %CMAKE_OPTS% -G %CMAKE_TGT_VS% -A %archmsbuild% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_TESTING=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %PATH_MODULES%/%1.sh "%CYGPATH_BUILD:\=/%/%1/" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

MSBuild.exe %PATH_BUILD%\%1\%VCDIR%\maxminddb.sln %MSBUILD_OPTS% ^
/t:maxminddb ^
/nowarn:C4068 ^
/p:Configuration=%CMAKE_BUILD_TYPE% ^
/p:Platform="%archmsbuild%"

xcopy /C /F /Y %PATH_BUILD%\%1\%CMAKE_BUILD_TYPE%\maxminddb.lib %PATH_INSTALL%\lib\*
for %%X in (pdb dll) do (xcopy /C /F /Y  %PATH_BUILD%\%1\%CMAKE_BUILD_TYPE%\maxminddb.%%X %PATH_INSTALL%\bin\*)
for %%X in (maxminddb.h maxminddb_config.h) do (xcopy /C /F /Y  %PATH_SRC%\%1\include\%%X %PATH_INSTALL%\include\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\maxminddb.dll