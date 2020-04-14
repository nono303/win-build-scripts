call %PATH_MODULES_COMMON%\init.bat %1
MSBuild.exe sdlna.sln /m /t:Clean,Build /p:Configuration=Release /p:Platform="Any CPU" /p:DebugSymbols=true
copy /Y %PATH_SRC%\%1\packages\System.Data.SQLite.Core.1.0.112.0\build\net46\x64 %PATH_SRC%\%1\build
copy /Y %PATH_SRC%\%1\packages\System.Data.SQLite.Core.1.0.112.0\build\net46\x86 %PATH_SRC%\%1\build
del /Q /F %PATH_SRC%\%1\build\SQLite.Interop.dll
copy /Y %PATH_SRC%\%1\assets\nono\ico.ico %PATH_SRC%\%1\build