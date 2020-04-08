@echo off
if %1 == 1 (
	set AVX=/arch:AVX
	set AVXB=-avx
	set AVXSED=\/arch:AVX
	set AVXMSC=-arch:AVX
	set AVXVCX="<EnableEnhancedInstructionSet>AdvancedVectorExtensions<\/EnableEnhancedInstructionSet>"
		REM php
	set outdirphp=-avx
	set intrinsics=,sse3,ssse3,sse4.1,sse4.2,avx
	echo ~~-~~  AVX ~~-~~
)
if %1 == 0 (
	set AVX=
	set AVXB=
	set AVXSED=
	set AVXMSC=
	set AVXVCX=
		REM php
	set outdirphp=
	set intrinsics=
	echo ~~-~~ SSE2 ~~-~~
)

if exist %PATH_INSTALL%\. rmdir /S /Q %PATH_INSTALL%
mklink /J %PATH_INSTALL% %PATH_HTTPD_SDK%\release\%MSVC_DEPS%_%ARCH%%AVXB%
if not exist %PATH_INSTALL%\lib\. mkdir %PATH_INSTALL%\lib
if not exist %PATH_INSTALL%\bin\. mkdir %PATH_INSTALL%\bin
if not exist %PATH_INSTALL%\include\. mkdir %PATH_INSTALL%\include

	REM /GL ko sur nghttp2. /GL ko si /Zi http://forums.codeguru.com/showthread.php?556135-ZI-and-GL-incompatible
set EXTCFLAGSNGHTTP2=/GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP%NUMBER_OF_PROCESSORS% /LD /MD /Zi /Ox %AVX%
set EXTCFLAGS=/GL %EXTCFLAGSNGHTTP2%

call %PATH_VS%\VC\Auxiliary\Build\vcvarsall.bat %ARCH% -vcvars_ver=%vcvars_ver%
echo on