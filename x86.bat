@echo off
set ARCH=x86
set serfbuild=x86
set perlbuild=VC-WIN32
set archmsbuild=Win32
set outmsbuild=Release
set CYGV=32
echo ~~-~~  x86 ~~-~~
if exist .\env.bat (
	call .\env.bat
) else (
	call .\env_sample.bat
)
set PATH=%PATH_WIN%;%PATH_VS%\MSBuild\Current\Bin