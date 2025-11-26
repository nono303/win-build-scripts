@echo off && call %PATH_MODULES_COMMON%\init.bat %1

%PATH_BIN_CYGWIN%\sh.exe -c "CC=cl ./autogen.sh"
set JEMALLOC_VCVER=vc2017
if %ARG_KEEPSRC% == 0 (call do_php %PATH_MODULES_COMMON%/msbuild.php "%PATH_SRC%/%1/msvc/projects/%JEMALLOC_VCVER%/jemalloc/" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER% nostd)
set OUTDIR_CONF=Release

MSBuild.exe msvc\jemalloc_%JEMALLOC_VCVER%.sln %MSBUILD_OPTS% ^
/t:Clean,jemalloc ^
/nowarn:C4028 ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Plateform="%ARCH%"

for %%X in (dll pdb) do (move /Y %PATH_SRC%\%1\msvc\%archmsbuild%\%OUTDIR_CONF%\jemalloc.%%X %PATH_INSTALL%\bin)
move /Y %PATH_SRC%\%1\msvc\%archmsbuild%\%OUTDIR_CONF%\jemalloc.lib %PATH_INSTALL%\lib
if not exist %PATH_INSTALL%\include\%1\. mkdir %PATH_INSTALL%\include\%1\
xcopy /C /F /Y %PATH_SRC%\%1\include\%1\jemalloc.h %PATH_INSTALL%\include\%1\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\jemalloc.dll