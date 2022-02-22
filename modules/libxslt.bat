@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

cmake %CMAKE_OPTS% ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DBUILD_SHARED_LIBS=ON ^
	-DLIBXSLT_WITH_DEBUGGER=ON ^
	-DLIBXSLT_WITH_CRYPTO=OFF ^
	-DLIBXSLT_WITH_MEM_DEBUG=ON ^
	-DLIBXSLT_WITH_MODULES=ON ^
	-DLIBXSLT_WITH_PROFILER=ON ^
	-DLIBXSLT_WITH_PYTHON=OFF ^
	-DLIBXSLT_WITH_TESTS=OFF ^
	-DLIBXSLT_WITH_THREADS=ON ^
	-DLIBXSLT_WITH_XSLT_DEBUG=ON ^
%PATH_SRC%\%1 

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
for %%X in (build.ninja cmake_install.cmake) do (sed -i 's/libexslts\.lib/libexslt_static\.lib/g' %CYGPATH_BUILD%/%1/%%X)
for %%X in (build.ninja cmake_install.cmake) do (sed -i 's/libxslts\.lib/libxslt_static\.lib/g' %CYGPATH_BUILD%/%1/%%X)
sed -i 's/LibExslt\.pdb/libexslt_static\.pdb/g' %CYGPATH_BUILD%/%1/build.ninja
sed -i 's/LibXslt\.pdb/libxslt_static\.pdb/g' %CYGPATH_BUILD%/%1/build.ninja
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\xsltproc.pdb %PATH_INSTALL%\bin\*
for %%X in (libexslt.dll libxslt.dll xsltproc.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)
for %%X in (LibExslt.dir\libexslt_static.pdb LibXslt.dir\libxslt_static.pdb) do (xcopy /C /F /Y %PATH_BUILD%\%1\CMakeFiles\%%X %PATH_INSTALL%\lib\*)
for %%X in (bin\xslt-config lib\xsltConf.sh) do (DEL /Q /F %PATH_INSTALL%\%%X)