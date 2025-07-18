@echo off
echo ** [init] %*

set "SCM_COMORREV="
set "SCM_TAG="
set "SCM_BRANCH="
set "SCM_COMORREV_DATE="
set "SCM_URL="
set "GET_VERSION="
if "%CUR_DEBUG%"=="1" (
	echo on
	set CMAKE_OPTS=%CMAKE_OPTS_DBG%
	set NMAKE_OPTS=%NMAKE_OPTS_DBG%
	set MSBUILD_OPTS=%MSBUILD_OPTS_DBG%
	set NINJA=%BIN_NINJA% -v
) else (
	@echo off
	set CMAKE_OPTS=%CMAKE_OPTS_REL%
	set NMAKE_OPTS=%NMAKE_OPTS_REL%
	set MSBUILD_OPTS=%MSBUILD_OPTS_REL%
	set NINJA=%BIN_NINJA%
)
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
REM	path for find
set CMAKE_OPTS=%CMAKE_OPTS% ^
-DCMAKE_PREFIX_PATH=%PATH_INSTALL%;%PATH_INSTALL_OSSL%;%PATH_INSTALL%\_gdal;%PATH_INSTALL%\_proj;%PATH_MYSQL% ^
-DCMAKE_FIND_USE_CMAKE_PATH=ON ^
-DCMAKE_FIND_USE_CMAKE_ENVIRONMENT_PATH=OFF ^
-DCMAKE_FIND_USE_SYSTEM_ENVIRONMENT_PATH=ON ^
-DCMAKE_FIND_USE_CMAKE_SYSTEM_PATH=OFF ^
-DCMAKE_FIND_USE_INSTALL_PREFIX=OFF ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE%

setlocal enabledelayedexpansion
if exist %PATH_SRC%\%1\. (
	cd %PATH_SRC%\%1
	FOR /F "tokens=* USEBACKQ" %%F in (`do_php %PATH_UTILS%\sub\version.php %1`) do (set GET_VERSION=%%F)
	if exist %PATH_SRC%\%1\.git\. (
		FOR /F "tokens=* USEBACKQ" %%F in (`git rev-parse --short HEAD`) do (set SCM_COMORREV=%%F)
		FOR /F "tokens=* USEBACKQ" %%F in (`git tag --points-at HEAD`) do (set SCM_TAG=%%F)
		FOR /F "tokens=* USEBACKQ" %%F in (`git branch --show-current`) do (set SCM_BRANCH=%%F)
		FOR /F "tokens=* USEBACKQ" %%F in (`git show -s --format^=%%cd --date=short !SCM_COMORREV!`) do (set SCM_COMORREV_DATE=%%F)
		FOR /F "tokens=* USEBACKQ" %%F in (`git config --get remote.origin.url`) do (set SCM_URL=%%F)
		if /I "%~2"=="varonly" (goto end)
		if "!SCM_TAG!"=="" (
			echo    git commit:!SCM_COMORREV!
		) else (
			echo    git tag:!SCM_TAG!
		)
		
		if %ARG_KEEPSRC% == 0 (
			call git reset --hard > NUL
			call git clean -fdx > NUL
			if exist %PATH_MODULES%\%1.patch (
				echo    ^> apply %1.patch
				git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\%1.patch
			)
			if exist %PATH_MODULES%\%1.!SCM_COMORREV!.patch (
				echo    ^> apply %1.!SCM_COMORREV!.patch
				git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\%1.!SCM_COMORREV!.patch
			)
		)
	)
	if exist %PATH_SRC%\%1\.svn\. (
		FOR /F "tokens=* USEBACKQ" %%F in (`svn info --show-item revision`) do (set SCM_COMORREV=%%F)
		REM svn log %SCM_URL%/tags/
		REM svn ls -v %SCM_URL%/tags/
		FOR /F "tokens=* USEBACKQ" %%F in (`svn info ^| grep 'Relative URL' ^| grep -oE '/.*'`) do (set SCM_BRANCH=%%F)
		FOR /F "tokens=* USEBACKQ" %%F in (`svn info ^| grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}'`) do (set SCM_COMORREV_DATE=%%F)
		FOR /F "tokens=* USEBACKQ" %%F in (`svn info ^| grep 'Repository Root' ^| grep -oE 'http.*'`) do (set SCM_URL=%%F)
		if /I "%~2"=="varonly" (goto end)
		echo    svn revision:!SCM_COMORREV!
		if %ARG_KEEPSRC% == 0 (
			svn revert . -R
			REM --remove-ignored
			svn cleanup . --remove-unversioned
			if exist %PATH_MODULES%\%1.patch (
				echo    ^> apply %1.patch
				svn patch %PATH_MODULES%\%1.patch .
			)
			if exist %PATH_MODULES%\%1.!SCM_COMORREV!.patch (
				echo    ^> apply %1.!SCM_COMORREV!.patch
				svn patch %PATH_MODULES%\%1.!SCM_COMORREV!.patch .
			)
		)
	)
)
:end

REM https://stackoverflow.com/questions/9556676/batch-file-how-to-replace-equal-signs-and-a-string-variable
REM https://stackoverflow.com/questions/26246151/setlocal-enabledelayedexpansion-causes-cd-and-pushd-to-not-persist
	REM SCM_BRANCH: remove '(' & ')' that are interpreted in IF statement
endlocal & ^
cd %PATH_SRC%\%1& ^
set SCM_COMORREV=%SCM_COMORREV%& ^
set SCM_TAG=%SCM_TAG%& ^
set SCM_BRANCH=%SCM_BRANCH%& ^
set SCM_COMORREV_DATE=%SCM_COMORREV_DATE%& ^
set SCM_URL=%SCM_URL%& ^
set GET_VERSION=%GET_VERSION%
if "%CUR_DEBUG%"=="1" (
	echo SCM_COMORREV:%SCM_COMORREV%
	echo SCM_TAG:%SCM_TAG%
	echo SCM_BRANCH:%SCM_BRANCH%
	echo SCM_COMORREV_DATE:%SCM_COMORREV_DATE%
	echo SCM_URL:%SCM_URL%
	echo GET_VERSION:%GET_VERSION%
)
if /I "%~2"=="cmake" (
	if exist %PATH_BUILD%\%1\. rmdir /S /Q %PATH_BUILD%\%1
	mkdir %PATH_BUILD%\%1
	cd /D %PATH_BUILD%\%1
)