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
	if exist %PATH_SRC%\%1\.git\. (
		git reset --hard
		git clean -fdx
		if exist %PATH_MODULES%\%1.patch (
			echo # apply %1.patch
			git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\%1.patch
		)
	)
	if exist %PATH_SRC%\%1\.svn\. (
		svn revert . -R
		svn cleanup . --remove-unversioned --remove-ignored
		if exist %PATH_MODULES%\%1.patch (
			echo # apply %1.patch
			svn patch %PATH_MODULES%\%1.patch .
		)
	)
	if /I "%~2"=="cmake" (
		if exist %PATH_BUILD%\%1\. rmdir /S /Q %PATH_BUILD%\%1
		mkdir %PATH_BUILD%\%1
		cd /D %PATH_BUILD%\%1
	)
)