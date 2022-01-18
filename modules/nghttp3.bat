@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

for %%C in ("-DENABLE_STATIC_LIB=ON -DENABLE_SHARED_LIB=OFF" "-DENABLE_STATIC_LIB=OFF -DENABLE_SHARED_LIB=ON") do (
		REM dirty !! https://stackoverflow.com/questions/9556676/batch-file-how-to-replace-equal-signs-and-a-string-variable
	set CUR=%%C
	setlocal enabledelayedexpansion
	set new=!CUR:"=!

	cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DENABLE_WERROR=OFF ^
	-DENABLE_DEBUG=OFF ^
	-DENABLE_ASAN=OFF ^
	-DENABLE_LIB_ONLY=ON ^
	!new! ^
	-DENABLE_STATIC_CRT=OFF ^
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	%NINJA% install

	if %%C =="-DENABLE_STATIC_LIB=ON -DENABLE_SHARED_LIB=OFF" (
		xcopy /C /F /Y %PATH_BUILD%\%1\lib\CMakeFiles\nghttp3_static.dir\nghttp3_static.pdb %PATH_INSTALL%\lib\*
		move /Y %PATH_INSTALL%\lib\nghttp3.lib %PATH_INSTALL%\lib\nghttp3_static.lib
	) else (
		xcopy /C /F /Y %PATH_BUILD%\%1\lib\lib\nghttp3.pdb %PATH_INSTALL%\bin\*
		call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\nghttp3.dll
	)
)