@echo off
if "%~3"=="" (set PV=%2) else (set PV=%3)
for /F %%i in ("%1") do set VER_PN=%%~ni
call %BIN_VERPATCH% %1 %2 /va /fn /high /pv %PV% /s product "%VER_PN%"