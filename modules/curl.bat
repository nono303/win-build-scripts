@echo off
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\date -u`) do (set LIBCURL_TIMESTAMP=%%F)
REM for %%S in (openssl winssl) do (
for %%S in (openssl) do (
	@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

		REM https://github.com/curl/curl/blob/master/GIT-INFO
	copy /Y %PATH_SRC%\%1\src\tool_hugehelp.c.cvs %PATH_SRC%\%1\src\tool_hugehelp.c

		REM copyright symbol issue : verpatch doesn't work without any error output !!
	for %%I in (lib/libcurl.rc src/curl.rc) do (
		sed -i -E 's/"LegalCopyright",.*/"LegalCopyright",   "%RC_COPYRIGHT:/=\/%\\\\0"/g' %CYGPATH_SRC%/%1/%%I
		sed -i -E 's/"InternalName",.*/"InternalName",     "%ARCH% %AVXECHO% MSVC %vcvars_ver%\\\\0"/g' %CYGPATH_SRC%/%1/%%I
	)
		REM set LIBCURL_TIMESTAMP
	sed -i 's/\[unreleased\]/%LIBCURL_TIMESTAMP%/g' %CYGPATH_SRC%/%1/include/curl/curlver.h
	call %PATH_MODULES%\curl-sub.bat %1 %%S
)
curl https://curl.se/ca/cacert.pem -o %PATH_INSTALL%\bin\curl-ca-bundle.crt