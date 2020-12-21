@echo off && call %PATH_MODULES_COMMON%\init.bat %1

	REM sqlite update - https://bitbucket.org/xerial/sqlite-jdbc/downloads/
xcopy /C /F /Y %PATH_MODULES%\sqlite-jdbc-3.34.0.jar %PATH_SRC%\%1\lib\sqlite-jdbc-3.34.0.jar*
rm -f %PATH_SRC%\%1\lib\sqlite-jdbc-3.16.1.jar

sed -i -E 's/Revision: [0-9]+/Revision: %SCM_VERSION%/g' %CYGPATH_SRC%/%1/src/main/resources/mobac/mobac.properties
call "%ANT_HOME%\bin\ant.bat" ^
	clean_workspace, ^
	delete_build, ^
	svnversion_svn, ^
	svnversion_write_property_file, ^
	build, ^
	create_jar