@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM fix internal libname
sed -i 's/bz2-1/bz2/g' %PATH_SRC%/%1/libbz2.def

cmake %CMAKE_OPTS% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DENABLE_WERROR=OFF ^
-DENABLE_DEBUG=OFF ^
-DENABLE_APP=ON ^
-DENABLE_DOCS=OFF ^
-DENABLE_EXAMPLES=OFF ^
-DENABLE_LIB_ONLY=OFF ^
-DENABLE_STATIC_LIB=OFF ^
-DENABLE_SHARED_LIB=ON ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for %%X in (bunzip.exe bzcat.exe) do (DEL /Q /F %PATH_INSTALL%\bin\%%X) 
move /Y %PATH_INSTALL%\lib\bz2.dll %PATH_INSTALL%\bin\bz2.dll
for %%X in (bzip2recover.pdb bzip2.pdb bz2.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%X %PATH_INSTALL%\bin\*)
for %%X in (bzip2.exe bzip2recover.exe bz2.dll) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)