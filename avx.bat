@echo off
if %1 == 1 (
	set AVXECHO=avx
	set AVX=/arch:AVX
	set AVXB=-avx
	set AVXDIR=\avx
	set AVXSED=\/arch:AVX
	set AVXMSC=-arch:AVX
	set AVXVCX="<EnableEnhancedInstructionSet>AdvancedVectorExtensions<\/EnableEnhancedInstructionSet>"
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
	set AVXVCX="\n"
		REM php
	set outdirphp=
	set intrinsics=
	echo ~~-~~ SSE2 ~~-~~
)

set PATH_BUILD=%PATH_BUILDROOT%\%MSVC_DEPS%_%ARCH%%AVXB%
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -u %PATH_BUILD%`) do (set CYGPATH_BUILD=%%F)
set PATH_INSTALL=%PATH_RELEASE%\%MSVC_DEPS%_%ARCH%%AVXB%
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\cygpath -m %PATH_INSTALL%`) do (set SLASHPATH_INSTALL=%%F)
for %%s in (lib bin include) do (if not exist %PATH_INSTALL%\%%s\. mkdir %PATH_INSTALL%\%%s)

	REM /GL ko sur nghttp2. /GL ko si /Zi http://forums.codeguru.com/showthread.php?556135-ZI-and-GL-incompatible
set EXTCFLAGSNGHTTP2=/GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP%NUMBER_OF_PROCESSORS% /LD /MD /Zi /Ox %AVX%
set EXTCFLAGS=/GL %EXTCFLAGSNGHTTP2%
call %PATH_VS%\VC\Auxiliary\Build\vcvarsall.bat %ARCH% %WKITVER% -vcvars_ver=%vcvars_ver%
@echo off