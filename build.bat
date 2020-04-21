@echo off
echo ########################### BEGIN '%1' %MSVC_DEPS% %ARCH% %AVXB:-=% ###########################
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
				call %PATH_BATCH%\%%V.bat
				call %PATH_BATCH%\%%X.bat
				call %PATH_BATCH%\avx.bat %%A
				call %PATH_MODULES%\%1.bat %1 2>&1 | tee -a %LOGNAME%
				endlocal
			)
		)
	)
) ELSE (
	call %PATH_MODULES%\%1.bat %1 2>&1 | tee %LOGNAME%
)
dos2unix %LOGNAME%
echo ############################ END '%1' %MSVC_DEPS% %ARCH% %AVXB:-=% ############################
cd /D %PATH_BATCH%