@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
-DBUILD_SHARED_LIBS=ON ^
-DENABLE_SMALL=OFF ^
-DMICROLZMA_ENCODER=ON ^
-DMICROLZMA_DECODER=ON ^
-DLZIP_DECODER=ON ^
-DALLOW_CLMUL_CRC=ON ^
-DALLOW_ARM64_CRC32=OFF ^
-DENABLE_NLS=OFF ^
-DCMAKE_DISABLE_FIND_PACKAGE_Gettext=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_Intl=1 ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

for %%X in (lzmadec.pdb lzmainfo.pdb liblzma.pdb xz.pdb xzdec.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%X %PATH_INSTALL%\bin\*)
for %%X in (lzmadec.exe lzmainfo.exe liblzma.dll xz.exe xzdec.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)