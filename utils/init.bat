@echo off
echo ** [init] %*

REM Check src dir
if exist %PATH_SRC%\%1\. (
	cd %PATH_SRC%\%1
) else (
	echo %PATH_SRC%\%1 doesn't exists
	exit /B
)

REM debug or no normal builders opts
if "%CUR_DEBUG%"=="1" (
	echo on
	set CMAKE_OPTS=%CMAKE_OPTS_DBG%
	set NMAKE_OPTS=%NMAKE_OPTS_DBG%
	set JOM_OPTS=%JOM_OPTS_DBG%
	set MSBUILD_OPTS=%MSBUILD_OPTS_DBG%
	set NINJA=%BIN_NINJA% -v
) else (
	@echo off
	set CMAKE_OPTS=%CMAKE_OPTS_REL%
	set NMAKE_OPTS=%NMAKE_OPTS_REL%
	set JOM_OPTS=%JOM_OPTS_REL%
	set MSBUILD_OPTS=%MSBUILD_OPTS_REL%
	set NINJA=%BIN_NINJA%
)

REM standard c & c++ opts
if /I NOT "%~3"=="nostd"  (
	if NOT "%C_STD_VER%"=="" (
		if /I "%~3"=="nocxx"  (
			set CMAKE_OPTS=%CMAKE_OPTS% -DCMAKE_C_FLAGS_INIT=/std:c%C_STD_VER%
			echo    # disabling /std:c%C_STD_VER% for C++
		) else (
			set CMAKE_OPTS=%CMAKE_OPTS% -DCMAKE_CXX_FLAGS_INIT=/std:c++%C_STD_VER% -DCMAKE_C_FLAGS_INIT=/std:c%C_STD_VER%
		)
	)
) else (
	echo    # disabling /std:c%C_STD_VER% for C and C++
)

REM CMake opts: path for find
set CMAKE_OPTS=%CMAKE_OPTS% ^
	-DCMAKE_PREFIX_PATH=%PATH_INSTALL%;%PATH_INSTALL%\_gdal;%PATH_INSTALL%\_proj;%PATH_MYSQL% ^
	-DCMAKE_FIND_USE_CMAKE_PATH=ON ^
	-DCMAKE_FIND_USE_CMAKE_ENVIRONMENT_PATH=OFF ^
	-DCMAKE_FIND_USE_SYSTEM_ENVIRONMENT_PATH=ON ^
	-DCMAKE_FIND_USE_CMAKE_SYSTEM_PATH=OFF ^
	-DCMAKE_FIND_USE_INSTALL_PREFIX=OFF ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE%
if "%ARG_CMOPTS%"=="1" (
	set CMAKE_OPTS=-LAH %CMAKE_OPTS%
)

REM init SCM_* & GET_VERSION ENV VAR
for /F "tokens=1* delims=:" %%K in ('do_php %PATH_UTILS%\sub\version.php %1 env') do (set %%K)

REM apply git patches
if exist %PATH_SRC%\%1\.git\. (	
	if %ARG_KEEPSRC% == 0 (
		call git reset --hard > NUL
		call git clean -fdx > NUL
		if exist %PATH_PATCHES%\%1.patch (call %PATH_UTILS%\gitapply %PATH_PATCHES%\%1.patch)
		if exist %PATH_PATCHES%\%1.!SCM_COMORREV!.patch (call %PATH_UTILS%\gitapply %PATH_PATCHES%\%1.!SCM_COMORREV!.patch)
	)
)
REM apply svn patches
if exist %PATH_SRC%\%1\.svn\. (
	echo    svn revision:!SCM_COMORREV!
	if %ARG_KEEPSRC% == 0 (
		svn revert . -R
		REM --remove-ignored
		svn cleanup . --remove-unversioned
		if exist %PATH_PATCHES%\%1.patch (
			echo    ^> apply %1.patch
			svn patch %PATH_PATCHES%\%1.patch .
		)
		if exist %PATH_PATCHES%\%1.!SCM_COMORREV!.patch (
			echo    ^> apply %1.!SCM_COMORREV!.patch
			svn patch %PATH_PATCHES%\%1.!SCM_COMORREV!.patch .
		)
	)
)

REM display SCM infos
if "%CUR_DEBUG%"=="1" (
	echo SCM_COMORREV:%SCM_COMORREV%
	echo SCM_TAG:%SCM_TAG%
	echo SCM_BRANCH:%SCM_BRANCH%
	echo SCM_COMORREV_DATE:%SCM_COMORREV_DATE%
	echo SCM_URL:%SCM_URL%
	echo GET_VERSION:%GET_VERSION%
) else (
	if "%SCM_TAG%"=="" (
		echo    git branch:%SCM_BRANCH% commit:%SCM_COMORREV%
	) else (
		echo    git tag:%SCM_TAG%
	)
)

REM goto exec dir
if /I "%~2"=="cmake" (
	if exist %PATH_BUILD%\%1\. rmdir /S /Q %PATH_BUILD%\%1
	mkdir %PATH_BUILD%\%1
	cd /D %PATH_BUILD%\%1
) else (
	if "%ARG_CMOPTS%"=="1" (
		echo ! cmopts arg not avaiable for non CMake projects
		exit /B
	)
	cd %PATH_SRC%\%1
)