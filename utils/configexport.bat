for %%A in (32 64) do (
	REM https://gist.github.com/erikvip/63b236078d4ff4163fd3
	call %PATH_ROOT_CYGWIN%%%A\bin\cygcheck -cd | tail -n+3 | cut -d' ' -f1 > %PATH_BATCH%\config\cyg%%A.packagelist 
)
call %BIN_VSINSTALLER% export --installPath "%PATH_VS%" --config "%PATH_BATCH%\config\.vsconfig"
call pip list > %PATH_BATCH%\config\python.pip