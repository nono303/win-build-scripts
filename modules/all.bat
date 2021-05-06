call %PATH_BATCH%\go.bat clean NOLOG
call %PATH_BATCH%\go.bat httpdanddeps NOLOG
call %PATH_BATCH%\go.bat subversionanddeps NOLOG
call %PATH_BATCH%\go.bat phpanddeps NOLOG
call %PATH_BATCH%\go.bat projgeolibanddeps NOLOG
REM call %PATH_BATCH%\go.bat verpatch NOLOG
REM call %PATH_BATCH%\go.bat sdlna NOLOG
REM call %PATH_BATCH%\go.bat mobac NOLOG
REM call %PATH_BATCH%\go.bat nssm NOLOG
REM call %PATH_BATCH%\go.bat memcached NOLOG
call %PATH_BATCH%\go.bat bininfo checkavx updaterc 