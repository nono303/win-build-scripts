@echo off
for /F "tokens=* USEBACKQ" %%F in (`%PATH_BIN_CYGWIN%\date -u`) do (set LIBCURL_TIMESTAMP=%%F)
REM for %%S in (openssl winssl) do (
for %%S in (openssl) do (
	call %PATH_MODULES_COMMON%\init.bat %1 cmake

		REM https://github.com/curl/curl/blob/master/GIT-INFO
	copy /Y %PATH_SRC%\%1\src\tool_hugehelp.c.cvs %PATH_SRC%\%1\src\tool_hugehelp.c

		REM set LIBCURL_TIMESTAMP
	sed -i 's/\[unreleased\]/%LIBCURL_TIMESTAMP%/g' %CYGPATH_SRC%/%1/include/curl/curlver.h
	call %PATH_MODULES%\curl-sub.bat %1 %%S
)
curl https://curl.se/ca/cacert.pem -o %PATH_INSTALL%\bin\curl-ca-bundle.crt