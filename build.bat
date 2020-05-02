@echo off
call %PATH_MODULES_COMMON%\ymdhis.bat
set BCMD=
set BAFF=
if exist %PATH_MODULES%\%1.bat (
	set BCMD=%PATH_MODULES%\%1.bat %*
	set BAFF=BUILD MODULE
)
if exist %PATH_UTILS%\%1.bat (
	set BCMD=%PATH_UTILS%\%1.bat %*
	set BAFF=TOOL
)
if "%BCMD%"=="" (
	echo unknow commande '%1'
	exit /B -1
)
echo %ymdhis% ####### BEGIN %BAFF% '%1' %MSVC_DEPS% %ARCH% %AVXECHO% ###########################
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
				call %BCMD% 2>&1 | tee -a %LOGNAME%
				endlocal
			)
		)
	)
	call dos2unix %LOGNAME%
) else (
	set NOLG=0
	if /I "%~2"=="NOLOG" (set NOLG=1)
	if "%1"=="logcheck" (set NOLG=1)
	if "%NOLG%"=="1" (
		call %BCMD% 2>&1
	) else (
		call %BCMD% 2>&1 | tee %LOGNAME%
		call dos2unix %LOGNAME%
	)
)
call %PATH_MODULES_COMMON%\ymdhis.bat
echo %ymdhis% #######  END  %BAFF% '%1' %MSVC_DEPS% %ARCH% %AVXECHO% ###########################
cd /D %PATH_BATCH%