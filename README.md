Old-fashioned dirty scripts for building on Windows Apache Httpd & Subversion, PHP and most of required dependencies to build them. This is the result of many years of “evolution” ^^

They are not intending to be clean, easy usable or fully contextualized but offering help to those who want to self-made some of these stuffs.

I’ll try to give most information of how my VM is configured to work with, appreciate all feedback that may improve them and answer if any question or suggestion!

Note, that the goal is to have quick pseudo-automated build for **<u>personal and testing use only</u>**
I voluntary disable testing, man & co. in the “pipeline” to speed up its but always launch manual testing build for new version before start cooking ;)

| SCRIPT                      |                                                         |
| --------------------------- | ------------------------------------------------------- |
| .vsconfig                   | Installed modules for MS VS 2019  community edition     |
| _all.bat                    | launch a single module build the 8 release              |
| avx.bat                     | set AVX release `avx 1` or SSE2 release `avx 0`         |
| cyg32.packagelist           | Installed module for cygwin x86                         |
| cyg64.packagelist           | Installed module for cygwin x64                         |
| git-fetch.php               | sub - php srcipt producing csv result of git src repos  |
| httpd-build.bat             | sub - ordonned list of dependencies build of httpd      |
| php-getdeps.php             | sub - downloading PHP deps not self made                |
| phpsdk-config_make.bat      | sub - php configure                                     |
| phpsdk-local.bat            | sub - php build desp & co.                              |
| silent-git-fetch.bat        | launch git fetch src repos                              |
| silent-httpd-build.bat      | launch httpd release                                    |
| silent-php-build.bat        | launch php release                                      |
| silent-subversion-build.bat | launch subversion release                               |
| subversion-build.bat        | sub - ordonned list of dependencies build of svn        |
| vc15.bat                    | set vc15 release                                        |
| vcxproj.sh                  | sub -                                                   |
| vs16.bat                    | set vs16 release                                        |
| x64.bat                     | set x64 release                                         |
| x86.bat                     | set x86 release                                         |
| xCommon.bat                 | sub - define VAR & PATH <= **must be reviewed!**        |
| ymdhis.bat                  | sub - log naming with date_time                         |
| /modules_bat                | subdir with module build batch (and sub shell for some) |