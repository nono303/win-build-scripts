mklink /H C:\httpd-sdk\install\lib\xml.lib C:\httpd-sdk\install\lib\expat.lib

cd /D C:\httpd-sdk\src\sqlite-amalgamation
rm -f *.exe *.obj *.pdb *.idb
cl /nologo /GL /GS- /Oy- /w /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox shell.c sqlite3.c -Fesqlite3.exe

cd /D C:\src\serf
rm -f .sconsign.dblite .saved_config *.log *.pc *.dll *.exp *.lib *.pdb *.def *.res vc140.idb
for /f "tokens=*" %%G in ('dir C:\src\serf\*.obj /s/b') do (
rm -f %%~pG%%~nG.obj
)
rmdir /S /Q C:\httpd-sdk\src\serf\.sconf_temp
cd /D C:\httpd-sdk\src\serf\build
python gen_def.py
cd /D C:\src\serf
python c:/bin/scons/scons.py MSVC_VERSION=14.1 TARGET_ARCH=%serfbuild% APR=C:/httpd-sdk/install/lib/ APU=C:/httpd-sdk/install/lib/ OPENSSL=C:/httpd-sdk/install/lib/ ZLIB=C:/httpd-sdk/install/lib/ BROTLI=C:/httpd-sdk/install/
mklink /H C:\src\serf\serf-1.lib C:\src\serf\serf-2.lib

cd /D C:\src\subversion
rmdir /S /Q C:\httpd-sdk\src\subversion\Release
mkdir C:\httpd-sdk\src\subversion\Release-%ARCH%
mklink /J C:\httpd-sdk\src\subversion\Release C:\httpd-sdk\src\subversion\Release-%ARCH%
rmdir /S /Q C:\httpd-sdk\src\subversion\build\win32\vcnet-vcproj
python gen-make.py --release -t vcproj --with-jdk=C:\jdk8\%ARCH% --with-serf=C:\src\serf --with-sqlite=C:\httpd-sdk\src\sqlite-amalgamation --with-apr=C:\httpd-sdk\install --with-apr-util=C:\httpd-sdk\install --with-apr-iconv=C:\httpd-sdk\install --with-apr_memcache=C:\httpd-sdk\install --with-httpd=C:\httpd-sdk\install --with-openssl=C:\httpd-sdk\install --with-zlib=C:\httpd-sdk\install --vsnet-version=2017
C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/subversion_vcxproj.sh
"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" subversion_vcnet.sln /nowarn:C4702 /nowarn:LNK4087 /nowarn:C4703 /nowarn:C4132 /nowarn:C4389 /nowarn:C4244 /nowarn:C4245 /nowarn:C4267 /nowarn:C4018 /nologo /m:8 /t:__ALL__;__JAVAHL__ /p:Configuration=Release /p:Platform=%archmsbuild%  /p:DebugSymbols=true /p:DebugType=None

rmdir /S /Q C:\httpd-sdk\install\svn
mkdir C:\httpd-sdk\install\svn

for /f "tokens=*" %%G in ('dir C:\src\subversion\Release\*.exe /s/b') do (
COPY %%~pG%%~nG.exe C:\httpd-sdk\install\svn\%%~nG.exe
COPY %%~pG%%~nG.pdb C:\httpd-sdk\install\svn\%%~nG.pdb
)
for /f "tokens=*" %%G in ('dir C:\src\subversion\Release\*.dll /s/b') do (
COPY %%~pG%%~nG.dll C:\httpd-sdk\install\svn\%%~nG.dll
COPY %%~pG%%~nG.pdb C:\httpd-sdk\install\svn\%%~nG.pdb
)
for /f "tokens=*" %%G in ('dir C:\src\subversion\Release\*.so /s/b') do (
COPY %%~pG%%~nG.so C:\httpd-sdk\install\svn\%%~nG.so
COPY %%~pG%%~nG.pdb C:\httpd-sdk\install\svn\%%~nG.pdb
)

cd /D C:\httpd-sdk