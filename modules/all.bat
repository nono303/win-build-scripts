call %PATH_BATCH%\go.bat clean NOLOG
call %PATH_BATCH%\go.bat httpdanddeps NOLOG
call %PATH_BATCH%\go.bat subversionanddeps NOLOG
call %PATH_BATCH%\go.bat phpanddeps NOLOG
call %PATH_BATCH%\go.bat projgeolibanddeps NOLOG
call %PATH_BATCH%\go.bat bininfo checkavx updaterc 
if exist %PATH_BUILD%\. rmdir /S /Q %PATH_BUILD%\