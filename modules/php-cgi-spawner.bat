@echo off && call %PATH_MODULES_COMMON%\init.bat %1
cd /D %PATH_SRC%\%1\src
call cl /nologo /std:clatest /w /MD /Zi /O2 /GL /MD /Zi /MP16 %AVX% /DNDEBUG /c /FS php-cgi-spawner.c
rc -nologo -r php-cgi-spawner.rc
link /nologo /debug /LTCG /OPT:ICF,REF /PDB:php-cgi-spawner.pdb php-cgi-spawner.obj php-cgi-spawner.res /subsystem:windows /MERGE:.rdata=.text 
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_SRC%\%1\src\php-cgi-spawner.exe
for %%X in (exe pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\src\php-cgi-spawner.%%X %PATH_INSTALL%\bin\*)