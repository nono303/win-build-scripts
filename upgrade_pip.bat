@echo off
call pip cache purge
call pip list
REM https://stackoverflow.com/questions/33669846/forcing-pip-to-recompile-a-previously-installed-package-numpy-after-switchin
REM   --no-binary :all: 
call %PATH_SOFTS%\python3\python.exe -m pip install --upgrade pip
call pip-review -a -v --pre 
call pip list
@echo off
echo.
echo ####################################################################
echo # clean "C:\ProgramData\Package Cache" *v3.1* after python upgrade #
echo ####################################################################