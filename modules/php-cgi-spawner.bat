@echo off && call %PATH_MODULES_COMMON%\init.bat %1
cd /D %PATH_SRC%\%1\src
cl /c /nologo /O2 /GL /MD /Zi /w %AVX% php-cgi-spawner.c
rc -nologo -r php-cgi-spawner.rc
link /nologo /debug /LTCG /OPT:ICF,REF /PDB:php-cgi-spawner.pdb php-cgi-spawner.obj php-cgi-spawner.res /subsystem:windows /MERGE:.rdata=.text 
call do_php %PATH_UTILS%\sub\bininfo.php %PATH_SRC%\%1\src\php-cgi-spawner.exe null checkavx