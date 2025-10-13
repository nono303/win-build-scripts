if %ARG_KEEPSRC% == 0 (
	echo    ^> apply %~nx1
	REM git apply --stat %1 2>&1 | gawk '{print "    " $0}' 
	git apply --verbose --ignore-space-change --ignore-whitespace %1 2>&1 | grep -v "Checking" | gawk '{print "     " $0}' 
) else (
	echo    # skip %~nx1
)