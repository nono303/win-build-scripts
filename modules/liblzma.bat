@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake nostd

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_TESTING=OFF ^
-DTUKLIB_FAST_UNALIGNED_ACCESS=ON ^
-DTUKLIB_USE_UNSAFE_TYPE_PUNNING=OFF ^
-DXZ_CLMUL_CRC=ON ^
-DXZ_DOC=OFF ^
-DXZ_EXTERNAL_SHA256=OFF ^
-DXZ_LOONGARCH_CRC32=ON ^
-DXZ_LZIP_DECODER=ON ^
-DXZ_MICROLZMA_DECODER=ON ^
-DXZ_MICROLZMA_ENCODER=ON ^
-DXZ_NLS=OFF ^
-DXZ_SMALL=OFF ^
-DXZ_THREADS=yes ^
-DXZ_TOOL_LZMADEC=ON ^
-DXZ_TOOL_LZMAINFO=ON ^
-DXZ_TOOL_XZ=ON ^
-DXZ_TOOL_XZDEC=ON ^
-DCMAKE_DISABLE_FIND_PACKAGE_Gettext=1 ^
-DCMAKE_DISABLE_FIND_PACKAGE_Intl=1 ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
sed -i 's/lzma\.lib/liblzma\.lib/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\liblzma.lib %PATH_INSTALL%\lib\*
for %%X in (lzmadec.pdb lzmainfo.pdb liblzma.pdb xz.pdb xzdec.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\%%X %PATH_INSTALL%\bin\*)
for %%X in (lzmadec.exe lzmainfo.exe liblzma.dll xz.exe xzdec.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)