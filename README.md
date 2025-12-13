# Dirty old-fashioned cook batch scripts for Windows MSVC building

##### *[...OK, but for building what?](./SRC_VERSION.md)*

- Apache **httpd** and its deps
- Apache **subversion** and its deps
- **PHP** and most of its deps
- other cool stuff
  - geographiclib
    * dependencies
    * sdlna
    * verpatch
    * run-hidden
    * *cygwin*
      * memcached
      * proxytunnel
      * sslh
    * *Java*
      * mapsforgesrv
      * tzdataservice
      * fit2gpx
      * mobac

This tool-chain is the result of... many years of “evolution” ^^

I've done some job to make them readable, quite usable and contextualized but this is more for offering ideas to those who want to self-made some of these stuffs.

I'll answer if detail needed and all feedback that may improve them will be appreciate

Note, that the goal is to have quick pseudo-automated build for testing use I voluntary disable testing, man & co. in the “pipeline” to speed up it, but always launch manual testing build for new version before start cooking ;)

### HOW-TO

1. Install **[requirements](#requirements)**

2. copy `env_sample.bat` to `env.bat` and fill your paths according to requirements install path

3. launch simple command prompt in check-outed directory

4. init
   1. **Choose your toolset version:** `vs17.bat` _(v142)_ or `vs18.bat` _(v143)_

   2. **Choose your architecture:** `x64.bat`

   3. **Choose your CPU instruction level:** `avx.bat 0` _(SSE2)_ or `avx.bat 1` _(AVX)_ or `avx.bat 2` _(AVX2)_

      shortcut example for classic usage: `C:\Windows\System32\cmd.exe /k vs18 && x64 && avx 2`

   4. `go srccreate` to clone and checkout all src

5. `go help` for usage and... Enjoy!

### REQUIREMENTS

| soft                                                         | arch | version    | /config             |
| ------------------------------------------------------------ | ---- | -------------- | ------------------- |
| [Visual Studio 2026](https://aka.ms/vs/18/Stable/vs_community.exe) |      | 18.1.0 (14.50, 14.44) | `.vsconfig`         |
| :bookmark: [Microsoft Visual C++ Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) | x64 & x86 | 14.50.35719 |  |
| [Cygwin](https://cygwin.com/install.html)                    | x64  | 3.7.0 | `cyg64.packagelist` |
| [Python](https://www.python.org/downloads/)                  | x64  | 3.13.11 |                     |
| [OpenJDK](https://jdk.java.net/25/)              | x64  | 25.0.1 |                     |
| [Strawberry Perl](https://github.com/StrawberryPerl/Perl-Dist-Strawberry/releases) | x64  | 5.42.0.1 UCRT |                     |
| [NASM](https://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D) | x64  | 2.16.03 *:warning:  3.0.1* |                     |
| [YASM](https://github.com/yasm/yasm) _mpir_ | x64 | 1.3.0 | |
| [Git](https://git-scm.com/download/win)                      | x64  | 2.52.0 |                     |
| verpatch                                                     | x64  | 1.0.15.1       |                     |
| [7z](https://www.7-zip.org/download.html)                    | x64  | 25.01 |                     |
| [sigcheck64](https://docs.microsoft.com/en-us/sysinternals/downloads/sigcheck) | x64  | 2.90       |                     |
| [ChkMatch](https://web.archive.org/web/20210205095232/https://www.debuginfo.com/tools/chkmatch.html) | x86 | 1.0.3          |                     |
| [Gradle](https://services.gradle.org/distributions/) | [java] | 9.2.0 | |
| [CMake](https://cmake.org/download/) | x64 | 4.2.1 | |
| [Ninja](https://github.com/ninja-build/ninja/releases) | x64 | 1.13.2 | |
| [JOM](https://download.qt.io/official_releases/jom/) | x64 | 1.1.4 | |
| [Meson](https://github.com/mesonbuild/meson/releases) | [python] | 1.9.2 | |
| [NuGet](https://www.nuget.org/downloads) | x86 | 7.0.1 | |

### [SOURCE VERSIONS](./SRC_VERSION.md)
### [CHANGELOG](./changelog.md)