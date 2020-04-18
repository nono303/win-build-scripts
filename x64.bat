@echo off
set ARCH=x64
set serfbuild=x86_64
set perlbuild=VC-WIN64A
set archmsbuild=x64
set outmsbuild=x64\Release
set CYGV=64
echo ~~-~~  x64 ~~-~~
call .\env.bat
set PATH=%PATH_WIN%;%PATH_VS%\MSBuild\Current\Bin\amd64;