@echo off && call %PATH_MODULES_COMMON%\init.bat %1 cmake

meson ^
--prefix %PATH_INSTALL% ^
--buildtype debugoptimized ^
--default-library=static ^
%PATH_SRC%\%1

%PATH_BIN_CYGWIN%\bash %CYGPATH_MODULES_COMMON%/meson.sh "%AVXSED%" "%CYGPATH_BUILD%/%1" "%NUMBER_OF_PROCESSORS%"
%NINJA% install

move /Y %PATH_INSTALL%\lib\libdav1d.a %PATH_INSTALL%\lib\libdav1d.lib
xcopy /C /F /Y %PATH_BUILD%\%1\tools\dav1d.pdb %PATH_INSTALL%\lib\libdav1d.pdb*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\dav1d.exe