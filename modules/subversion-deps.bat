@echo off
	REM force native openssl
call quic 0
call go clean
call go zlib NOLOG
call go pcre2 NOLOG
call go libexpat NOLOG
call go openssl NOLOG
call go sqlite svn NOLOG
call go apr NOLOG
call go serf NOLOG
call go httpd svn NOLOG

set DEPS=\deps
if not exist %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\. mkdir %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\
del /Q /F "%PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\*.*"
if %ARCH% == x64 (set sslarch=-x64)
if %ARCH% == x86 (set sslarch=)
REM	apr_crypto_openssl-1 only seems required for tests
for %%F in (libexpat libapr-1 libapriconv-1 libaprutil-1 libserf-2 zlib libsqlite3) do (
	for %%X in (dll pdb) do (
		xcopy /C /F /Y %PATH_INSTALL%\bin\%%F.%%X  %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\*
	)
)
for %%F in (libssl-%OPENSSL_SUF%%sslarch% libcrypto-%OPENSSL_SUF%%sslarch%) do (
	for %%X in (dll pdb) do (
		xcopy /C /F /Y %PATH_INSTALL_OSSL%\bin\%%F.%%X  %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\*
	)
)