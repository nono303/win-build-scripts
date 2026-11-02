@echo off && call %PATH_UTILS%\init.bat %1
cd /D %PATH_SRC%\%1
	
	REM  maven version. \x27 = hex for '
sed -i -E 's/    version = \x27.*/    version = \'%GET_VERSION%\'/g' %CYGPATH_SRC%/%1/build.gradle

echo ^>^>^> gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 
call gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 
echo ^<^<^< gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 

call gradlew %GRADLEW_OPTS% --warning-mode all --console=verbose publishToMavenLocal 2>&1

type %MAVEN_HOME%\org\mapsforge\mapsforge-core\maven-metadata-local.xml
