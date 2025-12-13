@echo off

call %PATH_MODULES_COMMON%\init.bat %1 cmake nocxx

if "%ARG_CMOPTS%"=="1" (@echo on)
cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
-DCMAKE_UNITY_BUILD=1 ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DINSTALL_PDB=1 ^
%PATH_SRC%\%1\modules\fcgid
@echo off
if "%ARG_CMOPTS%"=="1" (exit /B)

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA%

FOR /F "tokens=* USEBACKQ" %%F in (`do_php %PATH_UTILS%\sub\version.php httpd`) do (set HTTPD_VERSION=%%F)
if not "%PATH_GITHUB_MODFCGID%"=="" (
	for %%X in (so pdb lib) do (xcopy /C /F /Y %PATH_BUILD%\%1\%1.%%X %PATH_GITHUB_MODFCGID%\%MSVC_DEPS%\%ARCH%%AVXB%\*)
	call do_php %PATH_UTILS%\sub\version.php %1 %PATH_GITHUB_MODFCGID%\%MSVC_DEPS%\%ARCH%%AVXB%\%1.so "httpd:%HTTPD_VERSION%"
)

echo ^>^>^> go bininfo %PATH_GITHUB_MODFCGID% recurse checkavx ^> %PATH_GITHUB_MODFCGID%\bininfo.txt