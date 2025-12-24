@echo off && call %PATH_MODULES_COMMON%\init.bat %1
cd /D %PATH_SRC%\%1

echo ^>^>^> gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%
call gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%
echo ^<^<^< gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%

REM call gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% --refresh-dependencies run
REM call gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% -q dependencies --configuration runtimeClasspath
echo.
call gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% -q dependencyInsight --dependency org.geotools:gt-main --single-path --configuration runtimeClasspath | head -1
echo.

call gradlew --project-cache-dir %PATH_GRADLE_BUILD% --warning-mode all --console=verbose --parallel --max-workers %NUMBER_OF_PROCESSORS% shadowJar 2>&1
