set ARCH=x64
set perlbuild=VC-WIN64A
set CYGV=64

set CMAKE_BUILD_TYPE=RelWithDebInfo
REM set CMAKE_BUILD_TYPE=Release

rmdir /S /Q C:\httpd-sdk\build
mklink /j C:\httpd-sdk\build C:\httpd-sdk\build_%ARCH%
rmdir /S /Q C:\httpd-sdk\install
mklink /j C:\httpd-sdk\install C:\httpd-sdk\install_%ARCH%
SET PATH=C:\bin\nasm;c:\perl\bin;c:\perl\site\bin;c:\bin;C:\Windows\SysWOW64;C:\msvc15\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;C:\Windows\SysWOW64\wbem;c:\cyg%CYGV%\bin
call C:\msvc15\VC\Auxiliary\Build\vcvarsall.bat %ARCH%
cd /D C:\httpd-sdk