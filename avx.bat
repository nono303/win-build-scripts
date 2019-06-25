echo off
if %1 == 1 (
	set AVX=/arch:AVX
	set AVXB=-avx
	set AVXSED=\/arch:AVX
	set AVXMSC=-arch:AVX
	set AVXVCX="<EnableEnhancedInstructionSet>AdvancedVectorExtensions<\/EnableEnhancedInstructionSet>"
	echo ~~-~~  AVX ~~-~~
)
if %1 == 0 (
	set AVX=
	set AVXB=
	set AVXSED=
	set AVXMSC=
	set AVXVCX=
	echo ~~-~~ SSE2 ~~-~~
)

rmdir /S /Q C:\httpd-sdk\install
mklink /J C:\httpd-sdk\install C:\httpd-sdk\%MSVC_DEPS%_%ARCH%%AVXB%

REM /GL ko sur nghttp2. /GL ko si /Zi http://forums.codeguru.com/showthread.php?556135-ZI-and-GL-incompatible
set EXTCFLAGSNGHTTP2=/GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox %AVX%
set EXTCFLAGS=/GL %EXTCFLAGSNGHTTP2%

call C:\msvc16\VC\Auxiliary\Build\vcvarsall.bat %ARCH% -vcvars_ver=%vcvars_ver%
echo on