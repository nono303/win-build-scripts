mklink /H C:\httpd-sdk\install\lib\xml.lib C:\httpd-sdk\install\lib\expat.lib

cd /D C:\httpd-sdk\src\sqlite-amalgamation-3.22
rm -f *.exe *.obj *.pdb *.idb
cl /nologo /GL /GS- /Oy- /w /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox shell.c sqlite3.c -Fesqlite3.exe

cd /D C:\src\serf
rm -f .sconsign.dblite .saved_config *.log *.pc *.dll *.exp *.lib *.pdb *.def *.res
rmdir /S /Q C:\httpd-sdk\src\serf\.sconf_temp
cd /D C:\httpd-sdk\src\serf\build
python gen_def.py
cd /D C:\src\serf
python c:/scons/scons.py MSVC_VERSION=14.1 TARGET_ARCH=%serfbuild% APR=C:/httpd-sdk/install/lib/ APU=C:/httpd-sdk/install/lib/ OPENSSL=C:/httpd-sdk/install/lib/ ZLIB=C:/httpd-sdk/install/lib/ BROTLI=C:/httpd-sdk/install/ CPPFLAGS="/nologo /GL /GS- /Oy- /w /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox" LINKFLAGS="/nologo /LTCG /NODEFAULTLIB:libcmt.lib /OPT:ICF"
mklink /H C:\src\serf\serf-1.lib C:\src\serf\serf-2.lib

cd /D C:\src\subversion
rmdir /S /Q C:\httpd-sdk\src\subversion\Release
mkdir C:\httpd-sdk\src\subversion\Release-%ARCH%
mklink /J C:\httpd-sdk\src\subversion\Release C:\httpd-sdk\src\subversion\Release-%ARCH%
rmdir /S /Q C:\httpd-sdk\src\subversion\build\win32\vcnet-vcproj
python gen-make.py --release -t vcproj --with-jdk=C:\jdk8\%ARCH% --with-serf=C:\src\serf --with-sqlite=C:\httpd-sdk\src\sqlite-amalgamation-3.22 --with-apr=C:\httpd-sdk\install --with-apr-util=C:\httpd-sdk\install --with-apr-iconv=C:\httpd-sdk\install --with-apr_memcache=C:\httpd-sdk\install --with-httpd=C:\httpd-sdk\install --with-openssl=C:\httpd-sdk\install --with-zlib=C:\httpd-sdk\install --vsnet-version=2017
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/subversion_vcxproj.sh
"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" subversion_vcnet.sln /nowarn:C4702 /nowarn:C4703 /nologo /m:8 /t:__ALL__;__JAVAHL__ /p:Configuration=Release /p:Platform=%archmsbuild%  /p:DebugSymbols=true /p:DebugType=None

for /f "tokens=*" %%G in ('dir C:\src\subversion\Release\*.exe /s/b') do (
COPY %%~pG%%~nG.exe D:\github\subversion\vc15\%ARCH%\%%~nG.exe
COPY %%~pG%%~nG.pdb D:\github\subversion\vc15\%ARCH%\%%~nG.pdb
)
for /f "tokens=*" %%G in ('dir C:\src\subversion\Release\*.dll /s/b') do (
COPY %%~pG%%~nG.dll D:\github\subversion\vc15\%ARCH%\%%~nG.dll
COPY %%~pG%%~nG.pdb D:\github\subversion\vc15\%ARCH%\%%~nG.pdb
)
for /f "tokens=*" %%G in ('dir C:\src\subversion\Release\*.so /s/b') do (
COPY %%~pG%%~nG.so D:\github\subversion\vc15\%ARCH%\%%~nG.so
COPY %%~pG%%~nG.pdb D:\github\subversion\vc15\%ARCH%\%%~nG.pdb
)

cd /D C:\httpd-sdk