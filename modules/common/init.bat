cd %PATH_SRC%\%1
git reset --hard
git clean -fdx
if exist %PATH_BUILD%\%1\. rmdir /S /Q %PATH_BUILD%\%1
mkdir %PATH_BUILD%\%1
cd /D %PATH_BUILD%\%1