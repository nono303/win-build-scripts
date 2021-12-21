# Dirty old-fashioned cook batch scripts for Windows MSVC building

##### *[...OK, but for building what?](./SRC_VERSION.md)*

- Apache httpd and its deps
- Apache subversion and its deps
- PHP and most of its deps (others come from [php-sdk prebuild deps](https://windows.php.net/downloadS/php-sdk/deps/))
- memcached
- other stuff or tools...

This tool-chain is the result of... many years of “evolution” ^^

I've done some job to make them readable, quite usable and contextualized but this is more for offering ideas to those who want to self-made some of these stuffs.

I'll answer if detail needed and all feedback that may improve them will be appreciate

Note, that the goal is to have quick pseudo-automated build for testing use I voluntary disable testing, man & co. in the “pipeline” to speed up it, but always launch manual testing build for new version before start cooking ;)

### HOW-TO

1. Install **[requirements](#requirements)**

2. copy `env_sample.bat` to `env.bat` and fill your paths according to requirements install path

3. launch simple command prompt in check-outed directory

4. init
   1. `vc15.bat` or `vs16.bat`or `vs17.bat`

   2. `x86.bat` or `x64.bat`

   3. `avx.bat 0` or `avx.bat 1`

      shortcut example: `C:\Windows\System32\cmd.exe /k vs16 && x64 && avx 1`

   4. `go srccreate` to clone and checkout all src

5. `go help` for usage and... Enjoy!

### REQUIREMENTS

| soft                                                         | arch | version    | /config             |
| ------------------------------------------------------------ | ---- | -------------- | ------------------- |
| [Visual Studio 2022 Community](https://visualstudio.microsoft.com/fr/thank-you-downloading-visual-studio/?sku=Community&rel=16) |      | 17.1.0-p1.1 (14.31) | `.vsconfig`         |
| [Cygwin](https://cygwin.com/install.html)                    | x86  | 3.3.3   | `cyg32.packagelist` |
| [Cygwin](https://cygwin.com/install.html)                    | x64  | 3.3.3           | `cyg64.packagelist` |
| [Python](https://www.python.org/downloads/)                  | x64  | 3.10.0 |                     |
| [OpenJDK](https://jdk.java.net/17/)                        | x64  | 17.0.1 |                     |
| [ActivePerl](https://platform.activestate.com/ActiveState/ActivePerl-5.28/auto-fork) | x64  | 5.28.1.2801    |                     |
| [Netwide Assembler](https://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D) | x64  | 2.15.05        |                     |
| [Git](https://git-scm.com/download/win)                      | x64  | 2.34.1 |                     |
| verpatch                                                     | x64  | 1.0.15.1       |                     |
| [7z](https://www.7-zip.org/download.html)                    | x64  | 21.06      |                     |
| [sigcheck64](https://docs.microsoft.com/en-us/sysinternals/downloads/sigcheck) | x64  | 2.82         |                     |
| [ChkMatch](http://beefchunk.com/documentation/sys-programming/os-win32/debug/www.debuginfo.com/tools/chkmatch.html) |      | 1.0.3          |                     |
| [Gradle](https://gradle.org/install/) | | 7.3.2 | |
| [Ninja](https://github.com/ninja-build/ninja/releases) | | 1.10.2 | |
| [Meson](https://github.com/mesonbuild/meson/releases) | [python] | 0.60.2 | |
| [NuGet](https://www.nuget.org/downloads) | x86 | 6.0.0 | |

### [SOURCE VERSIONS](./SRC_VERSION.md)

