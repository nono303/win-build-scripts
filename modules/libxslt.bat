@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

	REM fix find LibXml2
xcopy /C /F /Y %PATH_MODULES%\libxlst.FindLibXml2.cmake %PATH_SRC%\%1\FindLibXml2.cmake*
sed -i 's/LibXml2 CONFIG/LibXml2/g' %CYGPATH_SRC%/%1/CMakeLists.txt

cmake %CMAKE_OPTS% -G %CMAKE_TGT_NINJA% ^
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
-DLIBXML2_INCLUDE_DIR=%PATH_INSTALL%\include\libxml2;%PATH_INSTALL%\include ^
-DLIBXML2_LIBRARY=%PATH_INSTALL%\lib\libxml2.lib ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/ninja.sh "%AVX%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

xcopy /C /F /Y %PATH_BUILD%\%1\xsltproc.pdb %PATH_INSTALL%\bin\*
for %%X in (libexslt.dll libxslt.dll xsltproc.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)
for %%X in (bin\xslt-config lib\xsltConf.sh) do (DEL /Q /F %PATH_INSTALL%\%%X)