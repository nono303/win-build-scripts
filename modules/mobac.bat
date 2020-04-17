cd /D %PATH_SRC%\%1
call "%ANT_HOME%\bin\ant.bat" clean_workspace, delete_build, build_mapsources, create_jar