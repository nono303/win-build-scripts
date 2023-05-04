@echo off && call %PATH_MODULES_COMMON%\init.bat %1
if exist %userprofile%\.gradle if not exist %PATH_SRC%\%1\.gradle\. mklink /J %PATH_SRC%\%1\.gradle %userprofile%\.gradle
cd /D %PATH_SRC%\%1
call gradlew wrapper --gradle-version %GRADLEVER%
call gradlew --warning-mode all --no-daemon --console=verbose --parallel --max-workers %NUMBER_OF_PROCESSORS% shadowJar 2>&1
