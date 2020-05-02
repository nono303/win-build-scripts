call %PATH_MODULES_COMMON%\init.bat %1
call "%ANT_HOME%\bin\ant.bat" clean_workspace, delete_build, build_mapsources, create_jar