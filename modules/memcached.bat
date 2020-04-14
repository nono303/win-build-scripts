set MEMCACHED_PREFIX=/cygdrive/d/github/NONO_memcached/cygwin
call c:\cyg32\bin\bash --login -c '%CYGPATH_MODULES%/memcached.sh %CYGPATH_SRC%/memcached %CYGPATH_MODULES% %MEMCACHED_PREFIX%'
call c:\cyg64\bin\bash --login -c '%CYGPATH_MODULES%/memcached.sh %CYGPATH_SRC%/memcached %CYGPATH_MODULES% %MEMCACHED_PREFIX%'
call D:\github\NONO_memcached\cygwin\x86\memcached.exe --version
call D:\github\NONO_memcached\cygwin\x86\memcached-avx.exe --version
call D:\github\NONO_memcached\cygwin\x86\memcached-tls.exe --version
call D:\github\NONO_memcached\cygwin\x86\memcached-avx-tls.exe --version
call D:\github\NONO_memcached\cygwin\x64\memcached.exe --version
call D:\github\NONO_memcached\cygwin\x64\memcached-avx.exe --version
call D:\github\NONO_memcached\cygwin\x64\memcached-tls.exe --version
call D:\github\NONO_memcached\cygwin\x64\memcached-avx-tls.exe --version