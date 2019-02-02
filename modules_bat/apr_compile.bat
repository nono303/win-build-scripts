rmdir /S /Q C:\src\apr-util\crypto\%ARCH%
rmdir /S /Q C:\src\apr-util\dbd\%ARCH%
rmdir /S /Q C:\src\apr-util\dbm\%ARCH%
rmdir /S /Q C:\src\apr-util\ldap\%ARCH%
rmdir /S /Q C:\src\apr-util\%ARCH%
rmdir /S /Q C:\src\apr-iconv\build\preapriconv\
rmdir /S /Q C:\src\apr-iconv\ccs\libapriconv_ccs_modules\
rmdir /S /Q C:\src\apr-iconv\%ARCH%
rmdir /S /Q C:\src\apr\build\%ARCH%
rmdir /S /Q C:\src\apr\%ARCH%
rm -f C:\src\apr\build\preaprapp.log

cd /D C:\httpd-sdk\src\apr\tools
cl gen_test_char.c
gen_test_char.exe > C:\src\apr\include\apr_escape_test_char.h
rm -f *.exe *.obj

REM apr_crypto_nss;apr_dbd_mysql;apr_dbd_oracle;apr_dbd_pgsql;apr_dbd_sqlite2;apr_dbd_sqlite3;apr_dbm_db;apr_dbm_gdbm;
cd /D C:\src\apr-util
"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" aprutil.sln /nowarn:msb4011 /nowarn:C4244 /nowarn:C4098 /nowarn:C4267 /nowarn:C4311 /p:Turbo=true /m:8 /p:CL_MPCount=8 /t:apr;apr_crypto_openssl;apr_dbd_odbc;apr_ldap;aprapp;apriconv;aprutil;libapr;libaprapp;libapriconv;libapriconv_ccs_modules;libapriconv_ces_modules;libaprutil;preaprapp;preapriconv;preaprutil;prelibaprapp /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="%ARCH%"

cd /D C:\httpd-sdk\modules_bat