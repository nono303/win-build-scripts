@echo off && call %PATH_MODULES_COMMON%\init.bat %1
if exist %PATH_SRC%\%1\mobac\build\. rmdir /S /Q %PATH_SRC%\%1\mobac\build

echo ^>^>^> gradlew wrapper --gradle-version %GRADLEVER%
call gradlew wrapper --gradle-version %GRADLEVER%
echo ^<^<^< gradlew wrapper --gradle-version %GRADLEVER%

call gradlew --warning-mode all --console=verbose --no-daemon --parallel --max-workers %NUMBER_OF_PROCESSORS% mobac:jar 2>&1
FOR /F "tokens=* USEBACKQ" %%F in (`svn info --show-item revision`) do (set SCM_COMORREV=%%F)
move /Y %PATH_SRC%\%1\mobac\build\libs\Mobile_Atlas_Creator.jar %PATH_SRC%\%1\Mobile_Atlas_Creator_%SCM_COMORREV%.jar

if %LOCAL_COPY% == 1 (
	rm -fv "%LOCAL_PATH_MOBAC%\Mobile_Atlas_Creator*.jar"
	xcopy /C /F /Y %PATH_SRC%\%1\Mobile_Atlas_Creator_%SCM_COMORREV%.jar %LOCAL_PATH_MOBAC%\*
	rm -fv "%LOCAL_PATH_MOBAC2%\Mobile_Atlas_Creator*.jar"
	xcopy /C /F /Y %PATH_SRC%\%1\Mobile_Atlas_Creator_%SCM_COMORREV%.jar %LOCAL_PATH_MOBAC2%\*
)