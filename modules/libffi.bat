@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=win32\%MSVC_DEPS%_%ARCH%
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR:\=/%" %AVXVCX% %PTFTS% %WKITVER%

REM https://github.com/winlibs/libffi/issues/3
sed -i 's/define LIBFFI_H/define LIBFFI_H\n#define FFI_BUILDING /g' %CYGPATH_SRC%/%1/include/ffi.h

	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\libffi-msvc.sln ^
	%MSBUILD_OPTS% ^
	/t:Clean,libffi ^
	/p:Configuration=Release ^
	/p:Platform="%archmsbuild%"

for %%D in (%VCDIR%\%ARCH%\Release\libffi.lib %VCDIR%\libffi\%ARCH%\Release\libffi.pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%%D %PATH_INSTALL%\lib\*)
for %%D in (src\x86\ffitarget.h fficonfig.h include\ffi.h) do (xcopy /C /F /Y %PATH_SRC%\%1\%%D %PATH_INSTALL%\include\*)