@echo off && call %PATH_UTILS%\init.bat %1 cmake nocxx

echo ** [submodule] libinjection
CD %PATH_SRC%\%1
git submodule init
git submodule update --remote --merge --progress
REM force rebuild
cd %PATH_SRC%\%1\apache2\others\libinjection
call git clean -fdx > NUL
call git reset --hard > NUL

CD %PATH_BUILD%\%1
if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DINSTALL_PDB=ON ^
%PATH_SRC%\%1
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_UTILS%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for %%X in (modules\mod_security2.so bin\mlogc.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\%%X)
for %%X in (lib\mod_security2.exp lib\mod_security2.lib bin\mlogc-batch-load.pl) do (rm -fv %PATH_INSTALL%\%%X)
