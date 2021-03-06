call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM YES : static / NO : shared
for %%S in (YES NO) do (
	cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DBUILD_SHARED_LIBS=%%S ^
	-DBUILD_EXAMPLES=OFF ^
	-DBUILD_TESTING=OFF ^
	-DOPENSSL_ROOT_DIR=%PATH_INSTALL% ^
	-DZLIB_LIBRARY=%SLASHPATH_INSTALL%/lib/zlib.lib ^
	-DZLIB_INCLUDE_DIR=%PATH_INSTALL%\include ^
	-DCRYPTO_BACKEND=OpenSSL ^
	-DENABLE_ZLIB_COMPRESSION=ON ^
	%PATH_SRC%\%1
	%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/flags.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"

	nmake %NMAKE_OPTS% 
	if %%S == YES (
		for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\src\libssh2.%%X %PATH_INSTALL%\bin\*)
	) else (
		xcopy /C /F /Y %PATH_BUILD%\%1\src\libssh2.lib %PATH_INSTALL%\lib\*
		xcopy /C /F /Y %PATH_BUILD%\%1\src\CMakeFiles\libssh2.dir\libssh2.pdb %PATH_INSTALL%\lib\*
	)
)
xcopy /C /F /Y %PATH_SRC%\%1\include\libssh2.h %PATH_INSTALL%\include\*
xcopy /C /F /Y %PATH_SRC%\%1\include\libssh2_publickey.h %PATH_INSTALL%\include\*
xcopy /C /F /Y %PATH_SRC%\%1\include\libssh2_sftp.h %PATH_INSTALL%\include\*
