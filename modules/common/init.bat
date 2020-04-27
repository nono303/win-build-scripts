cd %PATH_SRC%\%1
if exist %PATH_SRC%\%1\.git\. (
	git reset --hard
	git clean -fdx
)
if exist %PATH_SRC%\%1\.svn\. (
	svn revert . -R
	svn cleanup . --remove-unversioned --remove-ignored
)
if /I "%~2"=="cmake" (
	if exist %PATH_BUILD%\%1\. rmdir /S /Q %PATH_BUILD%\%1
	mkdir %PATH_BUILD%\%1
	cd /D %PATH_BUILD%\%1
)