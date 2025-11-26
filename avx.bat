@echo off
REM GCC		https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html / https://gcc.gnu.org/onlinedocs/gcc/x86-Windows-Options.html
REM cl		https://docs.microsoft.com/fr-fr/cpp/build/reference/arch-x64 !! must be upper case
REM MSBuild	https://stackoverflow.com/a/64886471
REM https://en.wikipedia.org/wiki/List_of_Intel_CPU_microarchitectures
REM PHP: sse,sse2,sse3,ssse3,sse4.1,sse4.2,avx,avx2. SSE and SSE2 are enabled by default.
if %1 == 2 (
	set AVXECHO=avx2
	set AVXB=-avx2
	set AVX=/arch:AVX2
		REM mod_security / modsec-sdbm-util
	set AVX_SED=  \/arch:AVX2
		REM aom
	set AVX_ON=ON
	set AVX2_ON=ON
		REM php
	set intrinsics=,sse3,ssse3,sse4.1,sse4.2,avx,avx2
		REM MSBuild
	set AVX_MSBUILD=AdvancedVectorExtensions2
		REM libconfig.sh / memcached.sh / sslh.sh
	set AVX_GCC=skylake
		REM MPIR (used in phpsdk-local)
	set AVX_MPIR=skylake-avx
)
if %1 == 1 (
	set AVXECHO=avx
	set AVXB=-avx
	set AVX=/arch:AVX
		REM mod_security / modsec-sdbm-util
	set AVX_SED=  \/arch:AVX
		REM aom
	set AVX_ON=ON
	set AVX2_ON=OFF
		REM php
	set intrinsics=,sse3,ssse3,sse4.1,sse4.2,avx
		REM MSBuild
	set AVX_MSBUILD=AdvancedVectorExtensions
		REM libconfig.sh / memcached.sh / sslh.sh
	set AVX_GCC=sandybridge
		REM MPIR (used in phpsdk-local)
	set AVX_MPIR=sandybridge
)
if %1 == 0 (
	set AVXECHO=sse2
	set AVXB=
	set AVX=
		REM mod_security / modsec-sdbm-util
	set AVX_SED=
		REM aom
	set AVX_ON=OFF
	set AVX2_ON=OFF
		REM php
	set intrinsics=
		REM MSBuild - https://github.com/XhmikosR/notepad2-mod/issues/111
	set AVX_MSBUILD=NotSet
		REM libconfig.sh / memcached.sh / sslh.sh
	set AVX_GCC=core2
		REM MPIR (used in phpsdk-local)
	set AVX_MPIR=core2-penryn
)
echo ~~-~~ %AVXECHO% ~~-~~

set PATH_BUILD=%PATH_BUILDROOT%\%MSVC_DEPS%_%ARCH%%AVXB%
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_BUILD%`) do (set CYGPATH_BUILD=%%F)
set PATH_INSTALL=%PATH_RELEASE%\%MSVC_DEPS%_%ARCH%%AVXB%
	REM iso modules/clean.bat l.7
for %%s in (lib bin include %DIR_LIB_STATIC%) do (if not exist %PATH_INSTALL%\%%s\. mkdir %PATH_INSTALL%\%%s)

	REM https://github.com/microsoft/vcpkg/issues/8756
set __VSCMD_ARG_NO_LOGO=1
set VSCMD_SKIP_SENDTELEMETRY=1
	REM https://github.com/microsoft/vcpkg/blob/master/docs/users/config-environment.md
set VCPKG_KEEP_ENV_VARS=VSCMD_SKIP_SENDTELEMETRY
call %PATH_VS%\Common7\Tools\VsDevCmd.bat -arch=%ARCH% -vcvars_ver=%vcvars_ver% -winsdk=%WKITVER% -no_logo
@echo off