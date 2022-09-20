@echo off
set "SCM_COMORREV="
set "SCM_TAG="
set "SCM_BRANCH="
set "SCM_COMORREV_DATE="
set "SCM_URL="
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
setlocal enabledelayedexpansion
if exist %PATH_SRC%\%1\. (
	cd %PATH_SRC%\%1
	echo ^> %PATH_SRC%\%1
	if exist %PATH_SRC%\%1\.git\. (
		FOR /F "tokens=* USEBACKQ" %%F in (`git rev-parse --short HEAD`) do (set SCM_COMORREV=%%F)
		for /F "tokens=* USEBACKQ" %%F in (`git tag --points-at HEAD`) do (set SCM_TAG=%%F)
		FOR /F "tokens=* USEBACKQ" %%F in (`git branch -a --contains !SCM_COMORREV! ^| grep -v detached ^| grep -v / ^| sed 's/^\* ^/^/g'`) do (set SCM_BRANCH=%%F)
		FOR /F "tokens=* USEBACKQ" %%F in (`git show -s --format^=%%cd --date=short !SCM_COMORREV!`) do (set SCM_COMORREV_DATE=%%F)
		FOR /F "tokens=* USEBACKQ" %%F in (`git config --get remote.origin.url`) do (set SCM_URL=%%F)
		if /I "%~2"=="varonly" (goto end)
		echo     # %1 git commit:!SCM_COMORREV!
		if %ARG_KEEPSRC% == 0 (
			git reset --hard
			git clean -fdx
			if exist %PATH_MODULES%\%1.patch (
				echo     # apply %1.patch
				git apply --verbose --ignore-space-change --ignore-whitespace %PATH_MODULES%\%1.patch
			)
			if exist %PATH_MODULES%\%1.!SCM_COMORREV!.patch (
				echo     # apply %1.!SCM_COMORREV!.patch
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
		echo     # %1 svn revision:!SCM_COMORREV!
		if %ARG_KEEPSRC% == 0 (
			svn revert . -R
			REM --remove-ignored
			svn cleanup . --remove-unversioned
			if exist %PATH_MODULES%\%1.patch (
				echo     # apply %1.patch
				svn patch %PATH_MODULES%\%1.patch .
			)
			if exist %PATH_MODULES%\%1.!SCM_COMORREV!.patch (
				echo     # apply %1.!SCM_COMORREV!.patch
				svn patch %PATH_MODULES%\%1.!SCM_COMORREV!.patch .
			)
		)
	)
	
)
:end
REM https://stackoverflow.com/questions/9556676/batch-file-how-to-replace-equal-signs-and-a-string-variable
REM https://stackoverflow.com/questions/26246151/setlocal-enabledelayedexpansion-causes-cd-and-pushd-to-not-persist
endlocal & ^
cd %PATH_SRC%\%1& ^
set SCM_COMORREV=%SCM_COMORREV%& ^
set SCM_TAG=%SCM_TAG%& ^
set SCM_BRANCH=%SCM_BRANCH%& ^
set SCM_COMORREV_DATE=%SCM_COMORREV_DATE%& ^
set SCM_URL=%SCM_URL%
if "%CUR_DEBUG%"=="1" (
	echo SCM_COMORREV:%SCM_COMORREV%
	echo SCM_TAG:%SCM_TAG%
	echo SCM_BRANCH:%SCM_BRANCH%
	echo SCM_COMORREV_DATE:%SCM_COMORREV_DATE%
	echo SCM_URL:%SCM_URL%
)
if /I "%~2"=="cmake" (
	if exist %PATH_BUILD%\%1\. rmdir /S /Q %PATH_BUILD%\%1
	mkdir %PATH_BUILD%\%1
	cd /D %PATH_BUILD%\%1
)
echo.