REM aom option in macro
for %%X in (apr-util apr brotli bzip2 cares curl dav1d freeglut freetype2 gdal geographiclib geos giflib jansson lerc libavif libdeflate libev libevent libexpat libffi libgav1 libgd libgeotiff libheif libjpeg-turbo liblzma libmaxminddb libpng libssh2 libtiff libwebp libxdiff libxslt libyuv libzip mod_fcgid nghttp2 nghttp3 ngtcp2 pcre2 proj pthread-win32 qhull serf sqlite tidy wineditline yajl zlib zstd) do (
	call go %%X cmopts
)