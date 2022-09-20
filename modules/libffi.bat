@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=msvc_build
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR:\=/%" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

if %ARCH% == x86 (sed -i 's/X86_WIN64/X86_WIN32/g' %CYGPATH_SRC%/%1/msvc_build/include/ffi.h)

MSBuild.exe %PATH_SRC%\%1\%VCDIR%\Ffi_staticLib.sln %MSBUILD_OPTS% ^
/nowarn:C4018,C4102,C4013,C4267 ^
/p:Configuration=dynamic-Release ^
/p:Platform="%archmsbuild%"

for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\%1\%VCDIR%\out\libffi.lib') do (xcopy /C /F /Y %%I %PATH_INSTALL%\lib\*)
for %%D in (libffi.dll libffi.pdb) do (
	for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\%1\%VCDIR%\out\%%D') do (xcopy /C /F /Y %%I %PATH_INSTALL%\bin\*)
)
for %%D in (msvc_build\include\ffi.h src\x86\ffitarget.h) do (
	xcopy /C /F /Y %PATH_SRC%\%1\%%D %PATH_INSTALL%\include\*
)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libffi.dll