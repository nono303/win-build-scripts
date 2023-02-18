@echo off && call %PATH_MODULES_COMMON%\init.bat %1

if %ARCH% == x64 (
	set sslarch=-x64
	set OUTDIR_CONF=amd64
)
if %ARCH% == x86 (
	set sslarch=
	set OUTDIR_CONF=win32
)

FOR /F "tokens=* USEBACKQ" %%F in (`call do_php %PATH_UTILS%\sub\version.php sqlite veronly`) do (set SQLITE_VERSION=%%F)
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/PCbuild" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

MSBuild.exe %PATH_SRC%\%1\PCbuild\pcbuild.proj %MSBUILD_OPTS% ^
/p:Configuration=Release ^
/p:Platform="%archmsbuild%" ^
/p:IncludeExtensions=true ^
/p:IncludeExternals=true ^
/p:IncludeTests=false ^
/p:IncludeCTypes=true ^
/p:IncludeSSL=true ^
/p:IncludeTkinter=false ^
/p:IncludeUwp=true ^
/p:EXTERNALS_DIR=%PATH_INSTALL%\ ^
/p:ExternalsSrcDir=%PATH_SRC%\ ^
/p:_DLLSuffix=-%OPENSSL_SUF%%sslarch% ^
/p:SqliteVersionStrToParse=%SQLITE_VERSION% ^
/t:RebuildAll ^
/nowarn:C4244;C4267

if %LOCAL_COPY% == 1 (
	xcopy /C /F /Y %PATH_SRC%\%1\PCbuild\%OUTDIR_CONF%\*.pyd %LOCAL_PATH_PYTHON%\DLLs\*
	xcopy /C /F /Y %PATH_SRC%\%1\PCbuild\%OUTDIR_CONF%\*.lib %LOCAL_PATH_PYTHON%\libs\*
	for %%G in (py.exe pyshellext.dll python.exe python3.dll python38.dll pythonw.exe pythonw_uwp.exe python_uwp.exe pyw.exe venvlauncher.exe venvwlauncher.exe _freeze_importlib.exe) do  (
		call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\PCbuild\%OUTDIR_CONF%\%%G
		xcopy /C /F /Y %PATH_SRC%\%1\PCbuild\%OUTDIR_CONF%\%%G %LOCAL_PATH_PYTHON%\*
		xcopy /C /F /Y %PATH_SRC%\%1\PCbuild\%OUTDIR_CONF%\%%~nG.pdb %LOCAL_PATH_PYTHON%\*
	)
	call do_php %PATH_UTILS%\sub\version.php sqlite %PATH_SRC%\%1\PCbuild\%OUTDIR_CONF%\sqlite3.dll
	xcopy /C /F /Y %PATH_SRC%\%1\PCbuild\%OUTDIR_CONF%\sqlite3.dll %LOCAL_PATH_PYTHON%\*
	xcopy /C /F /Y %PATH_SRC%\%1\PCbuild\%OUTDIR_CONF%\sqlite3.pdb %LOCAL_PATH_PYTHON%\*
	call do_php %PATH_UTILS%\sub\bininfo.php %LOCAL_PATH_PYTHON%\ checkavx
)