call %PATH_BATCH%\go.bat clean NOLOG
call %PATH_BATCH%\go.bat brotli NOLOG
call %PATH_BATCH%\go.bat jansson NOLOG
call %PATH_BATCH%\go.bat bzip2 NOLOG
call %PATH_BATCH%\go.bat zlib NOLOG
call %PATH_BATCH%\go.bat openssl NOLOG
call %PATH_BATCH%\go.bat jemalloc NOLOG
call %PATH_BATCH%\go.bat libiconv NOLOG
call %PATH_BATCH%\go.bat liblzma NOLOG
call %PATH_BATCH%\go.bat icu NOLOG
call %PATH_BATCH%\go.bat libxml2 NOLOG
call %PATH_BATCH%\go.bat pcre2 NOLOG
call %PATH_BATCH%\go.bat libevent NOLOG
call %PATH_BATCH%\go.bat libev NOLOG
call %PATH_BATCH%\go.bat cares NOLOG
if %QUIC_BUILD% == 1 (
	call %PATH_BATCH%\go.bat nghttp3 NOLOG
	call %PATH_BATCH%\go.bat ngtcp2 NOLOG
)
call %PATH_BATCH%\go.bat nghttp2 NOLOG
call %PATH_BATCH%\go.bat libssh2 NOLOG
call %PATH_BATCH%\go.bat curl NOLOG
call %PATH_BATCH%\go.bat libexpat NOLOG
call %PATH_BATCH%\go.bat libmaxminddb NOLOG
call %PATH_BATCH%\go.bat sqlite NOLOG
call %PATH_BATCH%\go.bat apr NOLOG
call %PATH_BATCH%\go.bat lua NOLOG
call %PATH_BATCH%\go.bat httpd NOLOG