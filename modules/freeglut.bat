@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DFREEGLUT_PRINT_ERRORS=ON ^
-DFREEGLUT_PRINT_WARNINGS=ON ^
-DINSTALL_PDB=ON ^
-DFREEGLUT_GLES=OFF ^
-DFREEGLUT_REPLACE_GLUT=ON ^
-DFREEGLUT_WAYLAND=OFF ^
-DFREEGLUT_BUILD_DEMOS=OFF ^
-DFREEGLUT_BUILD_SHARED_LIBS=ON ^
-DFREEGLUT_BUILD_STATIC_LIBS=OFF ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
for %%C in (lib dll pdb) do (for %%X in (build.ninja cmake_install.cmake) do (sed -i 's/glut\.%%C/freeglut\.%%C/g' %CYGPATH_BUILD%/%1/%%X))
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\bin\freeglut.pdb %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\freeglut.dll