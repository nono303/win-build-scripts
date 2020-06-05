# Dirty old-fashioned cook batch scripts for Windows MSVC building

##### *[...OK, but for building what?]((./SRC_VERSION.md))*

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
   1. `vc15.bat` or `vs16.bat`

   2. `x86.bat` or `x64.bat`

   3. `avx.bat 0` or `avx.bat 1`

      shortcut example: `C:\Windows\System32\cmd.exe /k vs16 && x64 && avx 1`

   4. `go srccreate` to clone and checkout all src

5. `go help` for usage and... Enjoy!

### REQUIREMENTS

| soft                         | arch | "my"version    | /config             |
| ---------------------------- | ---- | -------------- | ------------------- |
| Visual Studio 2019 Community |      | 16.6.1 (14.26) | `.vsconfig`         |
| Cygwin                       | x86  | 3.1.5          | `cyg32.packagelist` |
| Cygwin                       | x64  | 3.1.5          | `cyg64.packagelist` |
| Python 2.7                   | x64  | 2.7.17150      |                     |
| OpenJDK                      | x86  | 11.0.7         |                     |
| OpenJDK                      | x64  | 11.0.7         |                     |
| ActivePerl                   | x64  | 5.28.1         |                     |
| Netwide Assembler            | x64  | 2.14.02        |                     |
| Git                          | x64  | 2.27.0         |                     |
| verpatch                     | x64  | 1.0.15.1       |                     |
| 7z                           | x64  | 19             |                     |
| sigcheck64                   | x64  | 2.73           |                     |
| ChkMatch                     |      | 1.0.3          |                     |

### [SOURCE VERSIONS](./SRC_VERSION.md)