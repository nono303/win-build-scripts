@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

for %%C in ("-DFREEGLUT_BUILD_SHARED_LIBS=OFF -DFREEGLUT_BUILD_STATIC_LIBS=ON" "-DFREEGLUT_BUILD_SHARED_LIBS=ON -DFREEGLUT_BUILD_STATIC_LIBS=OFF") do (
		REM dirty !! https://stackoverflow.com/questions/9556676/batch-file-how-to-replace-equal-signs-and-a-string-variable
	set CUR=%%C
	setlocal enabledelayedexpansion
	set new=!CUR:"=!
	cmake %CMAKE_OPTS% ^
		-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
		-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
		-DFREEGLUT_PRINT_ERRORS=ON ^
		-DFREEGLUT_PRINT_WARNINGS=ON ^
		-DINSTALL_PDB=ON ^
		-DFREEGLUT_GLES=OFF ^
		-DFREEGLUT_REPLACE_GLUT=ON ^
		-DFREEGLUT_WAYLAND=OFF ^
		-DFREEGLUT_BUILD_DEMOS=OFF ^
		!new! ^
	%PATH_SRC%\%1
	
		REM static
	if %%C =="-DFREEGLUT_BUILD_SHARED_LIBS=OFF -DFREEGLUT_BUILD_STATIC_LIBS=ON" (
		for %%C in (lib pdb) do (for %%X in (build.ninja cmake_install.cmake) do (sed -i 's/glut\.%%C/freeglut_static\.%%C/g' %CYGPATH_BUILD%/%1/%%X))
	) else (
		for %%C in (lib dll pdb) do (for %%X in (build.ninja cmake_install.cmake) do (sed -i 's/glut\.%%C/freeglut\.%%C/g' %CYGPATH_BUILD%/%1/%%X))
	)

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	%NINJA% install
)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\freeglut.dll
xcopy /C /F /Y %PATH_BUILD%\%1\bin\freeglut.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\freeglut_static.dir\freeglut_static.pdb %PATH_INSTALL%\lib\*