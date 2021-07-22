@echo off && call %PATH_MODULES_COMMON%\init.bat %1

REM /******** > 2021-07-21 TMP !! vs17 non disponible ********/
if not exist %PATH_SRC%\%1\win32\%MSVC_DEPS%_%ARCH%\. mklink /J %PATH_SRC%\%1\win32\%MSVC_DEPS%_%ARCH% %PATH_SRC%\%1\win32\vs16_%ARCH%
set VCDIR=win32\%MSVC_DEPS%_%ARCH%
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR:\=/%" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER%

REM	https://github.com/winlibs/libffi/issues/3
REM	C:\sdk\src\libffi\include\ffi.h.old.x86_win32 l.169
REM		Need minimal decorations for DLLs to works on Windows. GCC has autoimport and autoexport. Rely on Libtool to help MSVC export from a DLL, but always declare data to be imported for MSVC clients. This costs an extra indirection for MSVC clients using the static version of the library, but don't worry about that. Besides, as a workaround, they can define FFI_BUILDING if they *know* they are going to link with the static library.
REM	go libffi
REM		C:\sdk\src\libffi\include\ffi.h(46,1): warning C4005: 'FFI_BUILDING': macro redefinition (compiling source file ..\..\..\src\prep_cif.c) [C:\sdk\src\libffi\win32\vs16_x64\libffi\libffi.vcxproj]
REM		C:\sdk\src\libffi\src\prep_cif.c : message : see previous definition of 'FFI_BUILDING' [C:\sdk\src\libffi\win32\vs16_x64\libffi\libffi.vcxproj]
REM	go php
REM		ffi.obj : error LNK2001: unresolved external symbol __imp_ffi_closure_free, __imp_ffi_prep_closure_loc, __imp_ffi_type_double, __imp_ffi_type_float, __imp_ffi_prep_cif_var, __imp_ffi_type_uint32, __imp_ffi_type_sint64, __imp_ffi_type_sint8, __imp_ffi_type_uint8, __imp_ffi_type_uint64, __imp_ffi_prep_cif, __imp_ffi_type_pointer, __imp_ffi_type_uint16, __imp_ffi_call, __imp_ffi_type_sint32, __imp_ffi_closure_alloc, __imp_ffi_type_void, __imp_ffi_type_sint16
sed -i 's/define LIBFFI_H/define LIBFFI_H\n#define FFI_BUILDING 1 /g' %CYGPATH_SRC%/%1/include/ffi.h

	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\libffi-msvc.sln ^
	%MSBUILD_OPTS% ^
	/nowarn:C4005 ^
	/t:Clean,libffi ^
	/p:Configuration=Release ^
	/p:Platform="%archmsbuild%"

if %ARCH% == x64 (set RELFFI=%ARCH%\Release)
if %ARCH% == x86 (set RELFFI=Release)

for %%D in (%VCDIR%\%RELFFI%\libffi.lib %VCDIR%\%RELFFI%\libffi.pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%%D %PATH_INSTALL%\lib\*)
for %%D in (src\x86\ffitarget.h fficonfig.h include\ffi.h) do (xcopy /C /F /Y %PATH_SRC%\%1\%%D %PATH_INSTALL%\include\*)