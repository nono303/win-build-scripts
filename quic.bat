@echo off
REM ########################## QUIC enabled (nghttp2 & curl with nghttp3, ngtcp2 and patched openssl 3.X
set QUIC_BUILD=%1
if %QUIC_BUILD% == 1 (
	set OPENSSL_SUF=81_3
	set OPENSSL_SCM=openssl-quic
	echo ~~-~~ QUIC ~~-~~
) else (
	set OPENSSL_SUF=3
	set OPENSSL_SCM=openssl
	echo ~-~ NO QUIC ~-~
)
set PATH_INSTALL_OSSL=%PATH_INSTALL%\_openssl\%OPENSSL_SCM%