@echo off && call %PATH_MODULES_COMMON%\init.bat %1
if exist %PATH_SRC%\%1\mobac\build\. rmdir /S /Q %PATH_SRC%\%1\mobac\build

xcopy /C /F /Y %PATH_PATCHES%\mobac_gradle-wrapper.jar %PATH_SRC%\%1\gradle\wrapper\gradle-wrapper.jar*

echo ^>^>^> gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%
call gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%
echo ^<^<^< gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% wrapper --gradle-version %GRADLEVER%

REM call gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% --refresh-dependencies run
REM call gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% -q dependencies --configuration runtimeClasspath
echo.
call gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% -q mobac:dependencyInsight --dependency com.github.mapsforge.mapsforge:mapsforge-core --single-path --configuration runtimeClasspath | head -1
call gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% -q mobac:dependencyInsight --dependency org.beanshell:bsh --single-path --configuration runtimeClasspath | head -1
call gradlew --configuration-cache --project-cache-dir %PATH_GRADLE_BUILD% -q mobac:dependencyInsight --dependency org.apache.httpcomponents.client5 --single-path --configuration runtimeClasspath | head -1
echo.

call gradlew --project-cache-dir %PATH_GRADLE_BUILD% --warning-mode all --console=verbose --parallel --max-workers %NUMBER_OF_PROCESSORS% mobac:jar 2>&1

REM FOR /F "tokens=* USEBACKQ" %%F in (`svn info --show-item revision`) do (set SCM_COMORREV=%%F)
move /Y %PATH_SRC%\%1\mobac\build\libs\Mobile_Atlas_Creator.jar %PATH_SRC%\%1\Mobile_Atlas_Creator_%SCM_COMORREV%.jar

if %LOCAL_COPY% == 1 (
echo on
	del %LOCAL_PATH_MOBAC%\Mobile_Atlas_Creator*.jar
	xcopy /C /F /Y %PATH_SRC%\%1\Mobile_Atlas_Creator_%SCM_COMORREV%.jar %LOCAL_PATH_MOBAC%\*
	del %LOCAL_PATH_MOBAC2%\Mobile_Atlas_Creator*.jar
	xcopy /C /F /Y %PATH_SRC%\%1\Mobile_Atlas_Creator_%SCM_COMORREV%.jar %LOCAL_PATH_MOBAC2%\*
)