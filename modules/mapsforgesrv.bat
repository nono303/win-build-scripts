@echo off && call %PATH_MODULES_COMMON%\init.bat %1
cd /D %PATH_SRC%\%1

echo ^>^>^> gradlew --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%
call gradlew --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%
echo ^<^<^< gradlew --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%

REM call gradlew --project-cache-dir %PATH_GRADLE_BUILD% --refresh-dependencies run
REM call gradlew --project-cache-dir %PATH_GRADLE_BUILD% -q dependencies --configuration runtimeClasspath
echo.
call gradlew --project-cache-dir %PATH_GRADLE_BUILD% -q dependencyInsight --dependency org.mapsforge:mapsforge-core --single-path --configuration runtimeClasspath | head -1
call gradlew --project-cache-dir %PATH_GRADLE_BUILD% -q dependencyInsight --dependency org.eclipse.jetty.http2:http2-server --single-path --configuration runtimeClasspath | head -1
echo.

REM -Dorg.gradle.deprecation.trace=true
call gradlew --project-cache-dir %PATH_GRADLE_BUILD% -x test --warning-mode all --console=verbose --no-daemon --parallel --max-workers %NUMBER_OF_PROCESSORS% shadowJar test 2>&1
