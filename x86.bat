set ARCH=x86
set serfbuild=x86
set perlbuild=VC-WIN32
set archmsbuild=Win32
set outmsbuild=Release
set CYGV=32

set CMAKE_BUILD_TYPE=RelWithDebInfo
REM set CMAKE_BUILD_TYPE=Release

rmdir /S /Q C:\httpd-sdk\build
mklink /j C:\httpd-sdk\build C:\httpd-sdk\build_%ARCH%
rmdir /S /Q C:\httpd-sdk\install
mklink /j C:\httpd-sdk\install C:\httpd-sdk\install_%ARCH%
SET PATH=c:\python27;C:\bin\nasm;c:\perl\bin;c:\perl\site\bin;c:\bin;C:\Windows\SysWOW64;C:\msvc15\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;C:\Windows\SysWOW64\wbem;c:\cyg%CYGV%\bin;"C:\Program Files\Git\bin"
call C:\msvc15\VC\Auxiliary\Build\vcvarsall.bat %ARCH%
cd /D C:\httpd-sdk