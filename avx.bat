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