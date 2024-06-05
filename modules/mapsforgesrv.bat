@echo off && call %PATH_MODULES_COMMON%\init.bat %1
if exist %userprofile%\.gradle if not exist %PATH_SRC%\%1\.gradle\. mklink /J %PATH_SRC%\%1\.gradle %userprofile%\.gradle
cd /D %PATH_SRC%\%1

echo ^>^>^> gradlew wrapper --gradle-version %GRADLEVER%
call gradlew wrapper --gradle-version %GRADLEVER%
echo ^<^<^< gradlew wrapper --gradle-version %GRADLEVER%

REM -Dorg.gradle.deprecation.trace=true 
call gradlew -x test --warning-mode all --console=verbose --no-daemon --parallel --max-workers %NUMBER_OF_PROCESSORS% shadowJar test 2>&1
