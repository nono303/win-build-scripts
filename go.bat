@echo off
if /I "%1"=="HELP" (
	type usage.txt
	exit /B
)
setlocal enabledelayedexpansion
	REM ~~~~~~~~~~~~ PARSING ARGS
set ARG_NOLOG=0
set ARG_DEBUG=0
set ARG_ALL=0
set ARG_KEEPSRC=0
	REM setlocal enabledelayedexpansion
set argCount=0
for %%x in (%*) do (
   set /A argCount+=1
   set "argVec[!argCount!]=%%~x"
)
for /L %%i in (2,1,%argCount%) do (
	if /I "!argVec[%%i]!"=="ALL"   set ARG_ALL=1
	if /I "!argVec[%%i]!"=="NOLOG" set ARG_NOLOG=1
	if /I "!argVec[%%i]!"=="VERBOSE" set ARG_DEBUG=1
	if /I "!argVec[%%i]!"=="KEEPSRC" set ARG_KEEPSRC=1
)
	REM ~~~~~~~~~~~~ VERBOSE
set CUR_DEBUG=0
if %ARG_DEBUG% == 1 (
	set CUR_DEBUG=1
) else (
	if %DEBUG_BUILD% == 1 (
		set CUR_DEBUG=1
	)
)
if %CUR_DEBUG% == 1 (
	echo on
	echo ARG_NOLOG: %ARG_NOLOG%
	echo ARG_DEBUG: %ARG_DEBUG%
	echo ARG_ALL:   %ARG_ALL%
)

	REM ~~~~~~~~~~~~ LOGNAME
call %PATH_MODULES_COMMON%\ymdhis.bat
if %ARG_ALL% == 1 (
	set LOGNAME=%PATH_LOGS%\%1_ALL_%ymdhis%.log
) else (
	set LOGNAME=%PATH_LOGS%\%1_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.log
)

	REM ~~~~~~~~~~~~ FIND BATCH
set BCMD=
set BAFF=
if exist %PATH_MODULES%\%1.bat (
	set BCMD=%PATH_MODULES%\%1.bat %*
	set BAFF=BUILD MODULE
)
if exist %PATH_UTILS%\%1.bat (
	set BCMD=%PATH_UTILS%\%1.bat %*
	set BAFF=TOOL
	set ARG_NOLOG=1
)
if "%BCMD%"=="" (
	echo unknow commande '%1'
	type usage.txt
	exit /B -1
)

	REM ~~~~~~~~~~~~ RUN
echo %ymdhis% ####### BEGIN %BAFF% '%1' %MSVC_DEPS% %ARCH% %AVXECHO% ###########################
if %ARG_ALL% == 1 (
	for %%V in (vs17 vs16 vc15) do (
		for %%X in (x64 x86) do (
			for %%A in (1 0) do (
				setlocal
				call %PATH_BATCH%\%%V.bat
				call %PATH_BATCH%\%%X.bat
				call %PATH_BATCH%\avx.bat %%A
				call %BCMD% 2>&1 | tee -a %LOGNAME%
				endlocal
			)
		)
	)
	call dos2unix -f %LOGNAME%
) else (
	
	if %ARG_NOLOG% == 1 (
		call %BCMD% 2>&1
	) else (
		call %BCMD% 2>&1 | tee %LOGNAME%
		call dos2unix -f %LOGNAME%
	)
)
call %PATH_MODULES_COMMON%\ymdhis.bat
echo %ymdhis% #######  END  %BAFF% '%1' %MSVC_DEPS% %ARCH% %AVXECHO% ###########################
cd /D %PATH_BATCH%