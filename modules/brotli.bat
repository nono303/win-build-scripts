call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake ^
-Wno-dev ^
-G "NMake Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=ON %PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
nmake %NMAKE_OPTS% clean install

for %%X in (brotlicommon brotli brotlidec brotlienc) do (copy /Y %PATH_BUILD%\%1\%%X.pdb %PATH_INSTALL%\bin)

	REM version
CD /D %PATH_SRC%\%1 
FOR /F "tokens=* USEBACKQ" %%F IN (`git describe --tags`) DO (SET VERSION=%%F)
for %%X in (brotlicommon.dll brotli.exe brotlidec.dll brotlienc.dll) do (%BIN_VERPATCH% /va %PATH_INSTALL%\bin\%%X "%VERSION:~1%.0" /pv "%VERSION:~1%.0")