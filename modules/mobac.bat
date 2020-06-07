@echo off && call %PATH_MODULES_COMMON%\init.bat %1
	REM patch revision
FOR /F "tokens=* USEBACKQ" %%F in (`svn info --show-item revision`) do (set MOBAC_REVISION=%%F)

	REM sqlite update
xcopy /C /F /Y C:\sdk\batch\modules\sqlite-jdbc-3.30.1.jar C:\sdk\src\mobac\lib\sqlite-jdbc-3.30.1.jar*

sed -i -E 's/Revision: [0-9]+/Revision: %MOBAC_REVISION%/g' %CYGPATH_SRC%/%1/src/main/resources/mobac/mobac.properties
call "%ANT_HOME%\bin\ant.bat" ^
	clean_workspace, ^
	delete_build, ^
	build_mapsources, ^
	create_jar