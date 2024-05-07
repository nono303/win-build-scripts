REM https://gist.github.com/erikvip/63b236078d4ff4163fd3
call %PATH_BIN_CYGWIN%\cygcheck -cd | tail -n+3 | cut -d' ' -f1 > %PATH_BATCH%\config\cyg64.packagelist
	rem WITH VERSION
REM call %PATH_BIN_CYGWIN%\cygcheck -cd > %PATH_BATCH%\config\cyg64.packagelist
call %BIN_VSINSTALLER% export --installPath "%PATH_VS%" --config "%PATH_BATCH%\config\.vsconfig"
call pip list > %PATH_BATCH%\config\python.pip