@echo off && call %PATH_MODULES_COMMON%\init.bat %1
if exist %userprofile%\.gradle if not exist %PATH_SRC%\%1\.gradle\. mklink /J %PATH_SRC%\%1\.gradle %userprofile%\.gradle
cd /D %PATH_SRC%\%1

echo ^>^>^> gradlew wrapper --gradle-version %GRADLEVER%
call gradlew wrapper --gradle-version %GRADLEVER%
echo ^<^<^< gradlew wrapper --gradle-version %GRADLEVER%

call gradlew --warning-mode all --no-daemon --console=verbose --parallel --max-workers %NUMBER_OF_PROCESSORS% shadowJar 2>&1
move /Y %PATH_SRC%\%1\build\libs\fit2gpx-all.jar %PATH_SRC%\%1\out\jar\fit2gpx.jar

if %LOCAL_COPY% == 1 (
	del /Q /F "%LOCAL_PATH_FIT2GPX%\fit2gpx.jar"
	xcopy /C /F /Y %PATH_SRC%\%1\out\jar\fit2gpx.jar %LOCAL_PATH_FIT2GPX%\*
)