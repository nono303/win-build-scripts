@echo off
setlocal enabledelayedexpansion
if %1 == rm (
	if not exist %2 (
		echo rm err  '%2' file not found
		goto end
	)
	for /f "delims=" %%i in ('rm -fv %2 2^>^&1') do (echo %%i)
	goto end
)
if %1 == mv (
	for /f "delims=" %%i in ('mv -fv %2 %3 2^>^&1') do (
		set filopres=%%i
		IF "!filopres:~0,15!"=="mv: cannot stat" (
			echo mv err  '%2 -^> %3' file not found
			goto end
		) else (
			echo %%i
			goto end
		)
	)
	goto end
)
if %1 == cp (
	for /f "delims=" %%i in ('xcopy /C /F /Y %2 %3 2^>^&1') do (
		set filopres=%%i
		IF "!filopres:~0,19!"=="Fichier introuvable" (
			echo cp err  '%2 -^> %3' file not found
			goto end
		) else (
			echo copied  '%%i'
			goto end
		)
	)
)
if %1 == cpdir (
	for /f "delims=" %%i in ('xcopy /E /C /F /Y %2 %3 2^>^&1') do (
		set filopres=%%i
		IF "!filopres:~0,19!"=="Fichier introuvable" (
			echo cp err  '%2 -^> %3' directory not found
			goto end
		) else (
			REM https://stackoverflow.com/a/17584764
			SET "var="&for /f "delims=0123456789" %%i in ("!filopres:~0,1!") do set var=%%i
			if defined var (
				echo copied  '%%i'
			) else (
				goto end
			)
		)
	)
)
endlocal
echo Unknown command '%1'
exit /B
:end