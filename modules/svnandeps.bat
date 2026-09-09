@echo off

call go clean svn NOLOG
call go zlib svn NOLOG
call go pcre2 svn NOLOG
call go libexpat svn NOLOG
call go openssl svn NOLOG
call go sqlite svn NOLOG
call go apr svn NOLOG
call go libiconv svn NOLOG
call go apr-util svn NOLOG
call go serf svn NOLOG
call go httpd svn NOLOG
call go subversion svn NOLOG

set DEPS=\deps
if not exist %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\. mkdir %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\
call %PATH_UTILS%\fileutils rm "%PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\*.*"

REM	apr_crypto_openssl-1 only seems required for tests
for %%F in (libexpat libapr-1 libiconv libaprutil-1 libserf-2 libsqlite3 libssl-%OPENSSLVER%-x64 libcrypto-%OPENSSLVER%-x64 z) do (
	for %%X in (dll pdb) do (
		call %PATH_UTILS%\fileutils cp %PATH_INSTALL%.svn\bin\%%F.%%X  %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB%%DEPS%\*
	)
)