@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

for %%X in (sfparse.c sfparse.h) do (
	if not exist %PATH_SRC%\%1\lib\sfparse\%%X mklink /h %PATH_SRC%\%1\lib\sfparse\%%X %PATH_SRC%\nghttp2\lib\%%X
)

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_TESTING=OFF ^
-DENABLE_WERROR=OFF ^
-DENABLE_DEBUG=OFF ^
-DENABLE_ASAN=OFF ^
-DENABLE_LIB_ONLY=ON ^
-DENABLE_STATIC_LIB=OFF ^
-DENABLE_SHARED_LIB=ON ^
-DENABLE_STATIC_CRT=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\lib\nghttp3.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\nghttp3.dll