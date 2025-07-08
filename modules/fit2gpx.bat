@echo off && call %PATH_MODULES_COMMON%\init.bat %1
cd /D %PATH_SRC%\%1

echo ^>^>^> gradlew --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%
call gradlew --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%
echo ^<^<^< gradlew --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%

REM call gradlew --project-cache-dir %PATH_GRADLE_BUILD% --refresh-dependencies run
REM call gradlew --project-cache-dir %PATH_GRADLE_BUILD% -q dependencies --configuration runtimeClasspath
echo.
call gradlew --project-cache-dir %PATH_GRADLE_BUILD% -q dependencyInsight --dependency garmin:fit --single-path --configuration runtimeClasspath | head -1
echo.

call gradlew --project-cache-dir %PATH_GRADLE_BUILD% --warning-mode all --no-daemon --console=verbose --parallel --max-workers %NUMBER_OF_PROCESSORS% shadowJar 2>&1

if %LOCAL_COPY% == 1 (
	rm -fv "%LOCAL_PATH_FIT2GPX%\fit2gpx.jar"
	xcopy /C /F /Y %PATH_SRC%\%1\build\libs\fit2gpx-all.jar %LOCAL_PATH_FIT2GPX%\fit2gpx.jar*
)