@echo off && call %PATH_MODULES_COMMON%\init.bat %1
echo.
echo ###############################################
echo #  !! git disabled !! no version no copie !!  #
echo # https://github.com/MolotovCherry/run-hidden #
echo ###############################################
echo.
MSBuild.exe run-hidden.sln %MSBUILD_OPTS% ^
/p:Configuration=Release ^
/p:Platform="%archmsbuild%"
echo.