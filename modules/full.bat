@echo off
IF not [%2] == [all] (
	IF not [%2] == [] (
		GOTO %2
	)
)
call %PATH_BATCH%\go.bat clean NOLOG
:httpdanddeps
	:brotli
	call %PATH_BATCH%\go.bat brotli NOLOG
	:jansson
	call %PATH_BATCH%\go.bat jansson NOLOG
	:bzip2
	call %PATH_BATCH%\go.bat bzip2 NOLOG
	:zlib
	call %PATH_BATCH%\go.bat zlib NOLOG
	:openssl
	call %PATH_BATCH%\go.bat openssl NOLOG
	:jemalloc
	call %PATH_BATCH%\go.bat jemalloc NOLOG
	:libiconv
	call %PATH_BATCH%\go.bat libiconv NOLOG
	:liblzma
	call %PATH_BATCH%\go.bat liblzma NOLOG
	:icu
	call %PATH_BATCH%\go.bat icu NOLOG
	:libxml2
	call %PATH_BATCH%\go.bat libxml2 NOLOG
	:pcre2
	call %PATH_BATCH%\go.bat pcre2 NOLOG
	:libevent
	call %PATH_BATCH%\go.bat libevent NOLOG
	:libev
	call %PATH_BATCH%\go.bat libev NOLOG
	:cares
	call %PATH_BATCH%\go.bat cares NOLOG
	if %QUIC_BUILD% == 1 (
		:nghttp3
		call %PATH_BATCH%\go.bat nghttp3 NOLOG
		:ngtcp2
		call %PATH_BATCH%\go.bat ngtcp2 NOLOG
	)
	:nghttp2
	call %PATH_BATCH%\go.bat nghttp2 NOLOG
	:libssh2
	call %PATH_BATCH%\go.bat libssh2 NOLOG
	:zstd
	call %PATH_BATCH%\go.bat zstd NOLOG
	:curl
	call %PATH_BATCH%\go.bat curl NOLOG
	:libexpat
	call %PATH_BATCH%\go.bat libexpat NOLOG
	:libmaxminddb
	call %PATH_BATCH%\go.bat libmaxminddb NOLOG
	:sqlite
	call %PATH_BATCH%\go.bat sqlite NOLOG
	:apr
	call %PATH_BATCH%\go.bat apr NOLOG
	:lua
	call %PATH_BATCH%\go.bat lua NOLOG
	:httpd
	call %PATH_BATCH%\go.bat httpd NOLOG
	:yajl
	call %PATH_BATCH%\go.bat yajl NOLOG
	:mod_security
	call %PATH_BATCH%\go.bat mod_security NOLOG
	if  "%2" == "httpdanddeps" exit /B
:phpanddeps
	:wineditline
	call %PATH_BATCH%\go.bat wineditline NOLOG
	:libzip
	call %PATH_BATCH%\go.bat libzip NOLOG
	:libxpm
	call %PATH_BATCH%\go.bat libxpm NOLOG
	:libpng
	call %PATH_BATCH%\go.bat libpng NOLOG
	:libjpeg-turbo
	call %PATH_BATCH%\go.bat libjpeg-turbo NOLOG
	:giflib
	call %PATH_BATCH%\go.bat giflib NOLOG
	:freeglut
	call %PATH_BATCH%\go.bat freeglut NOLOG
	:libwebp
	call %PATH_BATCH%\go.bat libwebp NOLOG
	:libdeflate
	call %PATH_BATCH%\go.bat libdeflate NOLOG
	:lerc
	call %PATH_BATCH%\go.bat lerc NOLOG
	:libtiff
	call %PATH_BATCH%\go.bat libtiff NOLOG
		REM rebuild libwebp again for tiff support
	call %PATH_BATCH%\go.bat libwebp NOLOG
	:tidy
	call %PATH_BATCH%\go.bat tidy NOLOG
	:libxdiff
	call %PATH_BATCH%\go.bat libxdiff NOLOG
	:freetype2
	call %PATH_BATCH%\go.bat freetype2 NOLOG
	:libffi
	call %PATH_BATCH%\go.bat libffi NOLOG
	:aom
	call %PATH_BATCH%\go.bat aom NOLOG
	:libgav1
	call %PATH_BATCH%\go.bat libgav1 NOLOG
	:dav1d
	call %PATH_BATCH%\go.bat dav1d NOLOG
	:libyuv
	call %PATH_BATCH%\go.bat libyuv NOLOG
	:libavif
	call %PATH_BATCH%\go.bat libavif NOLOG
	:geos
	call %PATH_BATCH%\go.bat geos NOLOG
	:libsodium
	call %PATH_BATCH%\go.bat libsodium NOLOG
	:mpir
	call %PATH_BATCH%\go.bat mpir NOLOG
	:libxslt
	call %PATH_BATCH%\go.bat libxslt NOLOG
	:libheif
	call %PATH_BATCH%\go.bat libheif NOLOG
	:libgd
	call %PATH_BATCH%\go.bat libgd NOLOG
	:libgeotiff
	call %PATH_BATCH%\go.bat libgeotiff NOLOG
	:proj
	call %PATH_BATCH%\go.bat proj NOLOG
	:gdal
	call %PATH_BATCH%\go.bat gdal NOLOG
	:php
	call %PATH_BATCH%\go.bat php NOLOG
	if  "%2" == "phpanddeps" exit /B
:subversionanddeps
	:serf
	call %PATH_BATCH%\go.bat serf NOLOG
	:subversion
	call %PATH_BATCH%\go.bat subversion NOLOG
	if  "%2" == "subversionanddeps" exit /B
:geographiclib
call %PATH_BATCH%\go.bat geographiclib NOLOG
:nssm
call %PATH_BATCH%\go.bat nssm NOLOG
:php-cgi-spawner
call %PATH_BATCH%\go.bat php-cgi-spawner NOLOG
:dependencies
call %PATH_BATCH%\go.bat dependencies NOLOG
	REM only for build ALL
IF [%2] == [] (
	call %PATH_BATCH%\go.bat bininfo checkavx
	call %PATH_BATCH%\go.bat libcheck
)