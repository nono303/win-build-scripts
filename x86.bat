@echo off
set ARCH=x86
set serfbuild=x86
set perlbuild=VC-WIN32
set archmsbuild=Win32
set outmsbuild=Release
set CYGV=32
echo ~~-~~  x86 ~~-~~
call C:\httpd-sdk\xCommon.bat
set PATH=%PATHORI%;C:\msvc16\MSBuild\Current\Bin