mklink /H C:\httpd-sdk\install\lib\xml.lib C:\httpd-sdk\install\lib\expat.lib
mklink /H C:\httpd-sdk\install\lib\zlib.pdb C:\httpd-sdk\install\lib\zlibstatic.pdb
cd /D C:\src\subversion
git clean -fdx
mkdir C:\httpd-sdk\src\subversion\Release-%ARCH%
mklink /J C:\httpd-sdk\src\subversion\Release C:\httpd-sdk\src\subversion\Release-%ARCH%
rmdir /S /Q C:\httpd-sdk\src\subversion\build\win32\vcnet-vcproj
python gen-make.py --release -t vcproj --with-jdk=C:\jdk8\%ARCH% --with-serf=C:\httpd-sdk\install\include --with-sqlite=C:\httpd-sdk\src\sqlite-amalgamation --vsnet-version=2017 --with-openssl=C:\httpd-sdk\install --with-apr-util=C:\httpd-sdk\install --with-apr=C:\httpd-sdk\install --with-apr-iconv=C:\httpd-sdk\install --with-zlib=C:\httpd-sdk\install --with-apr_memcache=C:\httpd-sdk\install --with-httpd=C:\httpd-sdk\install 

C:\cyg64\bin\bash /cygdrive/c/httpd-sdk/subversion_vcxproj.sh
"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" subversion_vcnet.sln /nowarn:C4702 /nowarn:LNK4087 /nowarn:C4703 /nowarn:C4132 /nowarn:C4389 /nowarn:C4244 /nowarn:C4245 /nowarn:C4267 /nowarn:C4018 /nowarn:C4334 /nowarn:C4189 /nowarn:C4312 /nowarn:C4090 /nowarn:C4152 /nowarn:C4146 /nologo /m:8 /t:Clean;__ALL__;__JAVAHL__ /p:Configuration=Release /p:Platform=%archmsbuild%  /p:DebugSymbols=true /p:DebugType=None

for /f "tokens=*" %%G in ('dir C:\src\subversion\Release\*.exe /s/b') do (
Copy /Y %%~pG%%~nG.exe D:\github\NONO_subversion\vc15\%ARCH%%AVXB%\%%~nG.exe
Copy /Y %%~pG%%~nG.pdb D:\github\NONO_subversion\vc15\%ARCH%%AVXB%\%%~nG.pdb
)
for /f "tokens=*" %%G in ('dir C:\src\subversion\Release\*.dll /s/b') do (
Copy /Y %%~pG%%~nG.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%\%%~nG.dll
Copy /Y %%~pG%%~nG.pdb D:\github\NONO_subversion\vc15\%ARCH%%AVXB%\%%~nG.pdb
)
for /f "tokens=*" %%G in ('dir C:\src\subversion\Release\*.so /s/b') do (
Copy /Y %%~pG%%~nG.so D:\github\NONO_subversion\vc15\%ARCH%%AVXB%\%%~nG.so
Copy /Y %%~pG%%~nG.pdb D:\github\NONO_subversion\vc15\%ARCH%%AVXB%\%%~nG.pdb
)

set DEPS=\deps\
mkdir D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%
if %ARCH% == x64 (
	set sslarch=-x64
)

Copy /Y C:\httpd-sdk\install\bin\libssl-1_1%sslarch%.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libssl-1_1%sslarch%.dll
Copy /Y C:\httpd-sdk\install\bin\libcrypto-1_1%sslarch%.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libcrypto-1_1%sslarch%.dll

Copy /Y C:\httpd-sdk\install\bin\expat.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%expat.dll
Copy /Y C:\httpd-sdk\install\bin\libapr-1.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libapr-1.dll
Copy /Y C:\httpd-sdk\install\bin\libapriconv-1.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libapriconv-1.dll
Copy /Y C:\httpd-sdk\install\bin\libaprutil-1.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libaprutil-1.dll
Copy /Y C:\httpd-sdk\install\bin\brotlienc.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%brotlienc.dll
Copy /Y C:\httpd-sdk\install\bin\brotlicommon.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%brotlicommon.dll
Copy /Y C:\httpd-sdk\install\bin\brotlidec.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%brotlidec.dll
Copy /Y C:\httpd-sdk\install\bin\libserf-2.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libserf-2.dll

Copy /Y C:\httpd-sdk\install\bin\libssl-1_1%sslarch%.pdb D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libssl-1_1%sslarch%.pdb
Copy /Y C:\httpd-sdk\install\bin\expat.pdb D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%expat.pdb
Copy /Y C:\httpd-sdk\install\bin\libapr-1.pdb D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libapr-1.pdb
Copy /Y C:\httpd-sdk\install\bin\libapriconv-1.pdb D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libapriconv-1.pdb
Copy /Y C:\httpd-sdk\install\bin\libaprutil-1.pdb D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libaprutil-1.pdb
Copy /Y C:\httpd-sdk\install\bin\libcrypto-1_1%sslarch%.pdb D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libcrypto-1_1%sslarch%.pdb
Copy /Y C:\httpd-sdk\install\bin\brotlienc.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%brotlienc.pdb
Copy /Y C:\httpd-sdk\install\bin\brotlicommon.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%brotlicommon.pdb
Copy /Y C:\httpd-sdk\install\bin\brotlidec.dll D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%brotlidec.pdb
Copy /Y C:\httpd-sdk\install\bin\libserf-2.pdb D:\github\NONO_subversion\vc15\%ARCH%%AVXB%%DEPS%libserf-2.pdb
cd /D C:\httpd-sdk\modules_bat

