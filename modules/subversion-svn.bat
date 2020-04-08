mklink /H %PATH_INSTALL%\lib\xml.lib %PATH_INSTALL%\lib\expat.lib
mklink /H %PATH_INSTALL%\lib\zlib_a.pdb %PATH_INSTALL%\lib\zlibstatic.pdb
cd /D %PATH_SRC%\subversion
git reset --hard
git clean -fdx
mkdir %PATH_SRC%\subversion\Release-%ARCH%
mklink /J %PATH_SRC%\subversion\Release %PATH_SRC%\subversion\Release-%ARCH%
rmdir /S /Q %PATH_SRC%\subversion\build\win32\vcnet-vcproj
python gen-make.py --release -t vcproj --with-jdk=C:\jdk8\%ARCH% --with-serf=%PATH_INSTALL%\include --with-sqlite=%PATH_SRC%\sqlite-amalgamation --vsnet-version=2017 --with-openssl=%PATH_INSTALL% --with-apr-util=%PATH_INSTALL% --with-apr=%PATH_INSTALL% --with-apr-iconv=%PATH_INSTALL% --with-zlib=%PATH_INSTALL% --with-apr_memcache=%PATH_INSTALL% --with-httpd=%PATH_INSTALL% 
	REM ;__ALL_TESTS__ 
%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/subversion-svn.sh
if %MSVC_DEPS% == vc15 (%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES%/vcxproj2vc15.sh "subversion/build/win32/vcnet-vcproj")
%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/subversion/build/win32/vcnet-vcproj/" %AVXVCX% %PTFTS% %WKITVER%
MSBuild.exe subversion_vcnet.sln /nowarn:C4702 /nowarn:LNK4087 /nowarn:C4703 /nowarn:C4132 /nowarn:C4389 /nowarn:C4244 /nowarn:C4245 /nowarn:C4267 /nowarn:C4018 /nowarn:C4334 /nowarn:C4189 /nowarn:C4312 /nowarn:C4090 /nowarn:C4152 /nowarn:C4146 /nologo /m:8 /t:Clean;__ALL__;__JAVAHL__ /p:Configuration=Release /p:Platform=%archmsbuild%  /p:DebugSymbols=true /p:DebugType=None

for /f "tokens=*" %%G in ('dir %PATH_SRC%\subversion\Release\*.exe /s/b') do (
Copy /Y %%~pG%%~nG.exe D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%\%%~nG.exe
Copy /Y %%~pG%%~nG.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%\%%~nG.pdb
)
for /f "tokens=*" %%G in ('dir %PATH_SRC%\subversion\Release\*.dll /s/b') do (
Copy /Y %%~pG%%~nG.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%\%%~nG.dll
Copy /Y %%~pG%%~nG.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%\%%~nG.pdb
)
for /f "tokens=*" %%G in ('dir %PATH_SRC%\subversion\Release\*.so /s/b') do (
Copy /Y %%~pG%%~nG.so D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%\%%~nG.so
Copy /Y %%~pG%%~nG.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%\%%~nG.pdb
)

set DEPS=\deps\
mkdir D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%
if %ARCH% == x64 (
	set sslarch=-x64
)

Copy /Y %PATH_INSTALL%\bin\libssl-1_1%sslarch%.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libssl-1_1%sslarch%.dll
Copy /Y %PATH_INSTALL%\bin\libcrypto-1_1%sslarch%.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libcrypto-1_1%sslarch%.dll
Copy /Y %PATH_INSTALL%\bin\libssl-1_1%sslarch%.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libssl-1_1%sslarch%.pdb
Copy /Y %PATH_INSTALL%\bin\libcrypto-1_1%sslarch%.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libcrypto-1_1%sslarch%.pdb

Copy /Y %PATH_INSTALL%\bin\libexpat.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libexpat.dll
Copy /Y %PATH_INSTALL%\bin\libapr-1.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libapr-1.dll
Copy /Y %PATH_INSTALL%\bin\libapriconv-1.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libapriconv-1.dll
Copy /Y %PATH_INSTALL%\bin\libaprutil-1.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libaprutil-1.dll
Copy /Y %PATH_INSTALL%\bin\brotlienc.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%brotlienc.dll
Copy /Y %PATH_INSTALL%\bin\brotlicommon.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%brotlicommon.dll
Copy /Y %PATH_INSTALL%\bin\brotlidec.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%brotlidec.dll
Copy /Y %PATH_INSTALL%\bin\libserf-2.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libserf-2.dll

Copy /Y %PATH_INSTALL%\bin\libssl-1_1%sslarch%.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libssl-1_1%sslarch%.pdb
Copy /Y %PATH_INSTALL%\bin\libexpat.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libexpat.pdb
Copy /Y %PATH_INSTALL%\bin\libapr-1.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libapr-1.pdb
Copy /Y %PATH_INSTALL%\bin\libapriconv-1.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libapriconv-1.pdb
Copy /Y %PATH_INSTALL%\bin\libaprutil-1.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libaprutil-1.pdb
Copy /Y %PATH_INSTALL%\bin\libcrypto-1_1%sslarch%.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libcrypto-1_1%sslarch%.pdb
Copy /Y %PATH_INSTALL%\bin\brotlienc.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%brotlienc.pdb
Copy /Y %PATH_INSTALL%\bin\brotlicommon.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%brotlicommon.pdb
Copy /Y %PATH_INSTALL%\bin\brotlidec.dll D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%brotlidec.pdb
Copy /Y %PATH_INSTALL%\bin\libserf-2.pdb D:\github\NONO_subversion\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%libserf-2.pdb
cd /D %PATH_MODULES%

