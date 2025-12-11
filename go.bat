@echo off
if /I "%1"=="HELP" (
	type usage.txt
	exit /B
)
	REM ~~~~~~~~~~~~ PARSING ARGS
setlocal enabledelayedexpansion	
set ARG_ALL=0
set ARG_NOLOG=0
set ARG_DEBUG=0
set ARG_KEEPSRC=0
set ARG_SVN=0
set ARG_CMOPTS=0
for %%x in (%*) do (
	set /A argCount+=1
	set "argVec[!argCount!]=%%~x"
)
for /L %%i in (2,1,%argCount%) do (
	if /I "!argVec[%%i]!"=="ALL"	 set ARG_ALL=1
	if /I "!argVec[%%i]!"=="NOLOG"	 set ARG_NOLOG=1
	if /I "!argVec[%%i]!"=="VERBOSE" set ARG_DEBUG=1
	if /I "!argVec[%%i]!"=="KEEPSRC" set ARG_KEEPSRC=1
	if /I "!argVec[%%i]!"=="SVN"	 set ARG_SVN=1
	if /I "!argVec[%%i]!"=="CMOPTS"	 set ARG_CMOPTS=1
)
	REM ~~~~~~~~~~~~ VERBOSE
set CUR_DEBUG=0
if "%ARG_DEBUG%" == "1" (
	set CUR_DEBUG=1
) else (
	if %DEBUG_BUILD% == 1 (
		set CUR_DEBUG=1
	)
)
if %CUR_DEBUG% == 1 (
	echo on
	echo ARG_ALL:     %ARG_ALL%
	echo ARG_NOLOG:   %ARG_NOLOG%
	echo ARG_DEBUG:   %ARG_DEBUG%
	echo ARG_KEEPSRC: %ARG_KEEPSRC%
	echo ARG_SVN:     %ARG_SVN%
	echo ARG_CMOPTS:  %ARG_CMOPTS%
)

	REM ~~~~~~~~~~~~ LOGNAME
call %PATH_MODULES_COMMON%\ymdhis.bat
set PREFIXLOG=%1
if %1 == full (IF not [%2] == [] (set PREFIXLOG=%1-%2))
if %ARG_ALL% == 1 (
	set LOGNAME=%PATH_LOGS%\%PREFIXLOG%_ALL_%ymdhis%.log
) else (
	set LOGNAME=%PATH_LOGS%\%PREFIXLOG%_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.log
)

	REM ~~~~~~~~~~~~ FIND BATCH
set BCMD=
set BAFF=
if exist %PATH_MODULES%\%1.bat (
	set BCMD=%PATH_MODULES%\%1.bat %*
	set BAFF=BUILD
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

	REM ~~~~~~~~~~~~ DEDUPLICATE ENV VAR
for %%D in (EXTERNAL_INCLUDE INCLUDE LIB) do (for /F "tokens=* USEBACKQ" %%F in (`call do_php %PATH_UTILS%\sub\deduplicate.php %%D`) do (set %%D=%%F))

	REM ~~~~~~~~~~~~ RUN
echo ####### BEGIN %BAFF% %1 %MSVC_DEPS% %ARCH% %AVXECHO% [%ymdhis%] #######
if "%ARG_SVN%" == "1" (
	set PATH_INSTALL_SAV=%PATH_INSTALL%
	set PATH_INSTALL=%PATH_INSTALL%.svn
)
set STARTTIME=%TIME%
if %ARG_ALL% == 1 (
	for %%V in (vs17 vs18) do (
		for %%A in (2 1 0) do (
			setlocal
			call %PATH_BATCH%\%%V.bat
			call %PATH_BATCH%\x64.bat
			call %PATH_BATCH%\avx.bat %%A
			call %BCMD% 2>&1 | tee -a %LOGNAME%
			endlocal
		)
	)
	call dos2unix -q -f %LOGNAME%
) else (
	if %ARG_NOLOG% == 1 (
		call %BCMD% 2>&1
	) else (
		call %BCMD% 2>&1 | tee %LOGNAME%
		call dos2unix -q -f %LOGNAME%
	)
)
if "%ARG_CMOPTS%"=="1" (
	call do_php %PATH_UTILS%\sub\cmopts.php %1 %LOGNAME%
)
set ENDTIME=%TIME%
set /A DURATION=10 * ((((%ENDTIME:~0,2%-100)*360000 + (1%ENDTIME:~3,2%-100)*6000 + (1%ENDTIME:~6,2%-100)*100 + (1%ENDTIME:~9,2%-100))-((%STARTTIME:~0,2%-100)*360000 + (1%STARTTIME:~3,2%-100)*6000 + (1%STARTTIME:~6,2%-100)*100 + (1%STARTTIME:~9,2%-100))))
if "%ARG_SVN%" == "1" (
	set PATH_INSTALL=%PATH_INSTALL_SAV%
)
echo ####### END %BAFF% %1 %MSVC_DEPS% %ARCH% %AVXECHO% [%DURATION%] #######
cd /D %PATH_BATCH%