call pip cache purge
call pip list
call %PATH_SOFTS%\python3\python.exe -m pip install --upgrade pip
call pip-review -a -v --pre
call pip list
@echo off
echo.
echo #####################################################################
echo # clean "C:\ProgramData\Package Cache" *v3.14* after python upgrade #
echo #####################################################################