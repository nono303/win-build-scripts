@echo off
if "%~3"=="" (set PV=%2) else (set PV=%3)
call %PATH_MODULES_COMMON%\ymdhis.bat
%BIN_VERPATCH% %1 /va /fn /high %2 /pv %PV% /s product "%ARCH% %MSVC_DEPS% (%vcvars_ver%)%AVXB:-= % - %ymdhis:_= %" /s copyright "https://github.com/nono303/win-build-scripts"