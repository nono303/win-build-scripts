cd /D %PATH_SRC%\%1

perl Configure %perlbuild% ^
shared no-unit-test no-external-tests no-ssl3 no-weak-ssl-ciphers no-tests zlib zlib-dynamic ^
-threads zlib-dynamic ^
--prefix=%PATH_INSTALL% ^
--with-zlib-include=%SLASHPATH_INSTALL%/include ^
--openssldir=%PATH_INSTALL%\conf ^
-DOPENSSL_USE_IPV6=1 ^
-DOPENSSL_NO_HEARTBEATS ^
-DOPENSSL_NO_DEPRECATED ^
-L"/OPT:ICF /LTCG" +"/GL /GS- /Oy- /guard:cf- /FD /GF /Zc:inline /MP%NUMBER_OF_PROCESSORS% /LD /MD /Zi /Ox %AVX%"

sed -i 's/\/W3 \/wd4090 \/nologo \/O2 -threads +/\/nologo \/wd4090 \/wd4267 \/wd4244 \/wd4133 \/wd4311 /g' %CYGPATH_SRC%/%1/makefile
sed -i 's/\/nologo \/debug -L/\/nologo \/debug /g' %CYGPATH_SRC%/%1/makefile
sed -i 's/ARFLAGS= \/nologo/ARFLAGS= \/nologo \/LTCG/g' %CYGPATH_SRC%/%1/makefile

	REM install_sw > no docs
nmake %NMAKE_OPTS% clean install_sw

	REM move & version for engines - https://github.com/openssl/openssl/issues/7185
REM !! TODO
REM CD /D %PATH_SRC%\%1
REM for /F "tokens=* USEBACKQ" %%F in (`git describe --tags`) do (set VERSION=%%F)
REM set VERSION=%VERSION:_=.%
for /f "tokens=*" %%G in ('dir %PATH_INSTALL%\lib\engines-1_1\*.dll /b') do (call %PATH_MODULES_COMMON%\version.bat %PATH_INSTALL%\lib\engines-1_1\%%G "1.1.1.7" "1.1.1-g")
if not exist %PATH_INSTALL%\bin\engines-1_1\. mkdir %PATH_INSTALL%\bin\engines-1_1
move /y %PATH_INSTALL%\lib\engines-1_1\*.* %PATH_INSTALL%\bin\engines-1_1
rmdir /S /Q %PATH_INSTALL%\lib\engines-1_1