cd /D C:\httpd-sdk\src\sqlite-amalgamation
rm -f *.exe *.obj *.pdb *.idb
cl /nologo /GL /GS- /Oy- /w /guard:cf- /FD /GF /Zc:inline /MP8 /LD /MD /Zi /Ox shell.c sqlite3.c -Fesqlite3.exe