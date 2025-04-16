@echo off && call %PATH_MODULES_COMMON%\init.bat %1

call %PATH_BIN_CYGWIN%\bash --login -c 'cd %CYGPATH_SRC%/%1 && make -j16 proxytunnel CFLAGS="-Wall -ggdb -O3 -s -march=skylake" OPTFLAGS="-DHAVE_GETOPT_LONG -DUSE_SSL -DSPT_TYPE=2 -DCYGWIN"'

xcopy /C /F /Y %PATH_SRC%\%1\%1.exe %PATH_INSTALL%\bin\*
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%1.exe norpdb
