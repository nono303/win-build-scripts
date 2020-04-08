@echo off
REM https://www.robvanderwoude.com/battech_inputvalidation_commandline.php
REM https://stackoverflow.com/questions/9102422/windows-batch-set-inside-if-not-working

call %PATH_MODULES_COMMON%\ymdhis.bat
IF /I "%~2"=="ALL" (
	SET LOGNAME=%PATH_LOGS%\%1_ALL_%ymdhis%.log
) ELSE (
	SET LOGNAME=%PATH_HTTPD_SDK%\_logs\%1_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.log
)

IF /I "%~2"=="ALL" (
	echo on
	call %PATH_HTTPD_SDK%\vc15.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\x86.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\avx.bat 1 2>&1 | tee -a %LOGNAME%
	call %PATH_MODULES%\%1.bat %1 2>&1 | tee -a %LOGNAME%

	call %PATH_HTTPD_SDK%\vc15.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\x64.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\avx.bat 1 2>&1 | tee -a %LOGNAME%
	call %PATH_MODULES%\%1.bat %1 2>&1 | tee -a %LOGNAME%

	call %PATH_HTTPD_SDK%\vs16.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\x86.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\avx.bat 1 2>&1 | tee -a %LOGNAME%
	call %PATH_MODULES%\%1.bat %1 2>&1 | tee -a %LOGNAME%

	call %PATH_HTTPD_SDK%\vs16.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\x64.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\avx.bat 1 2>&1 | tee -a %LOGNAME%
	call %PATH_MODULES%\%1.bat %1 2>&1 | tee -a %LOGNAME%

	REM !AVX
	call %PATH_HTTPD_SDK%\vc15.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\x86.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\avx.bat 0 2>&1 | tee -a %LOGNAME%
	call %PATH_MODULES%\%1.bat %1 2>&1 | tee -a %LOGNAME%

	call %PATH_HTTPD_SDK%\vc15.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\x64.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\avx.bat 0 2>&1 | tee -a %LOGNAME%
	call %PATH_MODULES%\%1.bat %1 2>&1 | tee -a %LOGNAME%

	call %PATH_HTTPD_SDK%\vs16.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\x86.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\avx.bat 0 2>&1 | tee -a %LOGNAME%
	call %PATH_MODULES%\%1.bat %1 2>&1 | tee -a %LOGNAME%

	call %PATH_HTTPD_SDK%\vs16.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\x64.bat 2>&1 | tee -a %LOGNAME%
	call %PATH_HTTPD_SDK%\avx.bat 0 2>&1 | tee -a %LOGNAME%
	call %PATH_MODULES%\%1.bat %1 2>&1 | tee -a %LOGNAME%
) ELSE (
	echo on
	call %PATH_MODULES%\%1.bat %1 2>&1 | tee %LOGNAME%
)
@echo off
dos2unix %LOGNAME%
cd /D %PATH_HTTPD_SDK%