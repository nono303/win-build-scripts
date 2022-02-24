@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cd /D %PATH_BUILD%\%1
	REM ON : shared OFF : static
for %%X in (ON OFF) do (
	cmake %CMAKE_OPTS% ^
		-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
		-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
		-DBUILD_SHARED_LIBS=%%X ^
		%PATH_SRC%\%1 

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	for %%Y in (lib dll pdb) do (
		if %%X == ON (
			sed -i 's/Lerc\.%%Y/lerc\.%%Y/g' %CYGPATH_BUILD%/%1/build.ninja
			sed -i 's/Lerc\.%%Y/lerc\.%%Y/g' %CYGPATH_BUILD%/%1/cmake_install.cmake

		) else (
			sed -i 's/Lerc\.%%Y/lerc_static\.%%Y/g' %CYGPATH_BUILD%/%1/build.ninja
			sed -i 's/Lerc\.%%Y/lerc_static\.%%Y/g' %CYGPATH_BUILD%/%1/cmake_install.cmake
		)
	)
	%NINJA% install
)
xcopy /C /F /Y %PATH_BUILD%\%1\lerc.pdb %PATH_INSTALL%\bin\*
xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\Lerc.dir\lerc_static.pdb %PATH_INSTALL%\lib\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\lerc.dll