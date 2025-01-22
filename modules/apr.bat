@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DAPR_INSTALL_PRIVATE_H=ON ^
-DAPR_HAVE_IPV6=ON ^
-DINSTALL_PDB=ON ^
-DAPR_BUILD_TESTAPR=OFF ^
-DTEST_STATIC_LIBS=OFF ^
-DMIN_WINDOWS_VER=0x0A00 ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

call do_php %PATH_UTILS%\sub\version.php apr %PATH_INSTALL%\bin\libapr-1.dll

for %%D in (apr-1 aprapp-1 libaprapp-1) do (
	move /Y %PATH_INSTALL%\lib\%%D.lib %PATH_INSTALL%\%DIR_LIB_UNUSED%
	move /Y %PATH_BUILD%\%1\CMakeFiles\%%D.dir\%%D.pdb %PATH_INSTALL%\%DIR_LIB_UNUSED%
)