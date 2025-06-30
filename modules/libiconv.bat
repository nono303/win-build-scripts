@echo off

if exist %PATH_INSTALL%\lib\cmake\gperf-3.1 rmdir /S /Q %PATH_INSTALL%\lib\cmake\gperf-3.1
REM SRC
call %PATH_MODULES_COMMON%\init.bat %1\%1
REM cmake
call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
-DCMAKE_UNITY_BUILD=1 ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=ON ^
-DLIBICONV_BUILD_DOCUMENTATION=OFF ^
-DLIBICONV_ENABLE_EXTRA=ON ^
-DLIBICONV_ENABLE_NLS=OFF ^
-DLIBICONV_ENABLE_RELOCATABLE=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	REM fix issue "subcommand failed"
sed -i 's/\/GL //g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\gperf\gperf.pdb %PATH_INSTALL%\bin\*
for %%X in (libcharset.dll libiconv.dll gperf.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)