@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

if not exist %PATH_SRC%\%1\third_party\. mkdir %PATH_SRC%\%1\third_party
if not exist %PATH_SRC%\%1\third_party\abseil-cpp\. mklink /J %PATH_SRC%\%1\third_party\abseil-cpp %PATH_SRC%\abseil-cpp

	REM fix /src/gav1/symbol_visibility.h #define LIBGAV1_PUBLIC __declspec(dllexport)
sed -i -E 's/ ^&^& LIBGAV1_BUILDING_DLL//g' %CYGPATH_SRC%/%1/src/gav1/symbol_visibility.h
sed -i -E 's/_WIN32/WIN32/g' %CYGPATH_SRC%/%1/src/gav1/symbol_visibility.h

	REM FAILED: bin/abseil_dll.dll abseil/absl/abseil_dll.lib
	REM cmd.exe /C "cmd.exe /C "C:\sdk\softs\cmake\bin\cmake.exe -E __create_def C:\sdk\build\vs17_x64-avx\libgav1\abseil\absl\CMakeFiles\abseil_dll.dir\.\exports.def C:\sdk\build\vs17_x64-avx\libgav1\abseil\absl\CMakeFiles\abseil_dll.dir\.\exports.def.objs && cd C:\sdk\build\vs17_x64-avx\libgav1" && C:\sdk\softs\cmake\bin\cmake.exe -E vs_link_dll --intdir=abseil\absl\CMakeFiles\abseil_dll.dir --rc=C:\WINDOW~1\10\bin\100220~1.0\x64\rc.exe --mt=C:\WINDOW~1\10\bin\100220~1.0\x64\mt.exe --manifests  -- C:\sdk\softs\vs22\Community\VC\Tools\MSVC\14.32.31114\bin\Hostx64\x64\link.exe /nologo @CMakeFiles\abseil_dll.rsp  /out:bin\abseil_dll.dll /implib:abseil\absl\abseil_dll.lib /pdb:bin\abseil_dll.pdb /dll /version:0.0 /LTCG /machine:x64 /DEBUG /NOLOGO /LTCG /OPT:REF,ICF  /DEF:abseil\absl\CMakeFiles\abseil_dll.dir\.\exports.def  && cd ."
	REM ninja: build stopped: subcommand failed.
cmake -Wno-dev -G "Visual Studio 17 2022" ^
	-DCMAKE_INSTALL_PREFIX=%PATH_INSTALL% ^
	-DCMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE% ^
	-DLIBGAV1_THREADPOOL_USE_STD_MUTEX=1 ^
	-DBUILD_SHARED_LIBS=1 ^
	-DLIBGAV1_ENABLE_TESTS=0 ^
	-DABSL_PROPAGATE_CXX_STD=ON ^
	%PATH_SRC%\%1

	REM abseil_dll MUST be without cl:/GL link:/LTCG
%PATH_BIN_CYGWIN%\bash %PATH_MODULES%/%1.sh "%PATH_BUILD:\=/%/%1/" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%

set AOMCONF=RelWithDebInfo
MSBuild.exe libgav1.sln ^
	%MSBUILD_OPTS% ^
	/t:libgav1_shared ^
	/p:Configuration=%AOMCONF% ^
	/p:Platform=%archmsbuild%

for %%Y in (dll pdb) do (xcopy /C /F /Y  %PATH_BUILD%\%1\%AOMCONF%\libgav1.%%Y %PATH_INSTALL%\bin\*)
xcopy /C /F /Y  %PATH_BUILD%\%1\%AOMCONF%\libgav1.lib %PATH_INSTALL%\lib\*
if not exist %PATH_INSTALL%\include\gav1\. mkdir %PATH_INSTALL%\include\gav1
xcopy /C /F /Y %PATH_SRC%\%1\src\gav1\*.h %PATH_INSTALL%\include\gav1\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libgav1.dll