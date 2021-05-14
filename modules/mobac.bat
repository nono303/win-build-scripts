@echo off && call %PATH_MODULES_COMMON%\init.bat %1
if exist %PATH_SRC%\%1\mobac\build\. rmdir /S /Q %PATH_SRC%\%1\mobac\build
	REM https://docs.gradle.org/current/userguide/command_line_interface.html
REM tilestore-util:jar
call gradlew --warning-mode all --console=verbose --no-daemon --parallel --max-workers %NUMBER_OF_PROCESSORS% mobac:jar 2>&1
FOR /F "tokens=* USEBACKQ" %%F in (`svn info --show-item revision`) do (set SCM_VERSION=%%F)
move /Y %PATH_SRC%\%1\mobac\build\libs\Mobile_Atlas_Creator.jar %PATH_SRC%\%1\Mobile_Atlas_Creator_%SCM_VERSION%.jar

if %LOCAL_COPY% == 1 if %LOCAL_COPY_AVXECHO% == %AVXECHO%  if %LOCAL_COPY_MSVC_VER% == %MSVC_VER% ( 
	xcopy /C /F /Y %PATH_SRC%\%1\Mobile_Atlas_Creator_%SCM_VERSION%.jar %LOCAL_PATH_MOBAC%\*
)