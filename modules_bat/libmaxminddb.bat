rmdir /S /Q C:\httpd-sdk\src\libmaxminddb\projects\VS12\%ARCH%
cd /D C:\httpd-sdk\src\libmaxminddb\projects\VS12
"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" libmaxminddb.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libmaxminddb /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y C:\httpd-sdk\src\libmaxminddb\projects\VS12\%outmsbuild%\libmaxminddb.lib C:\httpd-sdk\install\lib\libmaxminddb.lib
copy /Y C:\httpd-sdk\src\libmaxminddb\include\maxminddb.h C:\httpd-sdk\install\include\maxminddb.h 
copy /Y C:\httpd-sdk\src\libmaxminddb\include\maxminddb_config.h C:\httpd-sdk\install\include\maxminddb_config.h
cd /D C:\httpd-sdk\modules_bat