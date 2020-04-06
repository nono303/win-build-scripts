Old-fashioned dirty scripts for building on Windows Apache Httpd & Subversion, PHP, memcached and most of their required dependencies. This is the result of many years of... “evolution” ^^

They are not intending to be clean, easy usable or fully contextualized but offering help to those who want to self-made some of these stuffs.

I’ll try to give most information of how my VM is configured to work with, appreciate all feedback that may improve them and answer if any question or suggestion!

Note, that the goal is to have quick pseudo-automated build for **<u>testing use</u>**
I voluntary disable testing, man & co. in the “pipeline” to speed up its but always launch manual testing build for new version before start cooking ;)

## HOW-TO

1. check your paths in `xCommon.bat` according to **requirements**
2. launch simple command prompt
3. init
   1. `vc15.bat` or `vs16.bat`
   2. `x86.bat` or `x64.bat`
   3. `avx.bat 0` or `avx.bat 1`
4. exec

- `silent-git-fetch.bat`  
- `silent-httpd-build.bat` 
- `silent-php-build.bat`  *must be done after `silent-httpd-build.bat`* 
- `silent-subversion-build.bat` *must be done after `silent-httpd-build.bat`* 
- modules_bat/*.bat
- `_all.bat`

### SCRIPTS

| name                          | description                                              |
| ----------------------------- | -------------------------------------------------------- |
| `.vsconfig`                   | list of  installed modules for MS VS 2019                |
| `_all.bat`                    | **EXEC** a single module build the 8 release             |
| `avx.bat`                     | **INIT** AVX release `avx 1` or SSE2 release `avx 0`     |
| `cyg32.packagelist`           | list of  installed packages for Cygwin x86               |
| `cyg64.packagelist`           | list of  installed packages for Cygwin x64               |
| `git-fetch.php`               | *sub* - php srcipt producing csv result of git src repos |
| `httpd-build.bat`             | *sub* - orderly list of dependencies build of httpd      |
| `php-getdeps.php`             | *sub* - downloading PHP deps not self made               |
| `phpsdk-config_make.bat`      | *sub* - php configure                                    |
| `phpsdk-local.bat`            | *sub* - php build desp & co.                             |
| `silent-git-fetch.bat`        | **EXEC** git fetch & state for src repos                 |
| `silent-httpd-build.bat`      | **EXEC** Httpd release                                   |
| `silent-php-build.bat`        | **EXEC** PHP release                                     |
| `silent-subversion-build.bat` | **EXEC** Subversion release                              |
| `subversion-build.bat`        | *sub* - orderly list of dependencies build of svn        |
| `vc15.bat`                    | **INIT** vc15                                            |
| `vcxproj.sh`                  | *sub* - cflags optimization for vcxproj                  |
| `vs16.bat`                    | **INIT** vs16                                            |
| `x64.bat`                     | **INIT** x64                                             |
| `x86.bat`                     | **INIT **x86                                             |
| `xCommon.bat`                 | *sub* - define VAR & PATH <= **must be reviewed!**       |
| `ymdhis.bat`                  | *sub* - log naming with date_time                        |
| /modules_bat                  | dir for **dependencies** batch (and shell for some)      |

## SOURCES

| folder              | url                                                          |
| ------------------- | ------------------------------------------------------------ |
| apr                 | https://github.com/apache/apr.git                            |
| apr-iconv           | https://github.com/apache/apr-iconv                          |
| apr-util            | https://github.com/apache/apr-util.git                       |
| brotli              | https://github.com/google/brotli.git                         |
| bzip2-1.0.6         | https://github.com/enthought/bzip2-1.0.6.git                 |
| c-ares              | https://github.com/c-ares/c-ares.git                         |
| curl                | https://github.com/curl/curl.git                             |
| freetype            | https://github.com/winlibs/freetype.git                      |
| httpd               | https://github.com/apache/httpd.git                          |
| jansson             | https://github.com/akheron/jansson.git                       |
| jemalloc-cmake      | https://github.com/jemalloc/jemalloc-cmake.git               |
| libev-win           | https://github.com/disenone/libev-win                        |
| libevent            | https://github.com/libevent/libevent.git                     |
| libexpat            | https://github.com/libexpat/libexpat.git                     |
| libiconv            | https://github.com/winlibs/libiconv.git                      |
| libjpeg             | https://github.com/winlibs/libjpeg.git                       |
| libmaxminddb        | https://github.com/maxmind/libmaxminddb.git                  |
| libpng              | https://github.com/winlibs/libpng.git                        |
| libssh2             | https://github.com/libssh2/libssh2.git                       |
| libxdiff            | https://github.com/opencor/libxdiff                          |
| libxml2             | https://github.com/GNOME/libxml2.git                         |
| libxpm              | https://github.com/winlibs/libxpm                            |
| lua                 | https://github.com/LuaDist/lua                               |
| memcached           | https://github.com/memcached/memcached                       |
| mod_fcgid           | https://github.com/pagespeed/mod_fcgid                       |
| mod_h2              | https://github.com/icing/mod_h2.git                          |
| mod_h264_streaming  | https://github.com/traceypooh/mod_h264_streaming--intra-keyframes.git |
| mod_maxminddb       | https://github.com/maxmind/mod_maxminddb.git                 |
| mod_md              | https://github.com/icing/mod_md                              |
| mod_wku_bt          | https://github.com/nono303/mod_whatkilledus                  |
| nghttp2             | https://github.com/nghttp2/nghttp2.git                       |
| nssm                | https://git.nssm.cc/nssm/nssm.git                            |
| openssl             | https://github.com/openssl/openssl.git                       |
| pcre                | https://github.com/svn2github/pcre.git                       |
| pecl-memcache       | https://github.com/websupport-sk/pecl-memcache.git           |
| pecl-text-xdiff     | https://github.com/php/pecl-text-xdiff                       |
| php-cgi-spawner     | https://github.com/deemru/php-cgi-spawner.git                |
| php-ext-brotli      | https://github.com/kjdev/php-ext-brotli.git                  |
| php-src             | https://github.com/php/php-src.git                           |
| php72-sdk           | https://github.com/microsoft/php-sdk-binary-tools.git        |
| sdlna               | https://github.com/nono303/simpleDLNA.git                    |
| serf                | https://github.com/apache/serf                               |
| simpleDLNA          | https://github.com/nono303/simpleDLNA.git                    |
| sqlite-amalgamation | https://github.com/azadkuh/sqlite-amalgamation               |
| subversion          | https://github.com/apache/subversion.git                     |
| tidy-html5          | https://github.com/htacg/tidy-html5                          |
| xdebug              | https://github.com/xdebug/xdebug.git                         |
| zlib                | https://github.com/madler/zlib.git                           |

## REQUIREMENTS

| soft                         | arch | "my"version | "my" path                                                    | config              |
| ---------------------------- | ---- | ----------- | ------------------------------------------------------------ | ------------------- |
| Visual Studio 2019 Community |      | 16.5.2      | `C:\Program Files (x86)\Microsoft Visual Studio\2019\Community` | `.vsconfig`         |
| Cygwin                       | x86  | 3.1.4       | `C:\cyg32`                                                   | `cyg32.packagelist` |
| Cygwin                       | x64  | 3.1.4       | `C:\cyg64`                                                   | `cyg64.packagelist` |
| python 2.7                   | x64  | 2.7.15      | `C:\python27`                                                |                     |
| Oracle JDK                   | x86  | 8.0.241     | `C:\jdk8\x86`                                                |                     |
| Oracle JDK                   | x64  | 8.0.241     | `C:\jdk8\x64`                                                |                     |
| ActivePerl                   | x64  | 5.26.2603   | `C:\perl`                                                    |                     |
| Netwide Assembler            | x64  | 2.14.02     | `C:\bin\nasm`                                                |                     |
| Git                          | x64  | 2.26.0      | `C:\Program Files\Git`                                       |                     |