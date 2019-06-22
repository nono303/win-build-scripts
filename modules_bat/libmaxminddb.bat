rmdir /S /Q C:\httpd-sdk\src\libmaxminddb\projects\VS12\%ARCH%
cd /D C:\httpd-sdk\src\libmaxminddb
git clean -fdx
git reset --hard
cd /D C:\httpd-sdk\src\libmaxminddb\projects\VS12
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/vcxproj.sh "/cygdrive/c/httpd-sdk/src/libmaxminddb/projects/VS12/" %AVXVCX%
if %MSVC_DEPS% == vc15 (C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/modules_bat/vcxproj2vc15.sh "libmaxminddb/projects/VS12")
MSBuild.exe libmaxminddb.sln /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:Clean,libmaxminddb /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%archmsbuild%"
copy /Y C:\httpd-sdk\src\libmaxminddb\projects\VS12\%outmsbuild%\libmaxminddb.lib C:\httpd-sdk\install\lib\libmaxminddb.lib
copy /Y C:\httpd-sdk\src\libmaxminddb\include\maxminddb.h C:\httpd-sdk\install\include\maxminddb.h 
copy /Y C:\httpd-sdk\src\libmaxminddb\include\maxminddb_config.h C:\httpd-sdk\install\include\maxminddb_config.h
cd /D C:\httpd-sdk\modules_bat