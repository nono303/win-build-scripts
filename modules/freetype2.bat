@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

for %%S in (OFF ON) do (
	cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DBUILD_SHARED_LIBS=%%S ^
	-DPNG_LIBRARY=%PATH_INSTALL%\lib\libpng_a.lib ^
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
		REM LNK4098: defaultlib 'MSVCRT' conflicts with use of other libs; use /NODEFAULTLIB:library
	sed -i 's/LTCG/LTCG \/NODEFAULTLIB:libcmt.lib/g' %PATH_BUILD%/%1/CMakeFiles/freetype.dir/build.make
	
	nmake %NMAKE_OPTS% install
)

xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\freetype.dir\freetype.pdb %PATH_INSTALL%\lib\*
xcopy /C /F /Y %PATH_BUILD%\%1\freetype.pdb %PATH_INSTALL%\bin\*