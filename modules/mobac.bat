@echo off && call %PATH_UTILS%\init.bat %1
if exist %PATH_SRC%\%1\mobac\build\. rmdir /S /Q %PATH_SRC%\%1\mobac\build

echo ^>^>^> gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 
call gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 
echo ^<^<^< gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 

REM call gradlew %GRADLEW_OPTS% --refresh-dependencies run
REM call gradlew %GRADLEW_OPTS% -q dependencies --configuration runtimeClasspath
echo.
call gradlew %GRADLEW_OPTS% --configuration-cache -q mobac:dependencyInsight --dependency com.github.mapsforge.mapsforge:mapsforge-core --single-path --configuration runtimeClasspath | head -1
call gradlew %GRADLEW_OPTS% --configuration-cache -q mobac:dependencyInsight --dependency org.beanshell:bsh --single-path --configuration runtimeClasspath | head -1
call gradlew %GRADLEW_OPTS% --configuration-cache -q mobac:dependencyInsight --dependency org.apache.httpcomponents.client5 --single-path --configuration runtimeClasspath | head -1
echo.

REM -Dorg.gradle.deprecation.trace=true
call gradlew %GRADLEW_OPTS% --warning-mode all --console=verbose mobac:jar 2>&1

move /Y %PATH_SRC%\%1\mobac\build\libs\Mobile_Atlas_Creator.jar %PATH_SRC%\%1\Mobile_Atlas_Creator_%SCM_COMORREV%.jar

if %LOCAL_COPY% == 1 (
echo on
	del %LOCAL_PATH_MOBAC%\Mobile_Atlas_Creator*.jar
	xcopy /C /F /Y %PATH_SRC%\%1\Mobile_Atlas_Creator_%SCM_COMORREV%.jar %LOCAL_PATH_MOBAC%\*
	del %LOCAL_PATH_MOBAC2%\Mobile_Atlas_Creator*.jar
	xcopy /C /F /Y %PATH_SRC%\%1\Mobile_Atlas_Creator_%SCM_COMORREV%.jar %LOCAL_PATH_MOBAC2%\*
)