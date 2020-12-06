@echo off && call %PATH_MODULES_COMMON%\init.bat %1

	REM sqlite update - https://bitbucket.org/xerial/sqlite-jdbc/downloads/
xcopy /C /F /Y C:\sdk\batch\modules\sqlite-jdbc-3.30.1.jar C:\sdk\src\mobac\lib\sqlite-jdbc-3.30.1.jar*

sed -i -E 's/Revision: [0-9]+/Revision: %SCM_VERSION%/g' %CYGPATH_SRC%/%1/src/main/resources/mobac/mobac.properties
call "%ANT_HOME%\bin\ant.bat" ^
	clean_workspace, ^
	delete_build, ^
	svnversion_svn, ^
	svnversion_write_property_file, ^
	build, ^
	create_jar