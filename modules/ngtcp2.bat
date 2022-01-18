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
	-DENABLE_GNUTLS=OFF ^
	-DENABLE_OPENSSL=ON ^
	-DENABLE_BORINGSSL=OFF ^
	-DLIBEV_LIBRARY=%PATH_INSTALL%\lib\libev_static.lib ^
	!new! ^
	%PATH_SRC%\%1

	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
	

	if %%C =="-DENABLE_STATIC_LIB=ON -DENABLE_SHARED_LIB=OFF" (
		%NINJA% ngtcp2_static
		xcopy /C /F /Y %PATH_BUILD%\%1\lib\CMakeFiles\ngtcp2_static.dir\ngtcp2_static.pdb %PATH_INSTALL%\lib\*
		xcopy /Y %PATH_BUILD%\%1\lib\ngtcp2_static.lib %PATH_INSTALL%\lib\*
	) else (
		%NINJA% ngtcp2
		for %%X in (dll pdb lib) do (
			xcopy /C /F /Y %PATH_BUILD%\%1\lib\ngtcp2.%%X %PATH_INSTALL%\bin\*
		)
		call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\ngtcp2.dll
	)
)