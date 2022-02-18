@echo off && call %PATH_MODULES_COMMON%\init.bat %1

sed -i 's/\/MD \/O2/\/DWIN32 \/D_WINDOWS \/w \/DNDEBUG \/nologo \/O2 \/GL \/MD \/Zi \/w \/MP%NUMBER_OF_PROCESSORS% %AVX:/=\/% \/Fdlibdeflatestatic.pdb \/FS/g' %CYGPATH_SRC%/%1/makefile.msc
sed -i 's/LDFLAGS =/LDFLAGS =\/DEBUG\ \/NOLOGO \/LTCG \/OPT:REF,ICF/g' %CYGPATH_SRC%/%1/makefile.msc
sed -i 's/AR = lib/AR = lib \/NOLOGO \/LTCG /g' %CYGPATH_SRC%/%1/makefile.msc

nmake %NMAKE_OPTS% /f Makefile.msc libdeflatestatic.lib libdeflate.dll libdeflate.lib

for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\libdeflate.%%X %PATH_INSTALL%\bin\*)
for %%X in (libdeflate.lib libdeflatestatic.lib libdeflatestatic.pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%%X %PATH_INSTALL%\lib\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libdeflate.dll

xcopy /C /F /Y %PATH_SRC%\%1\libdeflate.h %PATH_INSTALL%\include\*