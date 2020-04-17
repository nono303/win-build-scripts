@echo off
REM https://www.robvanderwoude.com/battech_inputvalidation_commandline.php
REM https://stackoverflow.com/questions/9102422/windows-batch-set-inside-if-not-working

call %PATH_MODULES_COMMON%\ymdhis.bat
IF /I "%~2"=="ALL" (
	SET LOGNAME=%PATH_LOGS%\%1_ALL_%ymdhis%.log
) ELSE (
	SET LOGNAME=%PATH_LOGS%\%1_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.log
)
IF /I "%~2"=="ALL" (
	for %%V in (vc15 vs16) do (
		for %%X in (x86 x64) do (
			for %%A in (0 1) do (
				setlocal
				call %PATH_HTTPD_SDK%\%%V.bat
				call %PATH_HTTPD_SDK%\%%X.bat
				call %PATH_HTTPD_SDK%\avx.bat %%A
				call %PATH_MODULES%\%1.bat %1 2>&1 | tee -a %LOGNAME%
				endlocal
			)
		)
	)
) ELSE (
	call %PATH_MODULES%\%1.bat %1 2>&1 | tee %LOGNAME%
)
dos2unix %LOGNAME%
cd /D %PATH_HTTPD_SDK%