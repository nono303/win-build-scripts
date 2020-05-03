@echo off && call %PATH_MODULES_COMMON%\init.bat %1
cd /D %PATH_SRC%\%1\src
cl /nologo /GL /GS- /Oy- /guard:cf- /FD /GF /LD /MD /Ox /Zc:inline /w %AVX% php-cgi-spawner.c
rc -nologo -r php-cgi-spawner.rc
link /nologo /debug /LTCG /OPT:ICF /PDB:php-cgi-spawner.pdb php-cgi-spawner.obj php-cgi-spawner.res /subsystem:windows /MERGE:.rdata=.text 
call do_php %PATH_UTILS%\sub\bininfo.php %PATH_SRC%\%1\src\php-cgi-spawner.exe null checkavx