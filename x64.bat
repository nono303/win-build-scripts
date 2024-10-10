@echo off
set ARCH=x64
set perlbuild=VC-WIN64A
set archmsbuild=x64
set outmsbuild=x64\Release
echo ~~-~~  x64 ~~-~~
if exist .\env.bat (
	call .\env.bat
) else (
	call .\env_sample.bat
)
set PATH=%PATH_WIN%;%PATH_VS%\MSBuild\Current\Bin\amd64;
set EXTERNAL_INCLUDE=
set INCLUDE=
set LIB=