call %PATH_BATCH%\go.bat httpdanddeps NOLOG
call %PATH_BATCH%\go.bat phpanddeps NOLOG
call %PATH_BATCH%\go.bat subversionanddeps NOLOG
call %PATH_BATCH%\go.bat projgeolibanddeps NOLOG
call %PATH_BATCH%\go.bat nssm NOLOG
call %PATH_BATCH%\go.bat php-cgi-spawner NOLOG
call %PATH_BATCH%\go.bat dependencies NOLOG
call %PATH_BATCH%\go.bat bininfo checkavx
call %PATH_BATCH%\go.bat libcheck
if exist %PATH_BUILD%\. rmdir /S /Q %PATH_BUILD%\