@echo off
echo ########################### BEGIN '%1' %MSVC_DEPS% %ARCH% %AVXECHO% ###########################
call %PATH_MODULES_COMMON%\ymdhis.bat
if /I "%~2"=="DEBUG" (
	echo on
) else (
	if %DEBUG_BUILD% == 1 (
		echo on
	)
)
if /I "%~2"=="ALL" (
	set LOGNAME=%PATH_LOGS%\%1_ALL_%ymdhis%.log
) else (
	set LOGNAME=%PATH_LOGS%\%1_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.log
)
if /I "%~2"=="ALL" (
	for %%V in (vc15 vs16) do (
		for %%X in (x86 x64) do (
			for %%A in (0 1) do (
				setlocal
				call %PATH_BATCH%\%%V.bat
				call %PATH_BATCH%\%%X.bat
				call %PATH_BATCH%\avx.bat %%A
				call %PATH_MODULES%\%1.bat %1 2>&1 | tee -a %LOGNAME%
				endlocal
			)
		)
	)
	call dos2unix %LOGNAME%
) else (
	if /I "%~2"=="NOLOG" (
		call %PATH_MODULES%\%1.bat %1 2>&1
	) else (
		call %PATH_MODULES%\%1.bat %1 2>&1 | tee %LOGNAME%
		call dos2unix %LOGNAME%
	)
)
echo ############################ END '%1' %MSVC_DEPS% %ARCH% %AVXECHO% ############################
cd /D %PATH_BATCH%