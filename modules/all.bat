call %PATH_BATCH%\build.bat httpdanddeps NOLOG
call %PATH_BATCH%\build.bat subversionanddeps NOLOG
call %PATH_BATCH%\build.bat phpanddeps NOLOG
call %PATH_BATCH%\build.bat bininfo checkavx updaterc 