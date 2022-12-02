@echo off && call %PATH_MODULES_COMMON%\init.bat %1
if exist %userprofile%\.gradle if not exist %PATH_SRC%\%1\%1\.gradle\. mklink /J %PATH_SRC%\%1\%1\.gradle %userprofile%\.gradle
cd /D %PATH_SRC%\%1\%1
call gradlew --warning-mode all --console=verbose --no-daemon --parallel --max-workers %NUMBER_OF_PROCESSORS% shadowJar 2>&1
