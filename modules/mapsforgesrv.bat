@echo off && call %PATH_UTILS%\init.bat %1
cd /D %PATH_SRC%\%1

echo ^>^>^> gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 
call gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 
echo ^<^<^< gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 

REM call gradlew %GRADLEW_OPTS% --refresh-dependencies run
REM call gradlew %GRADLEW_OPTS% -q dependencies --configuration runtimeClasspath
echo.
call gradlew %GRADLEW_OPTS% --configuration-cache -q dependencyInsight --dependency com.github.mapsforge.mapsforge:mapsforge-core --single-path --configuration runtimeClasspath | head -1
call gradlew %GRADLEW_OPTS% --configuration-cache -q dependencyInsight --dependency org.eclipse.jetty.http2:http2-server --single-path --configuration runtimeClasspath | head -1
echo.

REM -Dorg.gradle.deprecation.trace=true
call gradlew %GRADLEW_OPTS% --warning-mode all --console=verbose shadowJar 2>&1
