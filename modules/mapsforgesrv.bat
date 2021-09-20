@echo off && call %PATH_MODULES_COMMON%\init.bat %1
cd /D %PATH_SRC%\%1\%1
call gradlew --warning-mode all --console=verbose --no-daemon --parallel --max-workers %NUMBER_OF_PROCESSORS% copyFatJar2jars_ready2use 2>&1
