@echo off && call %PATH_UTILS%\init.bat %1

	REM C:\sdk\src\jemalloc\include\jemalloc\internal\jemalloc_internal_defs.h
	REM C:\sdk\src\jemalloc\include\jemalloc\internal\jemalloc_preamble.h
	REM C:\sdk\src\jemalloc\include\jemalloc\internal\public_namespace.h
	REM C:\sdk\src\jemalloc\include\jemalloc\internal\public_unnamespace.h
	REM C:\sdk\src\jemalloc\include\jemalloc\jemalloc.h
	REM C:\sdk\src\jemalloc\include\jemalloc\jemalloc_defs.h
	REM C:\sdk\src\jemalloc\include\jemalloc\jemalloc_macros.h
	REM C:\sdk\src\jemalloc\include\jemalloc\jemalloc_mangle.h
	REM C:\sdk\src\jemalloc\include\jemalloc\jemalloc_mangle_jet.h
	REM C:\sdk\src\jemalloc\include\jemalloc\jemalloc_protos.h
	REM C:\sdk\src\jemalloc\include\jemalloc\jemalloc_protos_jet.h
	REM C:\sdk\src\jemalloc\include\jemalloc\jemalloc_rename.h
	REM C:\sdk\src\jemalloc\include\jemalloc\jemalloc_typedefs.h
	REM C:\sdk\src\jemalloc\test\include\test\jemalloc_test.h
	REM C:\sdk\src\jemalloc\test\include\test\jemalloc_test_defs.h
REM  --with-version=%GET_VERSION% 
%PATH_BIN_CYGWIN%\sh.exe -c 'CC=%BIN_CCCL% CXX=%BIN_CCCL% LD=%BIN_CCCL% ./autogen.sh --disable-doc --enable-shared --disable-static'
set JEMALLOC_VCVER=vc2022
if %ARG_KEEPSRC% == 0 (call do_php %PATH_UTILS%/msbuild.php "%PATH_SRC%/%1/msvc/projects/%JEMALLOC_VCVER%/jemalloc/" %AVX_MSBUILD% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER% nostd)
set OUTDIR_CONF=Release

MSBuild.exe msvc\jemalloc_%JEMALLOC_VCVER%.sln %MSBUILD_OPTS% ^
/t:Clean,jemalloc ^
/p:Configuration=%OUTDIR_CONF% ^
/p:Plateform="%ARCH%"

for %%X in (dll pdb) do (move /Y %PATH_SRC%\%1\msvc\%archmsbuild%\%OUTDIR_CONF%\jemalloc.%%X %PATH_INSTALL%\bin)
move /Y %PATH_SRC%\%1\msvc\%archmsbuild%\%OUTDIR_CONF%\jemalloc.lib %PATH_INSTALL%\lib
if not exist %PATH_INSTALL%\include\%1\. mkdir %PATH_INSTALL%\include\%1\
xcopy /C /F /Y %PATH_SRC%\%1\include\%1\jemalloc.h %PATH_INSTALL%\include\%1\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\jemalloc.dll