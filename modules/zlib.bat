@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=ON ^
-DZLIB_BUILD_EXAMPLES=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"

	REM change lib name
for %%Y in (cmake_install.cmake build.ninja) do (sed -i 's/zlib1\.dll/zlib\.dll/g' %CYGPATH_BUILD%/%1/%%Y)
%NINJA% zlib.dll

for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\zlib.%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_BUILD%\%1\zlib.lib %PATH_INSTALL%\lib\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\zlib.dll
	REM fix for subversion
sed -i 's/"1.3"/"1.3.0"/g' %CYGPATH_SRC%/%1/zlib.h
for %%X in (%PATH_BUILD%\%1\zconf.h %PATH_SRC%\%1\zlib.h) do (xcopy /C /F /Y %%X %PATH_INSTALL%\include\*)