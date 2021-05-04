@echo off
if "%CUR_DEBUG%"=="1" (
	echo on
	set CMAKE_OPTS=%CMAKE_OPTS_DBG%
	set NMAKE_OPTS=%NMAKE_OPTS_DBG%
	set MSBUILD_OPTS=%MSBUILD_OPTS_DBG%
) else (
	@echo off
	set CMAKE_OPTS=%CMAKE_OPTS_REL%
	set NMAKE_OPTS=%NMAKE_OPTS_REL%
	set MSBUILD_OPTS=%MSBUILD_OPTS_REL%
)
if exist %PATH_SRC%\%1\. (
	cd %PATH_SRC%\%1
	echo ^> %PATH_SRC%\%1
	REM dirty !! https://stackoverflow.com/questions/9556676/batch-file-how-to-replace-equal-signs-and-a-string-variable
	set SCM_VERSION=
	setlocal enabledelayedexpansion
	if exist %PATH_SRC%\%1\.git\. (
		FOR /F "tokens=* USEBACKQ" %%F in (`git rev-parse --short HEAD`) do (set SCM_VERSION=%%F)
		echo # %1 git commit:!SCM_VERSION!
		if %ARG_KEEPSRC% == 0 (
			git reset --hard
			git clean -fdx
			if exist %PATH_MODULES%\%1.patch (
				echo # apply %1.patch
				git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\%1.patch
			)
			if exist %PATH_MODULES%\%1.!SCM_VERSION!.patch (
				echo # apply %1.!SCM_VERSION!.patch
				git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\%1.!SCM_VERSION!.patch
			)
		)
	)
	if exist %PATH_SRC%\%1\.svn\. (
		FOR /F "tokens=* USEBACKQ" %%F in (`svn info --show-item revision`) do (set SCM_VERSION=%%F)
		echo # %1 svn revision:!SCM_VERSION!
		if %ARG_KEEPSRC% == 0 (
			svn revert . -R
			REM --remove-ignored
			svn cleanup . --remove-unversioned
			if exist %PATH_MODULES%\%1.patch (
				echo # apply %1.patch
				svn patch %PATH_MODULES%\%1.patch .
			)
			if exist %PATH_MODULES%\%1.!SCM_VERSION!.patch (
				echo # apply %1.!SCM_VERSION!.patch
				svn patch %PATH_MODULES%\%1.!SCM_VERSION!.patch .
			)
		)
	)
	REM https://stackoverflow.com/questions/26246151/setlocal-enabledelayedexpansion-causes-cd-and-pushd-to-not-persist
	endlocal
)
if /I "%~2"=="cmake" (
	if exist %PATH_BUILD%\%1\. rmdir /S /Q %PATH_BUILD%\%1
	mkdir %PATH_BUILD%\%1
	cd /D %PATH_BUILD%\%1
)
echo.