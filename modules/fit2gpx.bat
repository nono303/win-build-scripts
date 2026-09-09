@echo off && call %PATH_UTILS%\init.bat %1
cd /D %PATH_SRC%\%1

echo ^>^>^> gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 
call gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 
echo ^<^<^< gradlew %GRADLEW_OPTS% wrapper --gradle-version %GRADLEVER% 

REM call gradlew %GRADLEW_OPTS% --refresh-dependencies run
REM call gradlew %GRADLEW_OPTS% -q dependencies --configuration runtimeClasspath
echo.
call gradlew %GRADLEW_OPTS% --configuration-cache -q dependencyInsight --dependency garmin:fit --single-path --configuration runtimeClasspath | head -1
echo.

call gradlew %GRADLEW_OPTS% --warning-mode all --console=verbose shadowJar 2>&1

if %LOCAL_COPY% == 1 (
	call %PATH_UTILS%\fileutils rm "%LOCAL_PATH_FIT2GPX%\fit2gpx.jar"
	call %PATH_UTILS%\fileutils cp %PATH_SRC%\%1\build\libs\fit2gpx-all.jar %LOCAL_PATH_FIT2GPX%\fit2gpx.jar*
)