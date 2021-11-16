@echo off
REM https://docs.microsoft.com/fr-fr/cpp/build/reference/arch-x64?view=msvc-170
if %1 == 1 (
	set AVXECHO=avx
	set AVX=/arch:AVX
	set AVXB=-avx
	set AVXDIR=\avx
	set AVXSED=\/arch:AVX
	set AVXMSC=-arch:AVX
	set AVXVCX="<EnableEnhancedInstructionSet>AdvancedVectorExtensions<\/EnableEnhancedInstructionSet>\r\n"
		REM php
	set outdirphp=-avx
	set intrinsics=,sse3,ssse3,sse4.1,sse4.2,avx
	echo ~~-~~  AVX ~~-~~
)
if %1 == 0 (
	set AVXECHO=sse2
	set AVX=
	set AVXB=
	set AVXDIR=
	set AVXSED=
	set AVXMSC=
		REM https://github.com/XhmikosR/notepad2-mod/issues/111
	set AVXVCX="<EnableEnhancedInstructionSet>NotSet<\/EnableEnhancedInstructionSet>\r\n"
		REM php
	set outdirphp=
	set intrinsics=
	echo ~~-~~ SSE2 ~~-~~
)

set PATH_BUILD=%PATH_BUILDROOT%\%MSVC_DEPS%_%ARCH%%AVXB%
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_BUILD%`) do (set CYGPATH_BUILD=%%F)
set PATH_INSTALL=%PATH_RELEASE%\%MSVC_DEPS%_%ARCH%%AVXB%
for %%s in (lib bin include) do (if not exist %PATH_INSTALL%\%%s\. mkdir %PATH_INSTALL%\%%s)

	REM https://github.com/microsoft/vcpkg/issues/8756
set __VSCMD_ARG_NO_LOGO=1
set VSCMD_SKIP_SENDTELEMETRY=1
	REM https://github.com/microsoft/vcpkg/blob/master/docs/users/config-environment.md
set VCPKG_KEEP_ENV_VARS=VSCMD_SKIP_SENDTELEMETRY

call %PATH_VS%\VC\Auxiliary\Build\vcvarsall.bat %ARCH% %WKITVER% -vcvars_ver=%vcvars_ver%
@echo off