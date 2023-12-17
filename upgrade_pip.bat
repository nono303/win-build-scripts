call pip list
call %PATH_SOFTS%\python3\python.exe -m pip install --upgrade pip
call pip-review -a -v --pre
call pip list