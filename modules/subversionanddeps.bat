@echo off
set PATH_INSTALL_SAV=%PATH_INSTALL%
set PATH_INSTALL=%PATH_INSTALL%.svn

call go clean
call go zlib NOLOG
call go pcre2 svn NOLOG
call go libexpat NOLOG
call go openssl svn NOLOG
call go sqlite svn NOLOG
call go apr NOLOG
call go libiconv NOLOG
call go apr-util svn NOLOG
call go serf NOLOG
call go httpd svn NOLOG
call go subversion NOLOG

set DEPS=\deps
if not exist %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\. mkdir %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\
rm -fv "%PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\*.*"

REM	apr_crypto_openssl-1 only seems required for tests
for %%F in (libexpat libapr-1 libiconv libaprutil-1 libserf-2 zlib libsqlite3 libssl-3-x64 libcrypto-3-x64) do (
	for %%X in (dll pdb) do (
		xcopy /C /F /Y %PATH_INSTALL%\bin\%%F.%%X  %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\*
	)
)

set PATH_INSTALL=%PATH_INSTALL_SAV%